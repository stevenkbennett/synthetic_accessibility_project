from ast import literal_eval
from collections import defaultdict
from email.policy import default
import numpy as np
from mpscore import MPScore, get_fingerprint_as_bit_counts
from pathlib import Path
import json
import pandas as pd
from rdkit import Chem
import itertools as it
from functools import reduce
import random
from tqdm import tqdm
from sklearn.ensemble import RandomForestClassifier
from joblib import Parallel, delayed
from functools import partial
from pymongo import MongoClient
from uuid import uuid4


def perform_coursegrained_search(
    training_data: pd.DataFrame,
    param_steps: dict,
    random_seed=32,
    iterations=10,
    n_jobs=7,
):
    """
    Performs a parallel grid search for the MPScore.

    training_data: Chemist classification data used to train the model
    params: Hyperparameters for the random forest model and fingerprints
    """
    run_id = str(uuid4().int & (1 << 64) - 1)
    training_mols = [Chem.MolFromInchi(i) for i in training_data["inchi"]]
    param_names = list(param_steps.keys())
    param_size = 10
    for i in range(iterations):
        params = generate_params(
            param_steps, iteration=i, param_size=param_size
        )
        test_count = 1000
        # Calculate the total number of parameters
        total_params = reduce(
            lambda x, y: x * y, map(len, list(params.values()))
        )
        print(f"The paramter space size for iteration {i} is {total_params}.")
        random.seed(random_seed)
        print(
            f"Testing {test_count} combinations of parameters. This is {test_count/total_params*100:.3f}% of the parameter space sampled."
        )
        param_idxs = sorted(
            random.sample(range(total_params - 1), k=test_count)
        )
        param_iterable = it.product(
            *[params[param_name] for param_name in params]
        )
        test_combinations = []
        print("Sampling parameters")
        for j, combination in enumerate(tqdm(param_iterable)):
            if len(param_idxs) == 0:
                break
            if j == param_idxs[0]:
                param_idxs.pop(0)
                test_combinations.append(combination)
        print(
            f"Performing hyperparameter optimisation using {n_jobs} processes"
        )
        # Build function with common arguments
        cross_validation_models_args = partial(
            cross_validation_models,
            training_mols=training_mols,
            training_data=training_data,
            param_names=param_names,
        )
        results = Parallel(n_jobs=n_jobs)(
            delayed(cross_validation_models_args)(params=p)
            for p in test_combinations
        )
        calc_param = [r[0] for r in results]
        calc_score = [r[1] for r in results]
        # Calculate mean precision score across each fold
        # score_column = "Precision (Easy-to-synthesise)"
        score_column = "FBeta (Beta = 2/10)"
        score = [np.mean(r[score_column]) for r in calc_score]
        tps = [r["TPs"] for r in calc_score]
        tns = [r["TNs"] for r in calc_score]
        fns = [r["FNs"] for r in calc_score]
        fps = [r["FPs"] for r in calc_score]
        # Get the index of the best performing score
        best_score = max(score)
        best_score_idx = score.index(best_score)
        best_params = calc_param[best_score_idx]
        print(
            f"The best performing parameters for this iteration were {best_params} with an average precision score of {best_score}.\n"
            f"The score used to calculate was {score_column}\n"
            f"The final values for this score were:\n",
            f"Total False Positives: {fps[best_score_idx]}\n",
            f"Total False Negatives: {fns[best_score_idx]}\n",
            f"Total True Positives: {tps[best_score_idx]}\n",
            f"Total True Negatives: {tns[best_score_idx]}\n",
        )
        # Store calculated parameters in MongoDB
        db = MongoClient()
        collection = db["sa_project"]["hyperparameters"]
        res_list = []
        for score_dict in calc_score:
            d = {}
            for score_name in score_dict:
                mean_score = np.mean(score_dict[score_name])
                d[score_name] = str(mean_score)
            d["run_id"] = run_id
            res_list.append(d)
        insert_res = collection.insert_many(res_list)
        assert insert_res.inserted_ids
        # Adjust the parameter starting values to the best parameters minus half a step multiplied by the parameter size difference divided by 2
        for idx, param_name in enumerate(list(param_steps)):
            if i > len(param_steps[param_name]["step"]) - 1:
                step_size = param_steps[param_name]["step"][-1]
            else:
                step_size = param_steps[param_name]["step"][i]
            # Requires str type for generate_params function
            param_steps[param_name]["start"] = str(
                best_params[idx]
                - (literal_eval(step_size) * int(param_size / 2))
            )


