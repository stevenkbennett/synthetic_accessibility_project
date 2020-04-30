"""
Synthetic Accessibility Model Training
==============
"""
import logging
import os
from collections import Counter
from pathlib import Path

import joblib
import numpy as np
import pandas as pd
from mordred import Calculator, descriptors
from rdkit.Chem import AllChem as rdkit
from sklearn import svm
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    accuracy_score,
    make_scorer,
    precision_score,
    recall_score
)
from sklearn.model_selection import StratifiedKFold, cross_validate
from sklearn.neural_network import MLPClassifier

logger = logging.getLogger(__name__)


def get_fingerprint_as_bit_counts(mol):
    '''
    Gets Morgan fingerprint bit counts.

    Args:
        mol : The molecule in :mod:`rdkit` format
        to have its fingerprints calculated.
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


class Model:
    '''
    Represents the synthetic accesibility prediction model.

    Args:
        scores (dict) : Contains cross-validation scores, updated
        after calling :meth":`train`.

    random_key (int) : Random key to use in each ML model.

    oversampling (bool) : Defines whether oversampling is
    used while training the model. Involves supplementing
    data from the minority class.

    class_weights (str) : Defines the type of class weights to use while
    training the ML model.

    data (DataFrame) : Contains data for training the model.

    model : ML model.

    fingerprints: :class:`numpy.array`
        Array of fingerprints for each molecule in `.data`.

    '''

    def __init__(
        self,
        random_state=None,
        num_processes=1,
    ):
        '''
        Initialises the training settings and random state.

        Parameters
        ----------
        random_state : :class:`int`, optional
            Random state used in ML models.

        num_processes : :class:`int`, optional
            Number of CPU cores to use for training.
        '''
        self.scores = {}
        self.num_processes = num_processes
        self._train_settings()
        self.random_state = random_state

    def _train_settings(
        self,
        oversampling=False,
        class_weights=True,
    ):
        '''
        Sets up the settings for training the ML model.

        Note
        ----
        This function is called upon initialisation.
        '''
        self.oversampling = oversampling
        if class_weights:
            self.class_weights = 'balanced'

    def get_features(self):
        '''
        Calculate all chemical descriptors using Mordred.

        Returns
        -------
        features : :class:`pandas.DataFrame`
            DataFrame containing chemical descriptors, calculated using
            Mordred.
        '''
        mols = []
        for row in self.data.itertuples():
            mols.append(rdkit.MolFromSmiles(row.Smiles))
        calc = Calculator(descriptors, ignore_3D=True)
        return calc.pandas(mols)

    def load_data(self, data_path):
        '''
        Loads the training data files.

        Parameters
        ----------
        data : :class:`str`
            Path to the `csv` data file used for loading.
        '''
        if data_path.endswith('.csv'):
            self.data = pd.read_csv(
                data_path,
            )
            # Call :meth:`parse_data` to label the DataFrame.
            self.parse_data()
        return

    def parse_data(self):
        '''
        Parses the original `csv` data, adding labels to
        `.data`.
        '''
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
        Initialises the logistic regression model.
        '''
        self.model = LogisticRegression(
            class_weight=self.class_weights,
            solver='liblinear',
            random_state=self.random_state,
        )

    def svm(self, linear=True):
        '''
        Initialises the support vector machine model.
        '''
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
        '''
        Initialises the random forest classification model.
        '''
        self.model = RandomForestClassifier(
            n_estimators=10,
            class_weight=self.class_weights,
            random_state=self.random_state,
        )

    def multi_layer_perceptron(self):
        '''
        Initialises the multi-layer perceptron model.
        '''
        self.model = MLPClassifier(
            solver='adam',
            random_state=self.random_state,
        )

    def train(
        self,
        X=None,
        y=None,
        splits=StratifiedKFold,
        dump=True,
        dump_path=os.getcwd()
    ):
        '''
        Trains the ML model using cross-validation.

        The model that will be trained is in `self.model`.

        Parameters
        ----------
        X : :class:`numpy.array`, optional
            Data used to train the model. If `None`,
            uses the default training data.

        y : :class:`numpy.array`, optional
            Classification data used for the synthetic
            accessibility model.

        splits : :class:`sklearn.model_selection.StratifiedKFold`
            Splitting type to use for training the model.

        dump : :class:`bool`
            Whether to dump the trained model.

        dump_path : :class:`str`
            Path to dump the trained model.
        '''
        if not X or not y:
            logging.debug('Loading default data.')
            X = self.fingerprints
            y = self.labels
        scores = cross_validate(
            estimator=self.model,
            X=X,
            y=y,
            n_jobs=self.num_processes,
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
        )

        accuracy = scores['test_accuracy'].mean()
        p0 = scores['test_precision_0'].mean()
        r0 = scores['test_recall_0'].mean()
        p1 = scores['test_precision_1'].mean()
        r1 = scores['test_recall_1'].mean()
        # Gets gets the name of the model from the dictionary.
        model_name = str(self.model).split('(')[0]
        # Appends scores of the model to the dictionary.
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
            # Dumps the model.
            joblib.dump(self.model, os.path.join(
                dump_path, model_name+'.joblib'))


def main():
    logging.basicConfig(level=logging.DEBUG)

    model = Model(
        num_processes=10,
        random_state=13,
    )

    default_data = Path(__file__).parent.joinpath(
        'databases',
        'combined_data.csv'
    )
    # Loads the CSV data file.
    model.load_data(str(default_data))
    # Creates logistic regression model
    model.random_forest()
    # Trains the current model.
    model.train(dump=True)


if __name__ == '__main__':
    main()
