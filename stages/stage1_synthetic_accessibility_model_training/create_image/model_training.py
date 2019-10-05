'''
Code to train ML models.
'''
from sklearn import linear_model
from rdkit.Chem import AllChem as rdkit
import pandas as pd
import numpy as np
import logging
from collections import Counter
from pathlib import Path

logger = logging.getLogger(__name__)


def get_fingerprint(mol):
    '''
    Gets Morgan fingerprint bit counts.
    '''
    info = {}
    fp = rdkit.GetMorganFingerprintAsBitVect(
        mol=mol,
        radius=8,
        nBits=512,
        bitInfo=info,
    )
    fp = list(fp)
    for bit, activators in info.items():
        fp[bit] = len(activators)
    return fp


class SAScore:
    '''
    A class to contain ML models for synthetic accessibility scoring.
    '''

    def load_data(self, data_path):
        '''
        Loads the training data files.

        Parameters
        ----------
        data : :class:`str`
            The path to the data file used for loading.
        '''
        if data_path.endswith('.csv'):
            self.data = pd.read_csv(
                data_path,
            )
        else:
            return

    def parse_data(self):
        fingerprints, labels = [], []
        for row in self.data.itertuples():
            molecule = rdkit.MolFromSmiles(row.Smiles)
            fingerprint = np.array(get_fingerprint(molecule))
            fingerprints.append(fingerprint)
            labels.append(row.Score)
        self.fingerprints = np.array(fingerprints)
        self.labels = np.array(labels)

        logger.debug(f'Number of fingerprints is {fingerprints}.')
        logger.debug(f'Number of labels is {Counter(labels)}.')


def main():
    np.random.seed(4)
    logging.basicConfig(level=logging.DEBUG)

    model = SAScore()

    default_data = Path(__file__).parent.joinpath(
        'databases',
        'combined_data.csv'
    )
    # Loads the CSV data file.
    model.load_data(str(default_data))
    # Loads the Morgan Fingerprints as bit counts.
    model.parse_data()
    


if __name__ == '__main__':
    main()