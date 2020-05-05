import stk
import pywindow as pw
from rdkit.Chem import AllChem as rdkit
import numpy as np
import itertools as it
from sklearn.metrics.pairwise import euclidean_distances
from scipy.spatial.distance import euclidean
from typing import List, Union, Dict
from glob import iglob


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
    elif (4 * window_diff) / (md * 4) < 0.035 and cavity_size > 1:
        return False
    else:
        return False


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
        if diff_num == 0:
            return

        diff_sums.append(diff_sum / diff_num)

    return np.mean(diff_sums)


def get_cavity_size(mol: rdkit.Mol) -> float:
    """Calculates cavity size of a molecule.

    Args:
        mol: Molecule to calculate cavity size of.
    Returns:
        (float): Cavity size of cage.
    """
    cavity = -_cavity_size(mol, [0, 0, 0], -1)
    return cavity if cavity > 0 else 0.0


def _cavity_size(mol: rdkit.Mol, origin, conformer):
    """Calculates diameter of the conformer from `origin`.

    The cavity is measured by finding the atom nearest to
    `origin`, correcting for van der Waals diameter and multiplying
    by -2.

    Args:
        mol: Molecule to calculate diameter of.
        origin: Coordinates of the position from which
        the cavity is measured.    
        conformer: ID of the conformer to use.
    """
    conf = mol.GetConformer(conformer)
    atom_vdw = np.array(
        [atom_vdw_radii[x.GetSymbol()] for x in mol.GetAtoms()]
    )
    distances = euclidean_distances(conf.GetPositions(), np.matrix(origin))
    distances = distances.flatten() - atom_vdw
    return -2 * min(distances)


def get_windows(mol: rdkit.Mol, num_windows=4) -> Union[List[float], None]:
    """Gets the windows present in a molecule.

    Args:
        mol: Molecule to get windows of.
        num_windows: The expected number of windows that
        should be present in a given topology.
    Returns:
        all_windows: Array holding diameters of windows present in the
        molecule.
    """
    pw_molecule = pw.molecular.Molecule.load_rdkit_mol(mol)
    all_windows = pw_molecule.calculate_windows(output="windows")
    if all_windows is None:
        return None
    all_windows = sorted(all_windows, reverse=True)[:num_windows]
    for i, x in enumerate(all_windows):
        if x > 500:
            return None
    return all_windows


def get_max_diameter(mol: rdkit.Mol, conf=-1) -> float:
    """Gets the largest distance between two atoms in a molecule.

    Args:
        mol: Molecule to calculate diameter of.
        conf: Conformer to use to calculate diameter

    Returns:
        maxd: Maximum diameter.
    """
    maxid1, maxid2 = max(
        (x for x in it.combinations(range(mol.GetNumAtoms()), 2)),
        key=lambda x: atom_distance(mol, *x, conf),
    )
    maxd = atom_distance(mol, maxid1, maxid2, conf)
    maxd += (
        atom_vdw_radii[mol.GetAtomWithIdx(maxid1).GetSymbol()]
        + atom_vdw_radii[mol.GetAtomWithIdx(maxid2).GetSymbol()]
    )
    return maxd


def atom_distance(
    mol: rdkit.Mol, atom1_id: int, atom2_id: int, conf=-1
) -> float:
    """Gets distance between two atoms.

    Args:
        mol: Molecule containing the atoms.
        atom1_id: ID of first atom.
        atom2_id: ID of second atom.
        conf: Confomrer of `mol` to use.

    Returns:
        (float): Euclidean distance between two atoms.
    """

    # Get the atomic positions of each atom and use the scipy
    # function to calculate their distance in Euclidean space.
    conf = mol.GetConformer(conf)
    atom1_coords = conf.GetAtomPosition(atom1_id)
    atom2_coords = conf.GetAtomPosition(atom2_id)
    return euclidean(atom1_coords, atom2_coords)


def get_properties(cage: stk.Molecule) -> Dict[str, Union[float, bool]]:
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
        collapsed_res = True
        return
    else:
        window_diff = get_window_difference(windows)
        maxd = get_max_diameter(mol)
        c_size = get_cavity_size(mol)
        collapsed_res = collapsed(mol, maxd, window_diff, c_size)
    return {
        "collapsed": collapsed_res,
        "window_diff": window_diff,
        "max diameter": maxd,
        "cavity size": c_size,
    }


atom_vdw_radii = {
    "Al": 2,
    "Sb": 2,
    "Ar": 1.88,
    "As": 1.85,
    "Ba": 2,
    "Be": 2,
    "Bi": 2,
    "B": 2,
    "Br": 1.85,
    "Cd": 1.58,
    "Cs": 2,
    "Ca": 2,
    "C": 1.7,
    "Ce": 2,
    "Cl": 1.75,
    "Cr": 2,
    "Co": 2,
    "Cu": 1.4,
    "Dy": 2,
    "Er": 2,
    "Eu": 2,
    "F": 1.47,
    "Gd": 2,
    "Ga": 1.87,
    "Ge": 2,
    "Au": 1.66,
    "Hf": 2,
    "He": 1.4,
    "Ho": 2,
    "H": 1.09,
    "In": 1.93,
    "I": 1.98,
    "Ir": 2,
    "Fe": 2,
    "Kr": 2.02,
    "La": 2,
    "Pb": 2.02,
    "Li": 1.82,
    "Lu": 2,
    "Mg": 1.73,
    "Mn": 2,
    "Hg": 1.55,
    "Mo": 2,
    "Nd": 2,
    "Ne": 1.54,
    "Ni": 1.63,
    "Nb": 2,
    "N": 1.55,
    "Os": 2,
    "O": 1.52,
    "Pd": 1.63,
    "P": 1.8,
    "Pt": 1.72,
    "K": 2.75,
    "Pr": 2,
    "Pa": 2,
    "Re": 2,
    "Rh": 2,
    "Rb": 2,
    "Ru": 2,
    "Sm": 2,
    "Sc": 2,
    "Se": 1.9,
    "Si": 2.1,
    "Ag": 1.72,
    "Na": 2.27,
    "Sr": 2,
    "S": 1.8,
    "Ta": 2,
    "Te": 2.06,
    "Tb": 2,
    "Tl": 1.96,
    "Th": 2,
    "Tm": 2,
    "Sn": 2.17,
    "Ti": 2,
    "W": 2,
    "U": 1.86,
    "V": 2,
    "Xe": 2.16,
    "Yb": 2,
    "Y": 2,
    "Zn": 1.29,
    "Zr": 2,
    "X": 1.0,
    "D": 1.0,
}

if __name__ == "__main__":
    main()