def cross_validation_models(params, training_mols, training_data, param_names):
    mpscore = MPScore()
    # Remove fingerprint arguments so only keyword argument for the classifier remain
    params_d = {}
    for i, param_name in enumerate(param_names):
        params_d[param_name] = params[i]
    fp_radius = params_d.pop("fp_radius")
    fp_bit_length = params_d.pop("fp_bit_length")
    training_data["fingerprint"] = [
        get_fingerprint_as_bit_counts(
            mol, radius=fp_radius, nbits=fp_bit_length
        )
        for mol in training_mols
    ]
    mpscore.model = RandomForestClassifier(
        **params_d, n_jobs=1, class_weight="balanced", criterion="gini",
    )
    try:
        result = mpscore.cross_validate(data=training_data)
    except Exception as err:
        print(err)
        print(f"Failed for params {params} (parameter names {param_names})")
    return params, result


def generate_params(
    param_steps: dict, iteration: int, param_size=100,
):
    d = {}
    requires_float = ["max_samples"]
    for param_name in param_steps:
        # Get final step if there are no remaining step sizes
        if iteration > len(param_steps[param_name]["step"]) - 1:
            step_size = param_steps[param_name]["step"][-1]
        else:
            step_size = param_steps[param_name]["step"][iteration]
        # Some parameters requires integer
        if param_name in requires_float:
            d[param_name] = [
                float(literal_eval(param_steps[param_name]["start"]))
                + literal_eval(step_size) * interval
                for interval in range(param_size)
            ]
        else:
            start_num = int(literal_eval(param_steps[param_name]["start"]))
            # Reset start_num to 1 if anything is less than 0
            if start_num <= 0.0000001:
                start_num = 1
            d[param_name] = [
                start_num + (literal_eval(step_size) * interval)
                for interval in range(param_size)
            ]
            # Sanity check that the first and last values for each hyperparameter
            # are greater than the check sizes
            try:
                assert (d[param_name][-1] - d[param_name][0]) > literal_eval(
                    step_size
                )
            except AssertionError:
                print(
                    "WARNING: The combinations of parameters selected have resulted in a difference smaller than the step size. To counteract this, please ensure the space of parameters sampled exceeds the step size."
                )
    # Perform checks on parameters to ensure they are valid, otherwise alter them so they are

    # Check 1
    # Assert the fingerprint bit length is always greater than the maximum number of features used for each tree
    # otherwise the model cannot be trained
    maximum_features = max(d["max_features"])
    for idx, nbits in enumerate(list(d["fp_bit_length"])):
        if nbits < maximum_features:
            d["fp_bit_length"][idx] = maximum_features + 1

    # Check 2
    # Ensure that the maximum number of leaf nodes is greater than 1
    for idx, nodes in enumerate(list(d["max_leaf_nodes"])):
        if nodes <= 1:
            d["max_leaf_nodes"][idx] = 2
    # Check 3
    # Ensure that the maximum  sample size is less than 1
    for idx, max_samples in enumerate(list(d["max_samples"])):
        if max_samples >= 1.0:
            d["max_samples"][idx] = 0.95
    # Check 4
    # Ensure that the minimum sample split size is greater than 1
    for idx, splits in enumerate(list(d["min_samples_split"])):
        if splits == 1:
            d["min_samples_split"][idx] = 2

    return d


def main():
    data_path = Path("../data/chemist_scores.json").resolve()
    param_path = Path("hyperparameters/param_stepsizes.json").resolve()
    # Initialise untrained model with data
    training_data = MPScore().load_data(str(data_path))
    with open(param_path) as f:
        param_steps = dict(json.load(f))
    perform_coursegrained_search(training_data, param_steps)


if __name__ == "__main__":
    main()
