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
    if windows is None:
        wd = window_std = None
    else:
        w = sorted(windows, reverse=True)[:4]
        wd = get_window_difference(w) if len(w) == 4 else None
        window_std = np.std(w) if len(w) == 4 else None
    mol = set_position(mol, [0, 0, 0])
    cs = cavity_size(mol)
    md = get_max_diameter(mol)
    return (
        str(cage),
        collapsed(mol, md, wd, cs),
        cs,
        md,
        str(windows),
        wd,
        window_std,
    )


def test():
    cage = [
        stk.ConstructedMolecule.load(
            "/Users/stevenbennett/PhD/main_projects/synthetic_accessibility_project/stages/stage2_screening_workflow/create_image/cage_optimisation/data/cage_43.json"
        )
    ]
    print(make_entry(cage[0]))


def test_old_version(finish_val):
    pop = old_stk.Population.load(
        "/Users/stevenbennett/PhD/main_projects/synthetic_accessibility_project/stages/stage2_screening_workflow/create_image/cage_optimisation/old_code_test/cages/amine2aldehyde3.json",
        old_stk.Molecule.from_dict,
    )
    for cage in pop[:finish_val]:
        if cage.topology.__class__.__name__ == "FourPlusSix":
            bb1 = stk.BuildingBlock.init_from_rdkit_mol(
                cage.building_blocks[0].mol, ["aldehyde"]
            )
            bb2 = stk.BuildingBlock.init_from_rdkit_mol(
                cage.building_blocks[1].mol, ["amine"]
            )
            new_cage = stk.ConstructedMolecule(
                [bb1, bb2], stk.cage.FourPlusSix()
            )
            new_cage.update_from_rdkit_mol(cage.mol)
            print(f"Old Results: {make_entry_old(cage)}")
            print(f"New Results: {make_entry(new_cage)}")


def make_database(databases):
    db = sqlite3.connect("cage_prediction.db")
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

    for db_path in databases:
        print(f"Starting on database {db_path}.")
        dbname, _ = splitext(basename(db_path))
        with ProcessPool(2) as pool:
            pop = [
                stk.ConstructedMolecule.load(
                    "/Users/stevenbennett/PhD/main_projects/synthetic_accessibility_project/stages/optimisation_run_0/chunk_42/cage_4.json"
                )
            ]
            cages = pool.map(make_entry, pop)
            cursor.executemany(
                "INSERT INTO cages VALUES (?, ?, ?, ?, ?, ?, ?)", cages,
            )
    db.commit()
    db.close()
    pool.close()


if __name__ == "__main__":
    make_database(
        [
            "/Users/stevenbennett/PhD/main_projects/synthetic_accessibility_project/stages/stage2_screening_workflow/create_image/cage_optimisation/cage_prediction.db"
        ]
    )
