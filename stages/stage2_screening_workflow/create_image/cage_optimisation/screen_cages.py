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
from os.path import splitext, basename
import sqlite3
import time
import argparse
from pathlib import Path
from tqdm import tqdm
import multiprocessing as mp

# from old_code_test.stk import stk as old_stk
# from old_code_test.cage_prediction.database.make_database import (
#     make_entry as make_entry_old,
# )
from pathos.pools import ProcessPool


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


def make_entry(cage: stk.ConstructedMolecule):
    """Gets geometrically properties of the cage.

    Args:
        cage: Cage to determine whether it is collasped or not.
    Returns:
        (dict): Dictionary containing geometrical properties of the cage.
    """
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
    return (
        str(cage),
        collapsed(mol, md, wd, cs),
        cs,
        md,
        str(windows),
        wd,
        window_std,
    )


def make_database(databases, pop_path):

    for db_path in databases:
        db = sqlite3.connect(db_path)
        cursor = db.cursor()
        cursor.execute(
            """
            CREATE TABLE IF NOT EXISTS cages (
                name TEXT,
                collapsed BOOLEAN,
                cavity_size FLOAT,
                max_diameter FLOAT,
                windows TEXT,
                window_diff FLOAT,
                window_std FLOAT
            )"""
        )
        print(f"Starting on database {db_path}.")
        dbname, _ = splitext(basename(db_path))
        with ProcessPool(mp.cpu_count()) as pool:
            pop = [
                stk.ConstructedMolecule.load(str(i))
                for i in tqdm(list(Path(pop_path).glob("**/*.json")))
            ]
            # miniters = int(len(pop) * 0.05)
            print("Performing database calculations.")
            cages = pool.imap(make_entry, pop)
            start_time = time.time()
            print(f"Started calculating at {start_time}.")
            miniters = int(len(pop) * 0.05)
            for cage in tqdm(cages, miniters=miniters):
                cursor.execute(
                    "INSERT INTO cages VALUES (?, ?, ?, ?, ?, ?, ?)", cage,
                )
                db.commit()
                print(f"Cage took {time.time()-start_time} to complete.")

    db.close()
    pool.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", type=str)
    parser.add_argument("-o", type=str)
    args = parser.parse_args()
    make_database([args.o], args.d)
