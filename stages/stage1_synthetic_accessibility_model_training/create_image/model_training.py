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
from sklearn.linear_model import LogisticRegression
from joblib import dump

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

    def __init__(self):
        self.scores = []
        self.train_settings()

    def train_settings(
        self,
        oversampling=False,
        class_weights=True,
    ):
        self.oversampling = oversampling
        if class_weights:
            self.class_weights = 'balanced'

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

        logger.debug(f'Number of fingerprints is {len(fingerprints)}.')
        logger.debug(f'Number of labels is {Counter(labels)}.')

    def logistic_regression(self):
        '''
        Uses logistic regression for making predictions.
        '''
        self.model = LogisticRegression(
            class_weight=self.class_weights,
            solver='liblinear',
        )

    def train(
        self,
        splits=StratifiedKFold,
    ):
        '''
        Trains the specified model.
        '''

        scores = cross_validate(
            estimator=self.model,
            X=self.fingerprints,
            y=self.labels,
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
            }
        )

        accuracy = scores['test_accuracy'].mean()
        p0 = scores['test_precision_0'].mean()
        r0 = scores['test_recall_0'].mean()
        p1 = scores['test_precision_1'].mean()
        r1 = scores['test_recall_1'].mean()

        self.scores.append([
            accuracy,
            p0,
            r0,
            p1,
            r1
        ])
        
        logger.info(f'Accuracy\n{accuracy}')
        logger.info(f'Precision (Unsynthesisable)\n{p0}')
        logger.info(f'Recall (Unsynthesisable)\n{r0}')
        logger.info(f'Precision (Synthesisable)\n{p1}')
        logger.info(f'Recall (Synthesisable)\n{r1}')

        self.model.fit(self.fingerprints, self.labels)


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
    # Dump the model file.
    dump(model.model, 'sa_model_logisticrgr.joblib')




if __name__ == '__main__':
    main()
