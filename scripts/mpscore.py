"""
Materials Precursor Score
=========================

Contains functions for calculating the Materials Precursor Score (MPScore).

Usage
=====

Firstly, initialise the MPScore score. Optimal parameters are provided
by default to initalise the correct fingerprint respentation.
Then call the restore function to load the trained model.
The calibrated model is available in `models/mpscore_calibrated.joblib`,
which is provided to the restore function by default.
The `get_score_from_smiles` function can then be used to return a synthetic accessibility score
(lower is more accessible)
This returns the probability that a molecules belongs to the difficult-to-synthesise class.
"""

from collections import defaultdict
from functools import partial
from operator import sub
from pathlib import Path
from ast import literal_eval
from random import random
from unittest import result
import joblib
import numpy as np
from sklearn.metrics import auc
from rdkit.Chem import AllChem
from scipy.sparse import data
from scipy.special import logit
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import (
    accuracy_score,
    confusion_matrix,
    f1_score,
    precision_score,
    recall_score,
    fbeta_score,
    precision_recall_curve,
)
from sklearn.dummy import DummyClassifier
from sklearn.metrics._plot.precision_recall_curve import (
    plot_precision_recall_curve,
)
from sklearn.model_selection import KFold, train_test_split
import pandas as pd
from matplotlib import pyplot as plt
from matplotlib import cm
from matplotlib.collections import LineCollection
import seaborn as sns
import json
from rdkit import Chem
from tqdm import tqdm
from sklearn.calibration import CalibratedClassifierCV, calibration_curve
from copy import copy
from math import log
from scipy.stats import sem
from sklearn.dummy import DummyClassifier
import random
from sklearn.linear_model import LogisticRegression


def get_fingerprint_as_bit_counts(
    mol: AllChem.Mol, return_info=False, nbits=1024, radius=2
):
    """
    Gets Morgan fingerprint bit counts.

    Args:
        mol: The RDKit molecule
        to have its fingerprints calculated.
        return_info: Returns the fingerprint mapping from fragments to bits.
    """
    info = dict()
    # Ensure molecules has hydrogens added for consistency.
    mol = AllChem.AddHs(mol)
    fp = AllChem.GetMorganFingerprintAsBitVect(
        mol=mol, radius=radius, nBits=nbits, bitInfo=info,
    )
    fp = list(fp)
    for bit, activators in info.items():
        fp[bit] = len(activators)
    if return_info:
        # Return fingerprint mapping, if requested.
        return fp, info
    return fp


