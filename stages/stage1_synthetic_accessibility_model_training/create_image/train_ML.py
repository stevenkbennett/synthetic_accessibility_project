'''
Code to train ML models.
'''
from sklearn import linear_model
from rdkit.Chem import PandasTools
import pandas as pd


class Models:
    '''
    A class to contain ML models
    '''

    def load_data(self, data):
        '''
        Loads the data files.
        '''
        self.data = pd.read_csv(data)

    def parse_data(self):
        PandasTools.AddMoleculeColumnToFrame(
            self.data,
            'Smiles',
            'Molecule',
            includeFingerprints=True
        )
        

        

    def logistic_regression():
        reg = linear_model.LogisticRegression(
            penalty='L1',
            solver='liblinear'
            )
        