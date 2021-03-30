"""
Materials Precursor Score
=========================

Contains functions for calculating the Materials Precursor Score (MPScore),
in addition to the SAScore and SCScore synthetic difficulty scoring functions.
"""

from collections import defaultdict
from functools import partial
from pathlib import Path

import joblib
import numpy as np
from rdkit.Chem import AllChem
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import (accuracy_score, confusion_matrix, f1_score,
                             precision_score, recall_score)
from sklearn.model_selection import KFold
import pandas as pd
from matplotlib import pyplot as plt
from matplotlib import cm
from matplotlib.collections import LineCollection
import seaborn as sns
from molvs import standardize_smiles


def get_fingerprint_as_bit_counts(mol: AllChem.Mol, return_info=False):
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
        mol=mol,
        radius=2,
        nBits=1024,
        bitInfo=info,
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
    def __init__(self, random_state=None, processes=-1):
        """Initialise the MPScore.

        Args:
            random_state: Seed for random number generator.
            Used during the training procedure and cross-validation process.
        """
        self.model = RandomForestClassifier(
            n_jobs=processes,
            random_state=random_state,
            class_weight='balanced',
            n_estimators=100,
            criterion='gini',
        )

    def restore(self,
                model_path=str(
                    Path('..').resolve().joinpath('models/mpscore.joblib'))):
        self.model = joblib.load(model_path)

    def cross_validate(self, data):
        """
        Args:
            data: SA classification data.
        """
        x = np.array([np.array(fp) for fp in data["fingerprint"]])
        y = data["synthesisable"].to_numpy()
        # Cross-validation is used to approximate the final score of the MPScore.
        # As such, shuffle was used which means the results will not be identical each time.
        cv = KFold(n_splits=5, shuffle=True)
        # Train 5 models using cross-validation.
        predictions_combined = []
        y_test_combined = []
        metrics = {
            "Accuracy": accuracy_score,
            "Precision (Easy-to-synthesise)": partial(precision_score,
                                                      pos_label=0),
            "Recall (Difficult-to-synthesise)": partial(recall_score,
                                                        pos_label=0),
            "Recall (Easy-to-synthesise)": partial(recall_score, pos_label=1),
            "Precision (Easy-to-synthesise)": partial(precision_score,
                                                      pos_label=1),
            "F1": partial(f1_score, pos_label=1),
        }
        results = defaultdict(list)
        for i, (train_ind, test_ind) in enumerate(cv.split(x, y)):
            x_train = x[train_ind]
            x_test = x[test_ind]
            y_train = y[train_ind]
            y_test = y[test_ind]
            self.model.fit(X=x_train, y=y_train)
            # Keep probabilities for the positive outcomes.
            test_predictions = [i for i in self.model.predict(x_test)]
            for metric in metrics:
                score = metrics[metric](y_test, test_predictions)
                results[metric].append(score)
            predictions_combined.extend(test_predictions)
            y_test_combined.extend(y_test)
        fps = 0
        tps = 0
        tns = 0
        fns = 0
        for i, prediction in enumerate(predictions_combined):
            if (prediction == y_test_combined[i]):
                if y_test_combined[i] == 1:
                    tps += 1
                if y_test_combined[i] == 0:
                    tns += 1
            if (prediction != y_test_combined[i]):
                if y_test_combined[i] == 1:
                    fps += 1
                if y_test_combined[i] == 0:
                    fns += 1
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
        return results

    def train_using_entire_dataset(self, data: pd.DataFrame) -> None:
        """Trains the model on the entire dataset.

        Args:
            data: Molecules labelled as synthesisable/unsynthesisable.
        """
        x = np.array([np.array(fp) for fp in data["fingerprint"]])
        y = data["synthesisable"].to_numpy()
        print(
            f"There are {sum(y)} molecules labelled as synthesisable (which has a value of 1)"
        )
        print(
            f"There are {len(y)-sum(y)} labelled as unsynthesisable (which has a value of 0)"
        )
        self.model.fit(x, y)
        print("Finished training model on entire dataset")

    def load_data(self, data_path):
        """Loads the SA classification dataset.

        Args:
            data_path: Path to the JSON file containing data.
        """
        if data_path.endswith(".json"):
            return pd.read_json(data_path)

    def load_model(self, model_path):
        """Loads the model from file.

        Args:
            model_path: Path to the model file.
        """
        self.model = joblib.load(model_path)

    def dump(self, dump_path):
        """Dumps the model to a file.

        Args:
            dump_path: Path to dump the model to.
        """
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

    def get_score_from_smiles(smiles):
        """Gets MPScore from SMILES string of molecule.

        Args:
            smiles: SMILES string of molecule
        Returns:
            int: Prediction from model - 0 if easy-to-synthesise, 1 if not/
        """
        mol = AllChem.MolFromSmiles(smiles)
        return self.predict(mol)

    def predict_proba(self, mol):
        """Predict SA of molecule as a probability. 

        Notes:
            Molecules labelled 1 are synthesisable and those marked as 0 are unsynthesisable.

        Args:
            mol: Molecule to have SA calculated.
        Returns:
            float: Prediction from model.
        """
        fp = np.array(get_fingerprint_as_bit_counts(mol)).reshape(1, -1)
        return self.model.predict_proba(fp)[0][0]

    def get_precision_recall_curve_data(self,
                                        data,
                                        final_cutoff=None,
                                        step=None,
                                        swap_classes=False):
        results = defaultdict(lambda: [])
        if not step:
            step = 100
        thresholds = np.linspace(0, 1, step)
        X = np.array([np.array(i) for i in data['fingerprint'].to_list()])
        y = data["synthesisable"].to_numpy()
        splits = KFold(n_splits=5, shuffle=True, random_state=1)
        for train_idx, test_idx in splits.split(X=X, y=y):
            X_train, X_test = X[train_idx], X[test_idx]
            y_train, y_test = y[train_idx], y[test_idx]
            # Re-train the model across every fold.
            self.model.fit(X_train, y_train)
            y_probs_train = self.model.predict_proba(X_train)
            y_probs_test = self.model.predict_proba(X_test)
            for i, threshold in enumerate(thresholds):
                # If probability of y greater than threshold, score a molecule as synthesisable
                y_pred_train = [
                    1 if prob[1] >= threshold else 0 for prob in y_probs_train
                ]
                y_pred_test = [
                    1 if prob[1] >= threshold else 0 for prob in y_probs_test
                ]
                metrics = [
                    "tp_train", "tp_test", "fp_train", "fp_test", "tn_train",
                    "tn_test", "fn_train", "fn_test"
                ]
                tp_train = sum(1 for i, pred in enumerate(y_pred_train)
                               if (y_train[i] == pred) and (y_train[i] == 1))
                tp_test = sum(1 for i, pred in enumerate(y_pred_test)
                              if (y_test[i] == pred) and (y_test[i] == 1))
                fp_train = sum(1 for i, pred in enumerate(y_pred_train)
                               if (y_train[i] != pred) and (y_train[i] == 1))
                fp_test = sum(1 for i, pred in enumerate(y_pred_test)
                              if (y_test[i] != pred) and (y_test[i] == 1))
                tn_train = sum(1 for i, pred in enumerate(y_pred_train)
                               if (y_train[i] == pred) and (y_train[i] == 0))
                tn_test = sum(1 for i, pred in enumerate(y_pred_test)
                              if (y_test[i] == pred) and (y_test[i] == 0))
                fn_train = sum(1 for i, pred in enumerate(y_pred_train)
                               if (y_train[i] != pred) and (y_train[i] == 0))
                fn_test = sum(1 for i, pred in enumerate(y_pred_test)
                              if (y_test[i] != pred) and (y_test[i] == 0))
                if swap_classes:
                    tn_train, tp_train = tp_train, tn_train
                    tn_test, tp_test = tp_test, tn_test
                    fp_train, fn_train = fn_train, fp_train
                    fp_test, fn_test = fn_test, fp_test
                if threshold not in results["thresholds"]:
                    results["thresholds"].append(threshold)
                for i, val in enumerate([
                        tp_train, tp_test, fp_train, fp_test, tn_train,
                        tn_test, fn_train, fn_test
                ]):
                    pos = results["thresholds"].index(threshold)
                    if results[metrics[i]] == []:
                        results[metrics[i]] = [0] * len(thresholds)
                    results[metrics[i]][pos] += val
        df = pd.DataFrame(results)
        for i in range(len(thresholds)):
            row = df.iloc[i]
            results["p_train"].append(
                round(row["tp_train"] / (row["tp_train"] + row["fp_train"]),
                      3))
            results['p_test'].append(
                round(row['tp_test'] / (row['tp_test'] + row['fp_test']), 3))
            results['r_train'].append(
                round(row['tp_train'] / (row['tp_train'] + row['fn_train']),
                      3))
            results['r_test'].append(
                round(row['tp_test'] / (row['tp_test'] + (row['fn_test'])), 3))
        return pd.DataFrame(results)

    def plot_precision_recall_curve(self, fig, ax):
        loaded_data = self.load_data(
            "/Users/stevenbennett/PhD/Main_Projects/Synthetic_Accessibility_Project/Clean/data/Training_SA_Data_AddHs.json"
        )
        data = defaultdict(list)
        for _, row in loaded_data.iterrows():
            data["smiles"].append(
                standardize_smiles(
                    AllChem.MolToSmiles((mol :=
                                         AllChem.MolFromInchi(row["inchi"])))))
            data["synthesisable"].append(int(row["synthesisable"]))
            data["fingerprint"].append(get_fingerprint_as_bit_counts(mol))
        data = pd.DataFrame(data)
        pr_data = self.get_precision_recall_curve_data(data)
        X = pr_data['r_test'].to_numpy()
        y = pr_data['p_test'].to_numpy()
        Xy = np.array([[(X[i], y[i]), (X[i + 1], y[i + 1])]
                       for i in range(len(X) - 1)])
        viridis = cm.get_cmap('viridis', len(Xy))
        threshold_colors = [
            viridis(i) for i in pr_data['thresholds'].to_list()
        ]
        # Create a set of line segments so that we can color them individually
        # This creates the points as a N x 1 x 2 array so that we can stack points
        # together easily to get the segments. The segments array for line collection
        # needs to be (numlines) x (points per line) x 2 (for x and y)
        # from multicolored lines example
        mpscore_thresh_idx = [
            round(i, 2) for i in pr_data['thresholds'].to_list()
        ].index(0.12)
        mpscore_pr = y[mpscore_thresh_idx]
        mpscore_re = X[mpscore_thresh_idx]
        ls = LineCollection(segments=Xy, linewidth=2, colors=threshold_colors)
        ax.add_collection(ls)
        ax.set_ylim(-0, 1.01)
        cbar = fig.colorbar(
            mappable=cm.ScalarMappable(cmap=viridis, norm=None))
        cbar.minorticks_on()
        cbar.set_label('Threshold', fontsize='medium')
        cbar.ax.tick_params(labelsize='medium')
        baseline_y = len(
            data['synthesisable'][data['synthesisable'] == 1]) / len(
                data['synthesisable'])
        ax.plot([0, 1], [baseline_y, baseline_y],
                '--',
                lw=2,
                alpha=0.5,
                color='grey')
        ax.set_xlim(0, 1)
        circ = plt.Circle((mpscore_re, mpscore_pr),
                          0.01,
                          color='black',
                          fill=False,
                          linewidth=1)
        ax.text(mpscore_re + 0.025,
                mpscore_pr - 0.01,
                fontsize='medium',
                s='MPScore Threshold',
                color='black',
                alpha=0.8)
        ax.text(mpscore_re + 0.3,
                mpscore_pr - 0.08,
                fontsize='medium',
                s='0.12',
                color='black',
                alpha=0.8)
        ax.add_artist(circ)
        ax.set_xlabel('Recall', labelpad=20, fontsize='medium')
        ax.set_ylabel('Precision', fontsize='medium')
        ax.tick_params('both', labelsize='medium')
        ax.text(0.01,
                baseline_y - 0.06,
                fontsize='medium',
                alpha=0.6,
                s='Baseline',
                color='grey')
        ax.set_title('b)', fontsize='medium')
        return fig, ax

    def plot_feature_importances(self, ax):
        self.load_model(
            str(Path.home() /
                "PhD/Main_Projects/Synthetic_Accessibility_Project/synthetic_accessibility_project/stages/Stage1_SyntheticAccesibilityScores/Utilities/RFModel_FullDatasetTrained.joblib"
                ))
        importances = [[] for _ in range(1024)]
        for tree in self.model.estimators_:
            for i, importance in enumerate(tree.feature_importances_):
                importances[i].append(importance)
        importances = np.array(importances)
        importances_mean = np.mean(importances, axis=1)
        importances_stdev = np.std(importances, axis=1)
        fp_importances = {str(i): j for i, j in enumerate(importances_mean)}
        fp_stdevs = list(
            sorted(importances_stdev,
                   key=lambda x: fp_importances[str(
                       list(importances_stdev).index(x))],
                   reverse=True))
        fp_importances = dict(
            sorted(fp_importances.items(), key=lambda x: x[1], reverse=True))
        plt.tight_layout()
        palette = list(sns.color_palette('viridis', 20))[13]
        x = list(fp_importances.keys())[:20]
        height = list(fp_importances.values())[:20]
        ax.bar(x, height, width=0.75, color=palette, yerr=fp_stdevs[:20])
        ax.set_ylim([0, 0.06])
        sns.despine()
        ax.set_xlabel('Bit Number', labelpad=10, fontsize='medium')
        ax.set_ylabel('Feature Importance', fontsize='medium')
        ax.tick_params(labelsize='medium')
        ax.tick_params('y', labelsize='medium')
        ax.tick_params('x', rotation=90, labelsize=8)
        ax.set_title('a)', fontsize='large')
        return ax

    def plot_figure_5(self):
        fig, axes = plt.subplots(1, 2, figsize=(6.43420506434205, 3.3))
        fig, axes[1] = self.plot_precision_recall_curve(fig, axes[1])
        axes[0] = self.plot_feature_importances(axes[0])
        print('Saving figure.')
        fig.savefig(
            Path(__file__).parents[1].joinpath(
                'images/paper_figures/Figure_5.pdf'))


def main():
    model = MPScore()
    data = model.load_data(
        "/Users/stevenbennett/PhD/Main_Projects/Synthetic_Accessibility_Project/Clean/data/Training_SA_Data_AddHs.json"
    )
    model.cross_validate(data)
    model.plot_figure_5()


if __name__ == "__main__":
    main()