class MPScore:
    """Represents the Materials Precursor Score.

    Attributes:
        model: The sklearn classification model.
    """

    def __init__(
        self,
        random_state=32,
        processes=-1,
        param_path="hyperparameters/optimal_params.json",
    ):
        """Initialise the MPScore.

        Args:
            random_state: Seed for random number generator.
            Used during the training procedure and cross-validation process.
        """
        if not param_path:
            # Use default parameters
            self._fp_radius = 2
            self._fp_bit_length = 1024
            self.model = RandomForestClassifier(
                n_jobs=processes,
                random_state=random_state,
                class_weight="balanced",
                criterion="gini",
            )
        if param_path:
            with open(str(param_path)) as f:
                params = dict(json.load(f))
            print(f"Intialising model using params from {param_path}")
            self._fp_radius = params.pop("fp_radius")
            self._fp_bit_length = params.pop("fp_bit_length")
            self.model = RandomForestClassifier(
                n_jobs=processes,
                random_state=random_state,
                **params,
                class_weight="balanced",
                criterion="gini",
            )

    def restore(
        self,
        model_path=str(
            Path("..").resolve().joinpath("models/mpscore_calibrated.joblib")
        ),
    ):
        print(f"Restoring parameters from {model_path}")
        self.model = joblib.load(model_path)

    def cross_validate(self, data):
        """
        Args:
            data: SA classification data.
        """
        x = np.array([np.array(fp) for fp in data["fingerprint"]])
        y = data["synthesisable"].to_numpy()
        # Cross-validation is used to approximate the final score of the MPScore.
        cv = KFold(n_splits=5, shuffle=True, random_state=32)
        # Train 5 models using cross-validation.
        predictions_combined = []
        y_test_combined = []
        metrics = {
            "Accuracy": accuracy_score,
            "Precision (Difficult-to-synthesise)": partial(
                precision_score, pos_label=0, zero_division=0
            ),
            "Recall (Difficult-to-synthesise)": partial(
                recall_score, pos_label=0, zero_division=0
            ),
            "Recall (Easy-to-synthesise)": partial(
                recall_score, pos_label=1, zero_division=0
            ),
            "Precision (Easy-to-synthesise)": partial(
                precision_score, pos_label=1, zero_division=0
            ),
            "F1": partial(f1_score, pos_label=1),
            "FBeta (Beta = 4/10)": partial(
                fbeta_score, beta=0.4, pos_label=1, zero_division=0
            ),
            "FBeta (Beta = 3/10)": partial(
                fbeta_score, beta=0.3, pos_label=1, zero_division=0
            ),
            "FBeta (Beta = 2/10)": partial(
                fbeta_score, beta=0.2, pos_label=1, zero_division=0
            ),
            "FBeta (Beta = 1/10)": partial(
                fbeta_score, beta=0.1, pos_label=1, zero_division=0
            ),
        }
        results = defaultdict(list)
        for i, (train_ind, test_ind) in enumerate(cv.split(x, y)):
            x_train, x_test = x[train_ind], x[test_ind]
            y_train, y_test = y[train_ind], y[test_ind]
            # Make a copy of the model to avoid re-training after calibration
            model = copy(self.model)
            model.fit(X=x_train, y=y_train)
            # Keep probabilities for the positive outcomes.
            test_predictions = [i for i in model.predict(x_test)]
            for metric in metrics:
                score = metrics[metric](y_test, test_predictions)
                results[metric].append(score)
            predictions_combined.extend(test_predictions)
            y_test_combined.extend(y_test)
        fps = 0
        tps = 0
        tns = 0
        fns = 0
        for i, predicted_y in enumerate(predictions_combined):
            actual_y = y_test_combined[i]
            # Positive sample
            if actual_y == 1:
                if actual_y == predicted_y:
                    tps += 1
                elif actual_y != predicted_y:
                    fns += 1
            elif actual_y == 0:
                if actual_y == predicted_y:
                    tns += 1
                elif actual_y != predicted_y:
                    fps += 1
        for metric in results:
            av = np.mean(results[metric])
            std = np.std(results[metric])
            print(f"Score: {metric}     Average: {av}      Std: {std}")
        print(
            f"Confusion: {confusion_matrix(y_test_combined, predictions_combined)}"
        )
        print(f"Total Predictions: {len(y_test_combined)}")
        print(f"Total False Positives: {fps}")
        print(f"Total False Negatives: {fns}")
        print(f"Total True Positives: {tps}")
        print(f"Total True Negatives: {tns}")
        results["TNs"] = tns
        results["FPs"] = fps
        results["FNs"] = fns
        results["TPs"] = tps
        return results

    def train_using_entire_dataset(
        self, data: pd.DataFrame, calibrate=True
    ) -> None:
        """Trains the model on the entire dataset.

        Args:
            data: Molecules labelled as synthesisable/unsynthesisable.
        """
        X = np.array([np.array(fp) for fp in data["fingerprint"]])
        y = data["synthesisable"].to_numpy()
        print(
            f"There are {sum(y)} molecules labelled indeas synthesisable (which has a value of 1)"
        )
        print(
            f"There are {len(y)-sum(y)} labelled as unsynthesisable (which has a value of 0)"
        )
        if calibrate:
            X_train, X_calib, y_train, y_calib = train_test_split(
                X, y, random_state=32
            )
            self.model.fit(X_train, y_train)
            clf = CalibratedClassifierCV(
                self.model, cv="prefit", method="sigmoid"
            )
            clf.fit(X_calib, y_calib)
            print("Finished training calibrated model on entire dataset")
            self.calibrated_model = clf
        else:
            self.model.fit(X, y)
            print("Finished training model on entire dataset")

    def load_data(self, data_path):
        """Loads the SA classification dataset.

        Args:
            data_path: Path to the JSON file containing data.
        """
        if data_path.endswith(".json"):
            return pd.read_json(data_path)

    def dump(self, dump_path):
        """Dumps the model to a file.

        Args:
            dump_path: Path to dump the model to.
        """
        if self.calibrated_model:
            calibrated_path = dump_path.split(".")
            calibrated_path += "_calibrated.json"
            joblib.dump(self.calibrated_model, dump_path)
        else:
            joblib.dump(self.model, dump_path)

    def predict(self, mol):
        """Predict SA of molecule using RF model.

        Args:
            mol: Molecule to have SA calculated.
        Returns:
            int: Prediction from model.
        """
        fp = np.array(get_fingerprint_as_bit_counts(mol)).reshape(1, -1)
        return int(self.model.predict(fp))

    def get_score_from_smiles(self, smiles, return_probability=True):
        """Gets MPScore from SMILES string of molecule.

        Args:
            smiles: SMILES string of molecule
            return_probability: Probability the molecule belongs to the difficult-to-synthesise class.
        Returns:
            int or float: Prediction from model - 1 if easy-to-synthesise, 0 if not.
            If return_probability, returns probability molecule belongs to the difficult-to-synthesise class. This can then be interpreted as a synthetic difficulty score.
        """
        mol = AllChem.MolFromSmiles(smiles)
        if return_probability:
            return self.predict_proba(mol)
        return self.predict(mol)

    def predict_proba(self, mol):
        """Predict SA of molecule as a probability.
        Args:
            mol: Molecule to have SA calculated.
        Returns:
            float: Probability that molecule belongs to the difficult-to-synthesise class. Interpretted as a measure of synthetic accessibility.
        """
        fp = np.array(
            get_fingerprint_as_bit_counts(
                mol, nbits=self._fp_bit_length, radius=self._fp_bit_length
            )
        ).reshape(1, -1)
        return self.model.predict_proba(fp)[0][0]

    def plot_calibration_curve(self, data):
        fig, ax = plt.subplots()

        X_train, X_test, y_train, y_test = train_test_split(
            [np.array(i) for i in data["fingerprint"].to_numpy()],
            [np.array(i) for i in data["synthesisable"].to_numpy()],
            random_state=32,
        )
        X_model_train, X_valid, y_model_train, y_valid = train_test_split(
            X_train, y_train, random_state=32
        )
        # Fit the uncalibrated random forest model
        self.model.fit(X_model_train, y_model_train)
        predicted_probs = [
            self.model.predict_proba(np.array(fp).reshape(1, -1))[0][1]
            for fp in tqdm(
                X_test, desc="Uncalibrated random forest predictions"
            )
        ]
        prob_true, prob_pred = calibration_curve(
            y_prob=predicted_probs, y_true=y_test, n_bins=10, normalize=False,
        )
        sns.lineplot(
            y=prob_pred, x=prob_true, ci=None, ax=ax, label="Random Forest"
        )

        # Sigmoid calibration
        sigmoid_clf = CalibratedClassifierCV(
            self.model, cv="prefit", method="sigmoid",
        )
        # Fit calibrated model on validation set
        sigmoid_clf.fit(X_valid, y_valid)
        sigmoid_pred = [
            sigmoid_clf.predict_proba(i.reshape(1, -1))[0][1]
            for i in tqdm(X_test, desc="Sigmoid random forest predictions")
        ]
        prob_true, prob_pred = calibration_curve(
            y_prob=sigmoid_pred, y_true=y_test, n_bins=10, normalize=False,
        )
        sns.lineplot(
            y=prob_pred,
            x=prob_true,
            ci=None,
            ax=ax,
            label="Random Forest + Sigmoid",
        )

        # Isotonic calibration
        isotonic_clf = CalibratedClassifierCV(
            self.model, cv="prefit", method="isotonic"
        )
        # Fit calibrated model on validation set
        isotonic_clf.fit(X_valid, y_valid)
        isotonic_pred = [
            isotonic_clf.predict_proba(np.array(fp).reshape(1, -1))[0][1]
            for fp in tqdm(X_test, desc="Isotonic random forest predictions")
        ]
        prob_true, prob_pred = calibration_curve(
            y_prob=isotonic_pred, y_true=y_test, n_bins=10, normalize=False,
        )
        sns.lineplot(
            y=prob_pred,
            x=prob_true,
            ci=None,
            ax=ax,
            label="Random Forest + Isotonic",
        )

        sns.lineplot(
            y=[0, 1], x=[0, 1], label="Perfect Classifier", color="black"
        )
        ax.lines[3].set_linestyle("--")
        sns.despine()
        ax.set_xlabel("Mean Predicted Value")
        ax.set_ylabel("Fraction of Positives")
        fig.savefig(str(Path("../images/Calibration_Curve.pdf")))

    def get_precision_recall_curve_data(self, data, model):
        X = np.array([np.array(i) for i in data["fingerprint"].to_list()])
        y = data["synthesisable"].to_numpy()
        sampled_thresholds = np.linspace(-0.1, 1.0, 100)
        curves = []
        splits = KFold(n_splits=5, shuffle=True, random_state=32)
        for train_idx, test_idx in splits.split(X=X, y=y):
            X_train, X_test = X[train_idx], X[test_idx]
            y_train, y_test = y[train_idx], y[test_idx]
            model.fit(X_train, y_train)
            y_probs_test = [_[1] for _ in model.predict_proba(X_test)]
            curves.append(precision_recall_curve(y_test, y_probs_test))
        sampled_precisions = []
        sampled_recalls = []
        if isinstance(model, DummyClassifier):
            for precision, recall, threshold in curves:
                sampled_precisions.append(precision)
                sampled_recalls.append(recall)
            return {"Precision": sampled_precisions, "Recall": sampled_recalls}
        for precision, recall, threshold in curves:
            sampled_precisions.append(
                np.interp(sampled_thresholds, threshold, precision[:-1])
            )
            sampled_recalls.append(
                np.interp(sampled_thresholds, threshold, recall[:-1])
            )
        return {
            "Precision": sampled_precisions,
            "Recall": sampled_recalls,
            "Threshold": [round(i, 2) for i in sampled_thresholds],
        }

    def plot_precision_recall_curve(self, fig, ax, data):
        # MPScore precision-recall data
        pr_data = self.get_precision_recall_curve_data(
            data, model=copy(self.model)
        )
        mpscore_color = list(sns.color_palette())[3]
        ax.errorbar(
            np.mean(pr_data["Recall"], axis=0),
            np.mean(pr_data["Precision"], axis=0),
            sem(pr_data["Recall"], axis=0),
            sem(pr_data["Precision"], axis=0),
            color=mpscore_color,
            errorevery=5,
            ecolor="black",
            lw=1.5,
            barsabove=True,
            elinewidth=1,
            label="MPScore",
        )
        # Dummy classifier
        dummy = DummyClassifier(strategy="prior", random_state=32)
        pr_data_dummy = self.get_precision_recall_curve_data(data, model=dummy)

        logisitic = LogisticRegression(random_state=32)
        log_pr_data = self.get_precision_recall_curve_data(data, logisitic)
        ax.errorbar(
            np.mean(log_pr_data["Recall"], axis=0),
            np.mean(log_pr_data["Precision"], axis=0),
            sem(log_pr_data["Recall"], axis=0),
            sem(log_pr_data["Precision"], axis=0),
            color="green",
            errorevery=5,
            ecolor="black",
            lw=1.5,
            barsabove=True,
            elinewidth=1,
            label="Logistic",
        )
        ax.errorbar(
            np.mean(pr_data_dummy["Recall"], axis=0),
            np.mean(pr_data_dummy["Precision"], axis=0),
            sem(pr_data_dummy["Recall"], axis=0),
            sem(pr_data_dummy["Precision"], axis=0),
            color="grey",
            linestyle="--",
            errorevery=1,
            ecolor="black",
            lw=1.5,
            barsabove=True,
            elinewidth=1,
            label="Baseline",
        )
        ax.set_ylim(-0, 1)
        ax.set_xlim(0, 1.01)
        print(
            f'AUC for RF is {auc(np.mean(pr_data["Recall"], axis=0), np.mean(pr_data["Precision"], axis=0))}'
        )
        print(
            f'AUC for dummy is {auc(np.mean(pr_data_dummy["Recall"], axis=0), np.mean(pr_data_dummy["Precision"], axis=0))}'
        )
        print(
            f'AUC for logistic is {auc(np.mean(log_pr_data["Recall"], axis=0), np.mean(log_pr_data["Precision"], axis=0))}'
        )
        mpscore_thresh = round(
            invert_calibrated_prob(1 - 0.21, self.calibrated_model), 2
        )
        threshold_ind = list(pr_data["Threshold"]).index(mpscore_thresh)

        mpscore_pr = list(np.mean(pr_data["Precision"], axis=0))[threshold_ind]
        mpscore_re = list(np.mean(pr_data["Recall"], axis=0))[threshold_ind]
        print(mpscore_thresh)
        print(mpscore_pr)
        print(mpscore_re)
        circ = plt.Circle(
            (mpscore_re, mpscore_pr),
            0.03,
            color="black",
            fill=False,
            linewidth=1,
            zorder=10,
        )
        # ax.text(
        #     mpscore_re + 15,
        #     mpscore_pr - 0.01,
        #     fontsize="small",
        #     s="MPScore Threshold",
        #     color="black",
        #     alpha=0.8,
        # )
        handles, labels = ax.get_legend_handles_labels()
        # Remove the errorbars
        handles = [h[0] for h in handles]
        ax.legend(
            handles, labels, loc="lower left",
        )
        ax.add_artist(circ)
        ax.set_xlabel("Recall", labelpad=20, fontsize="medium")
        ax.set_ylabel("Precision", fontsize="medium")
        ax.tick_params("both", labelsize="medium")
        ax.set_title("b)", fontsize="large")
        return fig, ax

    def plot_feature_importances(self, ax):
        importances = [[] for _ in range(1024)]
        for tree in self.model.estimators_:
            for i, importance in enumerate(tree.feature_importances_):
                importances[i].append(importance)
        importances = np.array(importances)
        importances_mean = np.mean(importances, axis=1)
        importances_stdev = np.std(importances, axis=1)
        fp_importances = {str(i): j for i, j in enumerate(importances_mean)}
        fp_stdevs = list(
            sorted(
                importances_stdev,
                key=lambda x: fp_importances[
                    str(list(importances_stdev).index(x))
                ],
                reverse=True,
            )
        )
        fp_importances = dict(
            sorted(fp_importances.items(), key=lambda x: x[1], reverse=True)
        )
        plt.tight_layout()
        palette = list(sns.color_palette("viridis", 20))[13]
        x = list(fp_importances.keys())[:20]
        height = list(fp_importances.values())[:20]
        ax.bar(
            x,
            height,
            width=0.6,
            color=palette,
            yerr=fp_stdevs[:20],
            error_kw={"elinewidth": 1},
        )
        ax.set_ylim([0, 0.06])
        sns.despine()
        ax.set_xlabel("Bit Number", labelpad=10, fontsize="medium")
        ax.set_ylabel("Feature Importance", fontsize="medium")
        ax.tick_params(labelsize="medium")
        ax.tick_params("y", labelsize="medium")
        ax.tick_params("x", rotation=90, labelsize=8)
        ax.set_title("a)", fontsize="large")
        return ax

    def plot_figure_5(self, data):
        fig, axes = plt.subplots(1, 2, figsize=(6.43420506434205, 3.3))
        fig, axes[1] = self.plot_precision_recall_curve(
            fig, axes[1], data=data
        )
        axes[0] = self.plot_feature_importances(axes[0])
        print("Saving figure.")
        fig.savefig(Path(__file__).parents[1].joinpath("images/Figure_5.pdf"))


