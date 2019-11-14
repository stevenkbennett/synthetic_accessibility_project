'''
Code to train ML models.
'''
from rdkit.Chem import AllChem as rdkit
import pandas as pd
import numpy as np
import logging
from collections import Counter
from pathlib import Path
from sklearn.metrics import (
    make_scorer,
    accuracy_score,
    recall_score,
    precision_score,
)
from sklearn.model_selection import (
    StratifiedKFold,
    cross_validate,
)
from mordred import Calculator, descriptors
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import (
    LogisticRegression,
)
from sklearn.neural_network import MLPClassifier
from sklearn import svm
import joblib
import os

logger = logging.getLogger(__name__)


def get_fingerprint(mol):
    '''
    Gets Morgan fingerprint bit counts.
    '''
    info = {}
    fp = rdkit.GetMorganFingerprintAsBitVect(
        mol=mol,
        radius=2,
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

    def __init__(self, random_state=None):
        self.scores = {}
        self.train_settings()
        self.random_state = random_state

    def train_settings(
        self,
        oversampling=False,
        class_weights=True,
    ):
        self.oversampling = oversampling
        if class_weights:
            self.class_weights = 'balanced'

    def get_features(self):
        '''
        Gets the chemical features using Mordred.
        '''
        mols = []
        for row in self.data.itertuples():
            mols.append(rdkit.MolFromSmiles(row.Smiles))
        calc = Calculator(descriptors, ignore_3D=True)
        df = calc.pandas(mols)
        return df

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
            self.parse_data()
            return
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

        logger.debug(f'Number of fingerprints is {len(fingerprints)}.')
        logger.debug(f'Number of labels is {Counter(labels)}.')

    def logistic_regression(self):
        '''
        Uses logistic regression for making predictions.
        '''
        self.model = LogisticRegression(
            class_weight=self.class_weights,
            solver='liblinear',
            random_state=self.random_state,
        )

    def svm(self, linear=True):
        if linear:
            # Linear SVM.
            self.model = svm.SVC(
                class_weight=self.class_weights,
                kernel='linear',
                random_state=self.random_state,
            )
        else:
            # Non-linear SVM.
            self.model = svm.SVC(
                class_weight=self.class_weights,
                kernel='rbf',
                gamma='auto',
                random_state=self.random_state,
            )

    def random_forest(self):
        self.model = RandomForestClassifier(
            n_estimators=10,
            class_weight=self.class_weights,
            random_state=self.random_state,
        )

    def multi_layer_perceptron(self):
        self.model = MLPClassifier(
            solver='adam',
            random_state=self.random_state,
        )

    def train(
        self,
        X,
        y,
        splits=StratifiedKFold,
        dump=True,
        dump_path=os.getcwd()
    ):
        '''
        Trains the specified model.
        '''
        if not X.any() or not y.any():
            logging.debug('Loading default data.')
            X = self.fingerprints
            y = self.labels
        scores = cross_validate(
            estimator=self.model,
            X=X,
            y=y,
            cv=splits(5),
            scoring={
                'accuracy': make_scorer(accuracy_score),
                'precision_0': make_scorer(
                    score_func=precision_score,
                    pos_label=0,
                    labels=[0],
                ),
                'recall_0': make_scorer(
                    score_func=recall_score,
                    pos_label=0,
                    labels=[0],
                ),
                'precision_1': make_scorer(
                    score_func=precision_score,
                    pos_label=1,
                    labels=[1],
                ),
                'recall_1': make_scorer(
                    score_func=recall_score,
                    pos_label=1,
                    labels=[1],
                ),
            },
<<<<<<< HEAD
            error_score=np.nan,
=======
>>>>>>> cx1
        )

        accuracy = scores['test_accuracy'].mean()
        p0 = scores['test_precision_0'].mean()
        r0 = scores['test_recall_0'].mean()
        p1 = scores['test_precision_1'].mean()
        r1 = scores['test_recall_1'].mean()
        model_name = str(self.model).split('(')[0]
        self.scores.update(
            {
                model_name:
                {
                    'accuracy': accuracy,
                    'p0': p0,
                    'r0': r0,
                    'p1': p1,
                    'r1': r1,
                },
            },
        )

        logger.info(f'Accuracy\n{accuracy}')
        logger.info(f'Precision (Unsynthesisable)\n{p0}')
        logger.info(f'Recall (Unsynthesisable)\n{r0}')
        logger.info(f'Precision (Synthesisable)\n{p1}')
        logger.info(f'Recall (Synthesisable)\n{r1}')

        self.model.fit(self.fingerprints, self.labels)

        if dump:
            joblib.dump(self.model, os.path.join(dump_path, model_name))


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
    # Creates logistic regression model
    model.logistic_regression()
    model.train()


if __name__ == '__main__':
    main()
