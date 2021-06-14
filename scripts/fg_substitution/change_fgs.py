"""
Changes functional group in molecules.

"""

import argparse
import os
import rdkit.Chem.AllChem as rdkit
import multiprocessing as mp
from functools import partial
from glob import glob
from os.path import join
import logging

logger = logging.getLogger(__name__)

init_funcs = {'.mol': rdkit.MolFromMolFile,
              '.mol2': rdkit.MolFromMol2File}


def update_stereochemistry(mol):
    for atom in mol.GetAtoms():
        atom.UpdatePropertyCache()
    rdkit.AssignAtomChiralTagsFromStructure(mol)
    rdkit.AssignStereochemistry(mol, True, True, True)


def etkdg(mol, params):
    rdkit.SanitizeMol(mol)
    update_stereochemistry(mol)

    # Give it 3D coords.
    rdkit.EmbedMultipleConfs(mol, 100, params)

    # Get rid of redundant conformers.
    conf = mol.GetConformer(min(conf_energies(mol))[1])
    conf = rdkit.Conformer(conf)
    conf.SetId(0)
    mol.RemoveAllConformers()
    mol.AddConformer(conf)


def mmff(mol):
    rdkit.SanitizeMol(mol)
    rdkit.MMFFOptimizeMolecule(mol)


def uff(mol):
    rdkit.SanitizeMol(mol)
    rdkit.UFFOptimizeMolecule(mol)


# Used to optimize constructed molecules.
opt_fns = {
    'uff': uff,
    'mmff': mmff,
    'etkdg': lambda mol: etkdg(mol, rdkit.ETKDG()),
    'etkdg2': lambda mol: etkdg(mol, rdkit.ETKDGv2()),
    'none': lambda mol: mol
}

# When adding new functional groups make sure that the first SMARTS
# in the tuple begins with the atom which has a bond added when the
# fg is being added to another molecule and the second SMARTS matches
# the atom which gets bonded to the functional group.
fgs = {
    'amine': ('[N]([H])[H]', '[$([*][N]([H])[H])]'),

    'aldehyde': ('[C](=[O])[H]', '[$([*][C](=[O])[H])]'),

    'carboxylic_acid': ('[C](=[O])-[O][H]',
                        '[$([*][C](=[O])-[O][H])]'),

    'fluorine': ('[F]', '[$([*][F])]'),

    'chlorine': ('[Cl]', '[$([*][Cl])]'),

    'bromine': ('[Br]', '[$([*][Br])]'),

    'iodine': ('[I]', '[$([*][I])]'),

    'astatine': ('[As]', '[$([*][As])]'),

    'alcohol': ('[C]([H])([H])-[O][H]',
                '[$([*][C]([H])([H])-[O][H])]'),

    'alcohol2': ('[O][H]', '[$([*][O][H])]'),

    'alkene': ('[C]=[C]([H])[H]', '[$([*][C]=[C]([H])[H])]'),

    'alkyne': ('[C]#[C][H]', '$([*][C]#[C][H])'),

    'thiol': ('[S][H]', '[$([*][S][H])'),

    'amide': ('[C](=[O])[N]([H])[H]',
              '[$([*][C](=[O])[N]([H])[H])]'),

    'boronic_acid': ('[B]([O][H])[O][H]',
                     '[$([*][B]([O][H])[O][H])]'),

    'xenon': ('[Xe]', '[$([*][Xe])]'),

    'methyl': ('[C]([H])([H])[H]', '[$([*][C]([H])([H])[H])]'),

    'ethyl': ('[C]([H])([H])[C]([H])([H])[H]',
              '[$([*])][C]([H])([H])[C]([H])([H])[H]'),

    'propyl': ('[C]([H])([H])[C]([H])([H])[C]([H])([H])[H]',
               '[$([*][C]([H])([H])[C]([H])([H])[C]([H])([H])[H])]')

}


def flatten(iterable):
    for x in iterable:
        if hasattr(x, '__iter__'):
            yield from flatten(x)
        else:
            yield x


