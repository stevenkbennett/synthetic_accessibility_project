import sys
import stk
import numpy as np
from rdkit.Chem import AllChem as rdkit
import pywindow
sys.path.append('/Users/stevenbennett/PhD/main_projects/synthetic_accessibility_project/stages/stage2_evolutionary_algorithm/create_image')
from utilities.sascore.sascorer import calculateScore  # noqa
from utilities.scscore.scscore import SCScore  # noqa


def pore_diameter(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    mol.pore_diameter = pw_mol.calculate_pore_diameter()
    # Ideal pore diameter is 5 A.
    if (
        mol.pore_diameter is not None or
        isinstance(mol.pore_diameter, float)
    ):
        return mol.pore_diameter
    else:
        return mol.pore_diameter


def largest_window(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    mol.largest_window = None
    windows = pw_mol.calculate_windows()
    if windows is not None and len(windows) > 3:
        mol.largest_window = max(windows)
    # Ideal window diameter is 5 A.
    if (
        mol.largest_window is not None or
        isinstance(mol.largest_window, float)
    ):
        return mol.largest_window
    else:
        return mol.largest_window


def window_std(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    windows = pw_mol.calculate_windows()
    mol.window_std = None
    if windows is not None and len(windows) > 3:
        mol.window_std = np.std(windows)
    return mol.window_std


scscore = SCScore()


def sc_score(mol):
    scores = []
    for bb in mol.get_building_blocks():
        rdkit_mol = bb.to_rdkit_mol()
        rdkit_mol.UpdatePropertyCache()
        rdkit.GetSymmSSSR(rdkit_mol)
        rdkit_mol.GetRingInfo()
        scores.append(scscore.score(rdkit_mol))
    mol.sa_score = sum(scores)
    return mol.sa_score


def sa_score(mol):
    scores = []
    for bb in mol.get_building_blocks():
        rdkit_mol = bb.to_rdkit_mol()
        rdkit_mol.UpdatePropertyCache()
        rdkit.GetSymmSSSR(rdkit_mol)
        rdkit_mol.GetRingInfo()
        scores.append(calculateScore(rdkit_mol))
    mol.sa_score = sum(scores)
    return mol.sa_score


fitness_calculator = stk.PropertyVector(
    pore_diameter,
    largest_window,
    window_std,
    sc_score,
    sa_score,
)


def calculate_fitness(pop_path):
    pop = stk.EAPopulation.load(pop_path)
    pop.set_fitness_values_from_calculators(
        fitness_calculator,
        num_processes=3,
    )
    fitness = pop.get_fitness_values()
    return fitness
