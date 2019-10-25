import numpy as np
import os
import gzip
from rdkit.Chem import AllChem as rdkit
import json
import math


def sigmoid(x):
    """Computes sigmoid.

    Parameters
    ----------
    x : :class:`float`
        Value to compute sigmoid of.

    Returns
    -------
    :class:`float`
        Computed sigmoid function value.

    """
    return 1 / (1 + math.exp(-x))


def _load_params(model_path):
    """Loads the model.

    Parameters
    ----------
    model_path : :class:`str`
        Path of the model to be loaded.

    Returns
    -------
    vars : :class:`list` of :class:`numpy.array`
        Weights and bias terms for model.

    """

    with gzip.GzipFile(model_path, 'r') as inp:
        json_bytes = inp.read()
        json_str = json_bytes.decode('utf-8')
        params = json.loads(json_str)
        params = [np.array(x) for x in params]
        return params


def mol_to_fp(mol, fp_rad=2, fp_len=1024):
    """Computes Morgan Fingerprint of :class:`rdkit.Mol`.

    Parameters
    ----------
    mol : :class:`rdkit.Mol`
        `rdkit` molecule for fingerprint calculation.

    fp_rad : :class:`int`
        Radius of the fingerprint.

    fp_len : :class:`int`
        Length of the fingerprint.

    Returns
    -------
    :class: `numpy.ndarray`
        Fingerprint for the molecule.

    """

    if mol is None:
        return np.zeros((fp_len), dtype=np.float32)
    fp = rdkit.GetMorganFingerprintAsBitVect(mol, fp_rad,
                                             nBits=fp_len, useChirality=True)
    return np.array(fp, dtype=np.bool)


class SCScore:
    """SCScore synthetic accesibility scoring class.

    Examples
    -------
    The model requires a function with variables loaded using

    >>> scorer = SCScore().score

    Then the prediction can be made with :class:`rdkit.rdchem.Mol`

    >>> mol = rdkit.MolFromSmiles('c1ccccc1')

    >>> score = scorer(mol)
    """
    def __init__(self):
        """
        Initializes class with weights and bias terms.
        """
        dirname = os.path.dirname(__file__)
        # Default model path.
        model_path = os.path.join(dirname, 'model.ckpt-10654.as_numpy.json.gz')
        # Load variables.
        self.params = _load_params(model_path)

    def score(self, mol):
        """
        SA scoring for molecules.

        Parameters
        ----------
        mol : :class:`rdkit.rdchem.Mol`
            `rdkit` molecule to have score calculated.

        Returns
        -------
        score : :class:`float`
            SA score for the molecule.

        """
        x = mol_to_fp(mol)
        score_scale = 5
        # Computes score for molecule.
        for i in range(0, len(self.params), 2):
            last_layer = (i == len(self.params)-2)
            W = self.params[i]
            b = self.params[i+1]
            x = np.matmul(x, W) + b
            if not last_layer:
                x = x * (x > 0)  # ReLu activation func.
        score = 1 + (score_scale - 1) * sigmoid(x)
        return score