def tag_fg_atoms(mol, fg):
    """
    Adds properties to atoms in `mol` which belong to `fg`.

    Atoms belonging to the functional group are given the property
    'fg'. Atoms not part of the functional group but bonded to it are
    given the property 'attached'. The value held by the property
    'attached' is a unique id for that atom, which does not change
    when other atoms are removed or added.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        The molecule having functional group atoms tagged.

    fg : :class:`tuple` of :class:`str`
        The first string holds the SMARTS identifying atoms to be
        tagged as 'fg'. The second string holds SMARTS identifying
        atoms to be tagged as 'attached'.

    Returns
    -------
    None : :class:`NoneType`

    """

    fg_mol = rdkit.MolFromSmarts(fg[0])
    for idx in flatten(mol.GetSubstructMatches(fg_mol)):
        atom = mol.GetAtomWithIdx(idx)
        atom.SetProp('fg', '1')

    attached_mol = rdkit.MolFromSmarts(fg[1])
    matches = flatten(mol.GetSubstructMatches(attached_mol))
    for i, idx in enumerate(matches):
        atom = mol.GetAtomWithIdx(idx)
        atom.SetProp('attached', str(i))


def remove_fg_atoms(mol):
    """
    Removes all atoms with the tag 'fg'.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        The molecule having functional group atoms tagged.

    Returns
    -------
    :class:`tuple`
        The first element is a :class:`rdkit.Chem.rdchem.Mol`,
        which is the molecule with atoms removed. The second element
        is a :class:`dict`. It maps the id of an atom bonded to the
        functional group to the coordinates of the functional group
        atom it was bonded to.

    """

    positions = {}
    emol = rdkit.EditableMol(mol)
    conf = mol.GetConformer()
    for atom in reversed(mol.GetAtoms()):
        aid = atom.GetIdx()
        if atom.HasProp('fg'):
            # Save the position of the deleted fg atom with the id of
            # the 'attached' atom.
            for n in atom.GetNeighbors():
                if n.HasProp('attached'):
                    id_ = n.GetProp('attached')
                    positions[id_] = conf.GetAtomPosition(aid)
            emol.RemoveAtom(aid)
    return emol.GetMol(), positions


def count_attached(mol):
    """
    Counts the number of atoms labelled 'attached'.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        A molecule to have 'attached' atoms counted.

    Returns
    -------
    :class:`int`
        The number of atoms with the property 'attached' in `mol`.

    """

    return sum(1 for a in mol.GetAtoms() if a.HasProp('attached'))


def bond_fragments(mol):
    """
    Creates bonds beween fragments.

    Creates single bonds between atoms with the property 'attached'.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        A molecule composed of fragments which are to be joined.

    Returns
    -------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        The molecule with all the fragments joined.

    """

    frags = list(rdkit.GetMolFrags(mol))
    main = max(frags, key=len)
    frags.remove(main)
    attached_atoms = (
        atom_id for atom_id in main
        if mol.GetAtomWithIdx(atom_id).HasProp('attached')
    )
    emol = rdkit.EditableMol(mol)
    for main_atom, fg in zip(attached_atoms, frags):
        emol.AddBond(main_atom, fg[0], rdkit.BondType.SINGLE)

    return emol.GetMol()


def conf_energies(mol):
    """
    Yields the energy of each conformer.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        The molecule whose conformers have their energy calculated.

    Yields
    ------
    :class:`tuple`
        The first element is the energy of the conformer and the second
        element is the id of the conformer.

    """

    ff = rdkit.UFFGetMoleculeForceField
    for conf in mol.GetConformers():
        id_ = conf.GetId()
        yield ff(mol, confId=id_).CalcEnergy(), id_


