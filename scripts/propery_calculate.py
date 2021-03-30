import stk
from rdkit.Chem import AllChem as rdkit
import numpy as np
import itertools as it
from typing import List
from rdkit_tools import (
    get_cavity_size,
    get_windows,
    get_max_diameter,
    set_position,
)
from pymongo import MongoClient
import random
from pymongo.errors import DuplicateKeyError
import argparse
import pandas as pd
from tqdm import tqdm
from functools import partial
from multiprocessing import cpu_count
from pathos.pools import _ProcessPool as ProcessPool


def collapsed(
    mol: rdkit.Mol,
    max_diameter: float,
    window_diff: float,
    cavity_size: float,
) -> bool:
    """Determines whether a molecule is collapsed or not using the below criteria.

    Args:
        mol: Molecule to identify whether it is collapsed.
        max_diameter: Maximum distance between two atoms in the molecule.
        window_diff: Mean difference is window diameters.
        cavity_size:
    """
    md = max_diameter
    if window_diff is None:
        return True
    elif ((4 * window_diff) / (md * 4)) < 0.035 and cavity_size > 1:
        return False
    else:
        return


def get_window_difference(windows: List[float]) -> float:
    """Calculates the average window difference for all windows detected with
    pyWindow.

    Args:
        windows: Windows of cage detected using pyWindow.

    Returns:
        (float): Mean window difference across all windows.
    """
    clusters = [list(windows)]
    # After this sum the differences in each group and then
    # sum the group totals.
    diff_sums = []
    for cluster in clusters:
        diff_sum = sum(abs(w1 - w2) for w1, w2 in it.combinations(cluster, 2))

        diff_num = sum(1 for _ in it.combinations(cluster, 2))

        diff_sums.append(diff_sum / diff_num)

    return np.mean(diff_sums)


def cavity_size(mol: rdkit.Mol) -> float:
    """Calculates cavity size of a molecule.

    Args:
        mol: Molecule to calculate cavity size of.
    Returns:
        (float): Cavity size of cage.
    """
    cavity = -get_cavity_size(mol, [0, 0, 0], -1)
    return cavity if cavity > 0 else 0.0


def make_entry(cage, output_collection, database):
    """Gets geometrically properties of the cage.

    Args:
        cage: Cage to determine whether it is collasped or not.
    Returns:
        (dict): Dictionary containing geometrical properties of the cage.
    """
    # Check if entry already inserted.
    client = MongoClient(
        "ch-sb2518.ch.ic.ac.uk",
        27017,
        connect=False,
        connectTimeoutMS=600000,
        serverSelectionTimeoutMS=600000,
    )
    db = client[database]
    if db[output_collection].count_documents({"_id": str(cage)}) != 0:
        return
    mol = rdkit.Mol(cage.to_rdkit_mol())
    mol.RemoveAllConformers()
    mol.AddConformer(cage.to_rdkit_mol().GetConformer(-1))
    windows = get_windows(mol)
    md = 0.0
    if windows is None:
        wd = window_std = None
    else:
        w = sorted(windows, reverse=True)[:4]
        wd = get_window_difference(w) if len(w) == 4 else None
        window_std = np.std(w) if len(w) == 4 else None
        if wd and window_std:
            md = get_max_diameter(mol)
            mol = set_position(mol, [0, 0, 0])
            cs = cavity_size(mol)
            record = {
                "_id": cage._id,
                "name": str(cage),
                "collapsed": collapsed(mol, md, wd, cs),
                "cavity_size": cs,
                "max_diameter": md,
                "all_windows": windows,
                "window_diameter": wd,
                "window_standard_deviation": window_std,
                "stk_obj": cage.to_dict(),
            }
            try:
                result = db[output_collection].insert_one(record)
                print(f"Succesfully inserted {result.inserted_id}.",
                      flush=True)
            except DuplicateKeyError as err:
                print(err)
            return
    # Return if all fails.
    record = {
        "_id": cage._id,
        "name": str(cage),
        "collapsed": True,
        "cavity_size": 0.0,
        "max_diameter": 0.0,
        "all_windows": 0.0,
        "window_diameter": 0.0,
        "window_standard_deviation": 0.0,
        "stk_obj": cage.to_dict(),
    }
    try:
        result = db[output_collection].insert_one(record)
        print(f"Succesfully inserted {result.inserted_id}.", flush=True)
    except DuplicateKeyError as err:
        print(err)
    return


def get_stk_dicts(input_collection, database):
    client = MongoClient(
        "ch-sb2518.ch.ic.ac.uk",
        27017,
        connect=False,
        connectTimeoutMS=600000,
        serverSelectionTimeoutMS=600000,
    )
    df = pd.DataFrame(list(client[database][input_collection].find({})))
    d = {}
    for row in df.itertuples():
        stk_obj = row.stk_obj
        _id = row._1
        d[_id] = stk_obj
        d[_id]["class"] = "ConstructedMolecule"
    return d


def load_cage(stk_dict):
    _id, stk_obj = stk_dict
    cage = stk.ConstructedMolecule.init_from_dict(stk_obj)
    cage._id = _id
    return cage


def make_database(processes, input_collection, output_collection, database,
                  chunksize):
    print(f"Using {processes} processes for the calculation.")
    with ProcessPool(processes) as pool:
        stk_dicts = get_stk_dicts(input_collection=input_collection,
                                  database=database)
        l = list(stk_dicts.items())
        random.shuffle(l)
        stk_dicts = dict(l)
        chunksize = calculate_chunksize(stk_dicts, processes)
        print(f"Splitting cages into chunks of size {chunksize}.")
        print("Loading cages.", flush=True)
        pop = []
        for cage in tqdm(
                pool.imap_unordered(load_cage,
                                    stk_dicts.items(),
                                    chunksize=chunksize)):
            if cage is not None:
                pop.append(cage)
        print("Finished loading cages. Performing database calculations.")
        _make_entry = partial(make_entry,
                              database=database,
                              output_collection=output_collection)
        cages = pool.imap(_make_entry, pop, chunksize=chunksize)
        for _ in tqdm(cages):
            print(
                f"Completed calculations for cage.",
                flush=True,
            )
        pool.close()


def calculate_chunksize(iterable, processes):
    chunksize, extra = divmod(len(iterable), processes * 4)
    if extra:
        chunksize += 1
    return chunksize


if __name__ == "__main__":
    # CPU count for local calculations.
    processes = cpu_count()
    parser = argparse.ArgumentParser()
    parser.add_argument("-i",
                        type=str,
                        help="Name of the collection containing stk cages.")
    database = "sa_project_optimisations"
    parser.add_argument(
        "-o",
        type=str,
        help="Name of the collection to store the calculated properties.",
    )
    parser.add_argument(
        "-c",
        type=int,
        help="Chunksize to split the cage iterable into.",
        default=None,
    )
    args = parser.parse_args()
    make_database(
        processes=processes,
        input_collection=args.i,
        output_collection=args.o,
        database=database,
        chunksize=args.c,
    )