def main():
    data_path = Path("../data/chemist_scores.json").resolve()
    training_data = MPScore().load_data(str(data_path))
    param_path = Path("hyperparameters/optimal_params.json")
    with open(str(param_path)) as f:
        params = dict(json.load(f))
    model = MPScore(param_path=param_path)
    training_mols = [Chem.MolFromInchi(i) for i in training_data["inchi"]]
    training_data["fingerprint"] = [
        get_fingerprint_as_bit_counts(
            mol, radius=model._fp_radius, nbits=model._fp_bit_length
        )
        for mol in training_mols
    ]
    model.train_using_entire_dataset(training_data)
    # full_model_path = Path("../models/mpscore_calibrated.joblib")
    # model.dump(str(full_model_path))
    # model.cross_validate(training_data)
    model.plot_figure_5(data=training_data)
    # model.plot_calibration_curve(data=training_data)
    # model.get_precision_recall_curve_data(training_data, model=model.model)


def invert_calibrated_prob(prob, calibrated_model):
    sigmoid_classifier = calibrated_model.calibrated_classifiers_[
        0
    ].calibrators[0]
    a = sigmoid_classifier.a_
    b = sigmoid_classifier.b_
    return (log((1 - prob) / prob) - b) / a


def param_type_conversion(params):
    p = []
    for param in params:
        if param.replace(".", "", 1).isdigit() or param == "None":
            p.append(literal_eval(param))
        else:
            p.append(param)
    return p


if __name__ == "__main__":
    main()
