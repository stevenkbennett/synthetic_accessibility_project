from rdkit.Chem import AllChem as rdkit
import numpy as np
import pywindow as pw
import itertools as it
from sklearn.metrics.pairwise import euclidean_distances
from scipy.spatial.distance import euclidean
from typing import List, Union
from rdkit.Geometry.rdGeometry import Point3D


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


def get_cavity_size(mol: rdkit.Mol, origin, conformer):
    """Calculates diameter of the conformer from `origin`.

    The cavity is measured by finding the atom nearest to
    `origin`, correcting for van der Waals diameter and multiplying
    by -2.

    Args:
        mol: Molecule to calculate diameter of.
        origin: Coordinates of the position from which
        the cavity is measured.
        conformer: ID of the conformer to use.
    Returns:
        (float): Cavity size of the molecule.
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


def all_atom_coords(mol: rdkit.Mol, conformer=-1):
    """
    Yields the coordinates of atoms in :attr:`mol`.
    Parameters
    ----------
    conformer : :class:`int`, optional
        The id of the conformer to be used.
    Yields
    ------
    :class:`tuple`
        The yielded :class:`tuple` has the form
        .. code-block:: python
            (32, numpy.array([12, 34, 3]))
        Where the first element is the atom id and the second
        element is an array holding the coordinates of the atom.
    """

    # Get the conformer from the rdkit instance.
    conf = mol.GetConformer(conformer)

    # Go through all the atoms and ask the conformer to return
    # the position of each atom. This is done by supplying the
    # conformers `GetAtomPosition` method with the atom's id.
    for atom in mol.GetAtoms():
        atom_id = atom.GetIdx()
        atom_position = conf.GetAtomPosition(atom_id)
        yield atom_id, np.array([*atom_position])


def get_centroid(mol, conformer=-1):
    """
    Returns the centroid of the molecule.
    Parameters
    ---------
    conformer : :class:`int`, optional
        The id of the conformer to use.
    Returns
    -------
    :class:`numpy.array`
        A numpy array holding the position of the centroid.
    """

    centroid = sum(x for _, x in all_atom_coords(mol, conformer))
    return np.divide(centroid, mol.GetNumAtoms())


def apply_shift(mol: rdkit.Mol, shift, conformer=-1):
    """
    Shifts the coordinates of all atoms.
    This does not modify the molecule. A modified copy is returned.
    Parameters
    ----------
    shift : :class:`numpy.array`
        A numpy array holding the value of the shift along each
        axis.
    conformer : :class:`int`, optional
        The id of the conformer to use.
    Returns
    -------
    :class:`rdkit.Chem.rdchem.Mol`
        A copy of the molecule where the coordinates have been
        shifted by `shift`.
    """

    # The function does not modify the existing conformer, as a
    # result a new instance is created and used for modification.
    conf = rdkit.Conformer(mol.GetConformer(conformer))

    # For each atom, get the atomic positions from the conformer
    # and shift them. Create a new geometry instance from these new
    # coordinate values. The geometry instance is used by rdkit to
    # store the coordinates of atoms. Finally, set the conformers
    # atomic position to the values stored in this newly generated
    # geometry instance.
    for atom in mol.GetAtoms():

        # Remember the id of the atom you are currently using. It
        # is used to change the position of the correct atom at the
        # end of the loop.
        atom_id = atom.GetIdx()

        # `atom_position` in an instance holding in the x, y and z
        # coordinates of an atom in its 'x', 'y' and 'z'
        # attributes.
        atom_position = np.array(conf.GetAtomPosition(atom_id))

        # Inducing the shift.
        new_atom_position = atom_position + shift

        # Creating a new geometry instance.
        new_coords = Point3D(*new_atom_position)

        # Changes the position of the atom in the conformer to the
        # values stored in the new geometry instance.
        conf.SetAtomPosition(atom_id, new_coords)

    # Create a new copy of the rdkit molecule instance representing
    # the molecule - the original instance is not to be modified.
    new_mol = rdkit.Mol(mol)

    # The new rdkit molecule was copied from the one held in the
    # `mol` attribute, as result it has a copy of its conformer. To
    # prevent the rdkit molecule from holding multiple conformers
    # the `RemoveAllConformers` method is run first. The shifted
    # conformer is then given to the rdkit molecule, which is
    # returned.
    new_mol.RemoveAllConformers()
    new_mol.AddConformer(conf)
    return new_mol


def set_position(mol: rdkit.Mol, position, conformer=-1):
    """
    Sets the centroid of the molecule to `position`.
    Parameters
    ----------
    position : :class:`numpy.array`
        This array holds the position on which the centroid of the
        molecule should be placed.
    conformer : :class:`int`, optional
        The id of the conformer to be used.
    Returns
    -------
    :class:`rdkit.Chem.rdchem.Mol`
        The ``rdkit`` molecule with the centroid placed at
        `position`. This is the same instance as that in
        :attr:`Molecule.mol`.
    """

    conf_id = mol.GetConformer(conformer).GetId()

    # Get the original centroid.
    centroid = get_centroid(mol, conf_id)
    # Find out how much it needs to shift to reach `position`.
    shift = position - centroid
    # Apply the shift and get the resulting rdkit conformer object.
    new_conf = apply_shift(mol, shift, conf_id).GetConformer()
    new_conf.SetId(conf_id)

    # Replace the old rkdit conformer with one where the centroid
    # is at `position`.
    mol.RemoveConformer(conf_id)
    mol.AddConformer(new_conf)

    return mol


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
