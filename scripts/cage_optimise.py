"""
Author: Steven Bennett

A script to optimise a set of cages, using multiprocessing.
This script does not use `Population` from 'stk', but instead implements
its own multiprocessing to perform optimisations using MacroModel.

Molecular dynamics optimisation settings:
Structures produced by stk were optimized in MacroModel using a three-stage
approach.
First, only the bonds added to the precursors during cage assembly were
geometry optimized using the OPLS3 force field,34 while keeping all
other intramolecular distances fixed. Second, the entire molecule was
optimized, and finally, a molecular dynamics (MD) run was performed to
search for low energy conformations. Each cage underwent an MD simulation
for 2 ns after a 100 ps equilibration, with a time step of 1 fs and at a
temperature of 700 K. At 50 points during the MD trajectory, the cage
structure was geometry optimized and the lowest energy sampled conformation
was then used for further analysis. The convergence criteria for all
geometry optimizations was a maximum of 2500 iterations and a gradient
of 0.05.
"""
# stk commit ID when written: 81f19ca0a33679f3c81ab0125ccc8a9018323780
# Branch name: `working`
import stk
from typing import List
from pathos.pools import _ProcessPool as ProcessPool
import argparse
from uuid import uuid4
import os
from tqdm import tqdm
from functools import partial
from pathlib import Path
from pymongo import MongoClient
import csv
import logging
from pymongo.errors import ServerSelectionTimeoutError
import random

macromodel_path = "/opt/schrodinger2018-1"

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)


# Define the formatter for logging messages.
try:
    f = "\n" + "=" * os.get_terminal_size().columns + "\n\n"
except OSError:
    # When testing os.get_terminal_size() will fail because stdout is
    # not connected to a terminal.
    f = "\n" + "=" * 100 + "\n\n"

# Formatting the logger.
formatter = logging.Formatter(
    fmt=f + ("%(asctime)s - %(levelname)s - %(name)s - %(message)s"),
    datefmt="%H:%M:%S",
)

streamhandler = logging.StreamHandler()
streamhandler.setFormatter(formatter)
logger.addHandler(streamhandler)


def get_key(aldehyde_smiles, amine_smiles):
    """Returns key based on aldehydes SMILES + ',' + amine SMILES."""
    return aldehyde_smiles + "," + amine_smiles


def store_mol(key, mol, db, collection_name):
    mol_dict = {
        "_id": key,
        "stk_obj": mol.to_dict(),
    }
    db[collection_name].insert_one(mol_dict)


def load_precursors(path):
    """Loads precursors from file containing SMILES.

    Precursors must be in a `.csv` file, with the aldehyde in column 1 and the
    amine in column 2.

    Args:
        path: Path to file containing SMILES.

    Returns:
        List[List[str]]: List of lists containing SMILES from file.
    """
    with open(path, "r") as f:
        # Load SMILES, ensuring string is not empty.
        reader = csv.reader(f, delimiter=",")
        return [row for row in reader]


def optimise_parallel(
    path, temp_dir, processes, chunksize, collection_name, db_name, db_url
):
    """Creates cage from a database of precursor SMILES and optimises them.

    Args:
        precursors_path: Path to the file containing precursor SMILES.
        temp_dir: Path of temporary directory to optimise files in.
        processes: Number of processes to run.
    """
    # Create pool of processes.
    pool = ProcessPool(processes)
    logger.debug(f"Number of processes: {processes}\nChunksize: {chunksize}")
    precursors = load_precursors(path)
    random.shuffle(precursors)
    optimiser_sequence = stk.Sequence(
        stk.MacroModelForceField(
            macromodel_path,
            restricted=True,
        ),
        stk.MacroModelForceField(
            macromodel_path,
            restricted=False,
        ),
        stk.MacroModelMD(
            macromodel_path,
            temperature=700,
            conformers=50,
            time_step=1,
            eq_time=100,
            simulation_time=2000,
        ),
    )
    # Create partial function with the optimiser callable.
    optimiser_func = partial(
        macromodel_optimisation,
        temp_dir=temp_dir,
        optimiser=optimiser_sequence,
        collection_name=collection_name,
        db_name=db_name,
        db_url=db_url,
    )
    # Perform parallel optimisation.
    logger.info("Performing optimisations")
    try:
        for optimised_cage in tqdm(
            pool.imap_unordered(
                optimiser_func, precursors, chunksize=chunksize
            ),
            desc="Performing optimisation on cages",
        ):
            continue
    except Exception as err:
        # Ensure the pool is closed.
        logger.error(err)
        pool.terminate()


