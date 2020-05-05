#!/usr/bin/env python
"""
Synthetic Accessibility Scores
==============================

Contains synthetic accesibility functions used for scoring
molecules.

The scoring functions used are:
SAScore
SCScore
Random forest model
"""

import logging
from sklearn.ensemble import RandomForestClassifier
from pprint import pprint
from sklearn.model_selection import (
    cross_validate,
    KFold,
)
from typing import List
import joblib
import numpy as np
import pandas as pd
from rdkit.Chem import AllChem as rdkit


logger = logging.getLogger(__name__)


def get_fingerprint_as_bit_counts(mol: rdkit.Mol) -> List[int]:
    """
    Gets Morgan fingerprint bit counts.

    Args:
        mol : The molecule in :mod:`rdkit` format
        to have its fingerprints calculated.
    """
    info = dict()
    fp = rdkit.GetMorganFingerprintAsBitVect(
        mol=mol, radius=2, nBits=1024, bitInfo=info,
    )
    fp = list(fp)
    for bit, activators in info.items():
        fp[bit] = len(activators)
    return fp


class SyntheticAccesibilityScorer:
    def __init__(
        self,
        sa_funcs="default",
        train=False,
        sa_model_path="utilities/sa_model.joblib",
    ):
        if sa_funcs == "default":
            # Import default scoring functions.
            from utilities.SA_Score.sascorer import calculateScore
            from utilities.scscore.scscore.standalone_model_numpy import (
                SCScorer,
            )

            self.model = Model()
            self.model.load_model(sa_model_path)
            get_score_from_smi = SCScorer().restore().get_score_from_smi
            self.sa_funcs = {
                "scscore": lambda m: get_score_from_smi(rdkit.MolToSmiles(m))[
                    1
                ],  # Lambda function ensures function args
                # are of type `rdkit.Mol`.
                "sascore": calculateScore,
                "rfmodel": self.model.predict_proba,
            }
        # Define ranges for all the SA scores.
        # Used for normalisation.
        self.sa_ranges = {
            "scscore": {"max": 5, "min": 1},
            "sascore": {"max": 10, "min": 1},
            "rfmodel": {"max": 1, "min": 0},
            "combination_range": {"max": 2, "min": 0},
        }

    def calculate_sa(
        self, mol: rdkit.Mol, score_name: str, normalise=True
    ) -> float:
        """Calculate synthetic accesibility scores.

        Args:
            mol: Molecule to have SA score calculated.
            score_name: Name of the SA score to use.
            normalise: Normalise SA scores between 0 and 1.

        Returns:
            val: SA score for the molecule.
        """
        if score_name not in self.sa_funcs:
            raise KeyError(f"{score_name} is not in scoring functions.")
        else:
            val = self.sa_funcs[score_name](mol)
            if normalise:
                return self.normalise_value(val, score_name)
            return val

    def normalise_value(self, val: float, score_name: str) -> float:
        """
        Normalise SA values between 0 and 1.

        Args:
            val: Value to be normalised.
            score_name: Name of score to normalise.
        """
        scaled_val = (val - self.sa_ranges[score_name]["min"]) / (
            self.sa_ranges[score_name]["max"]
            - self.sa_ranges[score_name]["min"]
        )
        return scaled_val


class Model:
    """Represents random forest SA score model.

    Attributes:
        model (RandomForestClassifier): Random forest model to train.
    """

    def __init__(
        self, random_state=2, processes=-1,
    ):
        """Initialises the model class.

        Args:
            random state: Seed for random numbers.
            processes: Number of proccesses used for training.
        """
        self.model = RandomForestClassifier(
            n_jobs=processes, class_weight="balanced"
        )

    def train(self, data: pd.DataFrame) -> None:
        """Trains the RF model using cross-validation.

        Model is updated with best performing model from cross-validation.

        Args:
            data: SA classification data.
        """
        X = np.array([np.array(fp) for fp in data["fingerprint"]])
        y = data["synthesisable score"].to_numpy()
        cv = cross_validate(
            estimator=self.model,
            X=X,
            y=y,
            scoring="f1",  # F1 score is a combination of
            # precision and recall values.
            cv=KFold(5, random_state=0, shuffle=True),
            n_jobs=-1,
            return_train_score=True,
            return_estimator=True,
        )
        pprint(f"The training scores were {cv['train_score']}.")
        pprint(f"The test scores were {cv['test_score']}")
        # Update the model with the model with the highest test scores.
        self.model = cv["estimator"][cv["test_score"].argmax()]

    def load_data(self, data_path: str) -> pd.DataFrame:
        """Loads the SA classification dataset.

        Args:
            data_path: Path to the JSON file containing data.
        """
        if data_path.endswith(".json"):
            return pd.read_json(data_path)

    def load_model(self, model_path: str) -> None:
        """Loads the model from file.

        Args:
            model_path: Path to the model file.
        """
        self.model = joblib.load(model_path)

    def dump(self, dump_path: str) -> None:
        """Dumps the model to a file.

        Args:
            dump_path: Path to dump the model to.
        """
        joblib.dump(self.model, dump_path)

    def predict(self, mol: rdkit.Mol) -> int:
        """Predict SA of molecule using RF model.

        Args:
            mol: Molecule to have SA calculated.
        Returns:
            int: Prediction from model.
        """
        fp = np.array(get_fingerprint_as_bit_counts(mol)).reshape(1, -1)
        return 1 - int(self.model.predict(fp))

    def predict_proba(self, mol: rdkit.Mol) -> float:
        """Predict SA of molecule as a probability.

        Args:
            mol: Molecule to have SA calculated.
        Returns:
            float: Prediction from model.
        """
        fp = np.array(get_fingerprint_as_bit_counts(mol)).reshape(1, -1)
        return self.model.predict_proba(fp)[0][0]


def main():
    logging.basicConfig(level=logging.DEBUG)
    # model = Model()
    # data = model.load_data("data/sa_scores.json")
    # model.train(data)
    # model.dump("utilities/sa_model.joblib")
    mol = rdkit.MolFromSmiles("CC1=CC=CC=C1C")
    sa_scorer = SyntheticAccesibilityScorer()
    for func in sa_scorer.sa_funcs:
        print(f"{func}: {sa_scorer.calculate_sa(mol, func)}")


if __name__ == "__main__":
    main()