def remake_mol(mol):
    """
    Creates a copy of `mol` from scratch.

    This fixes fucked up valences which occur otherwise.

    Paramters
    ---------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        The molecule to be copied.

    Returns
    -------
    class:`rdkit.Chem.rdchem.Mol`
        A copy of `mol`.

    """

    emol = rdkit.EditableMol(rdkit.Mol())
    for atom in mol.GetAtoms():
        emol.AddAtom(rdkit.Atom(atom.GetAtomicNum()))
    for bond in mol.GetBonds():
        emol.AddBond(bond.GetBeginAtomIdx(),
                     bond.GetEndAtomIdx(),
                     bond.GetBondType())
    new_mol = emol.GetMol()
    new_mol.AddConformer(rdkit.Conformer(mol.GetConformer()))
    return new_mol


def set_position(mol, end_coord_0):
    """
    Shifts the position of `mol`.

    `mol` is shifted so that its atom with id of ``0`` has the position
    given by `end_coord_0`.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        A mol which is to have its position shifted.

    end_coord_0 : :class:`rdkit.Point3D`
        The target position for atom ``0`` of `mol`.

    Returns
    -------
    None : :class:`NoneType`

    """

    conf = mol.GetConformer()
    start_coord_0 = conf.GetAtomPosition(0)
    shift = end_coord_0 - start_coord_0

    for atom_id in range(mol.GetNumAtoms()):
        start_coord = conf.GetAtomPosition(atom_id)
        end_coord = start_coord + shift
        conf.SetAtomPosition(atom_id, end_coord)


def add_new_fg(mol, fg, positions):
    """
    The functional group is added to the atoms with the 'attached'
    property.

    Parameters
    ----------
    mol : :class:`rdkit.Chem.rdchem.Mol`
        The molecule having functional group atoms tagged.

    fg : class:`str`
        The SMARTS of the functional group being added to the molecule.

    positions : :class:`dict`
        Maps the id of an 'attached' atom to the position of the
        functional group atom bonded to it.

    Returns
    -------
    :class:`rdkit.Chem.rdchem.Mol`
        The molecule with functional groups added.

    """

    fg = rdkit.MolFromSmarts(fg)
    fg.GetAtomWithIdx(0).SetProp('attached', '1')
    rdkit.EmbedMolecule(fg, rdkit.ETKDG())

    for atom in mol.GetAtoms():
        if atom.HasProp('attached'):
            set_position(fg, positions[atom.GetProp('attached')])
            mol = rdkit.CombineMols(mol, fg)

    return bond_fragments(mol)


def change_fg(molfile, start, end, fgs, opt_fn):
    """
    Changes the functional group of a molecule.

    Parameters
    ----------
    molfile : :class:`str`
        The path to a .mol or .mol2 molecular structure file.

    start : :class:`str`
        The name of the functional group in the molecule to be changed.

    end : :class:`str`
        The name of the functional group being added to the molecule.

    fgs : :class:`dict`
        Maps names of functional groups to tuples holding SMARTS of
        atoms to be tagged.

    opt_fn : :class:`str`
        The name of the optimization function to use for the newly
        created molecule. Can be ``'uff'`` for UFF forcefield
        optimization, ``'mmff'`` for MMFF forcefield optimization
        ``'etkdg'`` for ETKDG embedding, ``'etkdg2'`` for ETKDGv2
        embedding or ``None`` for no optimization.

    Returns
    -------
    :class:`tuple`
        The first element of the tuple is a :class:`str` holding the
        name of the molecule as given by `molfile`. This is the file
        root. The second element is a :class:`rdkit.Chem.rdchem.Mol`.
        It is the molecule with the functional group substituted.

    """

    try:
        logger.debug('starting')
        _, ext = os.path.splitext(molfile)
        if ext not in init_funcs:
            raise ValueError(('{} - Not a .mol or'
                              ' .mol2 file.').format(molfile))
        logger.debug('loading')
        mol = rdkit.MolFromMolFile(molfile, removeHs=False)
        logger.debug('tagging')
        tag_fg_atoms(mol, fgs[start])
        logger.debug('removing')
        mol, positions = remove_fg_atoms(mol)
        logger.debug('adding')
        mol = add_new_fg(mol, fgs[end][0], positions)
        # Valence is fucked up unless molecule is remade.
        mol = remake_mol(mol)
        opt_fns[opt_fn](mol)

        logger.debug('done')
        return os.path.splitext(os.path.basename(molfile))[0], mol

    except Exception:
        logger.error(f'An error occured when processing {molfile}.',
                     exc_info=True)