def macromodel_optimisation(
    precursors, optimiser, temp_dir, collection_name, db_name, db_url
):
    """
    Optimises cages and returns the modified cage.

    Args:
        precursors: SMILES of precursors to be optimised.
        optimise: Optimiser callable to use.
        temp_dir: Path of temporary directory to optimise files in.
        collection_name: Name of the collection in the MongoDB database.
        db_name: Name of the MongoDB database.
    """
    aldehyde, amine = precursors
    key = get_key(aldehyde, amine)
    cage = stk.ConstructedMolecule(
        (
            stk.BuildingBlock(amine, functional_groups=["primary_amine"]),
            stk.BuildingBlock(aldehyde, functional_groups=["aldehyde"]),
        ),
        topology_graph=stk.cage.FourPlusSix(),
    )
    # Establishing connection to MongoDB must be done in each child process.
    client = MongoClient(db_url)
    db = client[db_name]
    run_name = str(uuid4().int)
    workdir = os.getcwd()
    if temp_dir:
        # Move to temp_dir before optimisation starts.
        os.chdir(temp_dir)

    # Checking for molecules in the cache.
    try:
        cached_mol = db[collection_name].find_one({"_id": key})
    except ServerSelectionTimeoutError:
        logger.error("Cannot connect to MongoDB.")
        return
    if cached_mol is not None:
        # If cached molecule exists, do not need to optimise.
        logger.info(f"{cage} in database.")
    else:
        try:
            optimiser.optimize(cage)
        # Catch exceptions from optimising.
        except Exception as err:
            logger.error(err)
            os.chdir(workdir)
            return

    # Return to original directory.
    os.chdir(workdir)

    # Write the cage once optimised.
    try:
        # Try to store the molecule in the database.
        store_mol(key=key, mol=cage, db=db, collection_name=collection_name)
        logger.info("Finished optimisation. Appending to MongoDB.")
    # Catch exceptions from appending to the database.
    # Continue to dump if an error occurs here.
    except Exception as err:
        logger.error(err)
        logger.error("An error occurred. Exiting the optimisations.")
        return
    # Dump the cages, even if they can't be
    # added to the database.
    logger.debug(f"Dumping {cage}.")
    cage.dump(f"opt_{run_name}.json")
    cage.write(f"opt_{run_name}.mol")
    # If dumped, update the molecule identifier.
    db[collection_name].update_one(
        {"_id": key}, {"$set": {"identifier": run_name}}
    )
    logger.info(f"Finished optimisation for {cage}.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Optimise cages.")
    parser.add_argument(
        "-p",
        help=(
            "Path to set of precursors. Precursors must"
            "be given as SMILES in a csv file, with the aldehyde in column 1"
            " and the amine in column 2."
        ),
        type=str,
    )
    parser.add_argument(
        "-o",
        help=("Name of the collection to store the cages."),
        type=str,
    )
    parser.add_argument(
        "-d",
        help=("Name of the database to store the cages."),
        type=str,
    )
    parser.add_argument(
        "-t",
        help=("Path of temporary directory to write files."),
        type=str,
        default=None,
    )
    parser.add_argument(
        "-c",
        help=("Chunksize to split the cages into."),
        type=int,
        default=1,
    )
    parser.add_argument(
        "-u", type=str, help="URL of the MongoDB client to connect to"
    )
    # Check number of processes to create.
    args = parser.parse_args()
    processes = int(os.environ.get("NCPUS", 1))
    # Create folders for optimisation.
    Path.mkdir(Path(args.o), exist_ok=True)
    # Move inside the optimisation folder.
    os.chdir(args.o)
    if processes > 1:
        optimise_parallel(
            path=args.p,
            temp_dir=args.t,
            processes=processes,
            chunksize=args.c,
            collection_name=args.o,
            db_name=args.d,
            db_url=args.u,
        )
        logger.info("Finished dumping optimised cages.")