if __name__ == '__main__':
    usage1 = ("python change_fgs.py input_file.mol "
              "aldehyde output_file.mol amine -o etkdg")

    usage2 = ("python change_fgs.py -d input_dir "
              "aldehyde output_dir amine -o etkdg")

    description = f"""
This program substitutes the functional groups of molecules.

Examples:

-----------------------------------------------------------------------

    Substituting the functional groups in a single molecule.

        usage: {usage1}

        This substitutes every aldehyde group in input_file.mol for an
        amine group. The resulting molecule is written to
        output_file.mol. The \"-o etkdg\" is optional, and tells the
        program to optimize the structure of the output molecule using
        the ETKDG algorithm. To see other available optimization
        methods, read the \"optional arguments\" section of this help
        message. To see other available functional groups, see the
        \"positional arguments\" section of this help message.

-----------------------------------------------------------------------

    Substituting the functional groups in all molecules in a directory.

        usage: {usage2}

        This looks at every .mol or .mol2 file in input_dir and
        substitutes the aldehyde groups in each file for an amine
        groups. This is done in parallel, unless the \"-s\" option is
        also added. Otherwise, this example is identical to the example
        above.

-----------------------------------------------------------------------

"""

    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=description)
    parser.add_argument('input_file',
                        help=('The molecular structure file of the '
                              'input molecule. Supported file types '
                              'are .mol and .mol2.'))

    parser.add_argument('initial_fg',
                        choices=list(fgs.keys()),
                        help=('The name of the functional group in '
                              'the input molecule.'))

    parser.add_argument('output_file',
                        help=('The molecular structure file to which'
                              ' the substituted molecule is written. '
                              'Must be a .mol file.'))

    parser.add_argument('final_fg',
                        choices=list(fgs.keys()),
                        help=('The name of the functional group in '
                              'the output molecule.'))

    parser.add_argument('-o', '--opt_fn',
                        choices=list(opt_fns.keys()),
                        default='none',
                        help=('The optimization function to use on'
                              ' the newly constructed molecule.'))

    parser.add_argument('-d', '--directory', action='store_true',
                        help=('If set, input_file and output_file are'
                              ' assumed to be directories holding '
                              ' the molecular structure files.'))

    parser.add_argument('-s', '--serial', action='store_true',
                        help=('If set, run serially on directories,'
                              ' rather than in parallel.'))

    parser.add_argument('-l', '--logging_level',
                        type=int, default=logging.INFO)

    args = parser.parse_args()

    logging.basicConfig(level=args.logging_level)

    if args.directory:
        if not os.path.exists(args.output_file):
            os.mkdir(args.output_file)

        pfunc = partial(change_fg,
                        start=args.initial_fg,
                        end=args.final_fg,
                        fgs=fgs,
                        opt_fn=args.opt_fn)

        if not args.serial:
            with mp.Pool() as pool:
                new_mols = pool.map(pfunc,
                                    glob(join(args.input_file, '*')))
                logger.debug('applied function')
        else:
            new_mols = []
            for name in glob(join(args.input_file, '*')):
                logger.debug(name)
                new_mols.append(pfunc(name))

        logger.debug('writing')

        for i, (molname, mol) in enumerate(new_mols):
            rdkit.MolToMolFile(mol,
                               join(args.output_file,
                                    f'{molname}.mol'),
                               forceV3000=True)

    else:
        _, new_mol = change_fg(
                            args.input_file,
                            args.initial_fg,
                            args.final_fg,
                            fgs,
                            args.opt_fn)
        rdkit.MolToMolFile(new_mol, args.output_file, forceV3000=True)
