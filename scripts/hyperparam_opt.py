from ast import literal_eval
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
import os
from scipy.stats import sem
import contextlib
import joblib
from tqdm import tqdm
from joblib import Parallel, delayed


@contextlib.contextmanager
def tqdm_joblib(tqdm_object):
    """Context manager to patch joblib to report into tqdm progress bar given as argument.
    Credit: https://stackoverflow.com/questions/24983493/tracking-progress-of-joblib-parallel-execution
    """

    class TqdmBatchCompletionCallback(joblib.parallel.BatchCompletionCallBack):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)

        def __call__(self, *args, **kwargs):
            tqdm_object.update(n=self.batch_size)
            return super().__call__(*args, **kwargs)

    old_batch_callback = joblib.parallel.BatchCompletionCallBack
    joblib.parallel.BatchCompletionCallBack = TqdmBatchCompletionCallback
    try:
        yield tqdm_object
    finally:
        joblib.parallel.BatchCompletionCallBack = old_batch_callback
        tqdm_object.close()


def perform_randomised_grid_search(
    training_data: pd.DataFrame,
    param_options: dict,
    random_seed=32,
    n_jobs=10,
):
    """
    Performs a parallel grid search for the MPScore.

    training_data: Chemist classification data used to train the model
    params: Hyperparameters for the random forest model and fingerprints
    """
    run_id = str(uuid4().int & (1 << 64) - 1)
    print(f"Performing run {run_id}")
    training_mols = [Chem.MolFromInchi(i) for i in training_data["inchi"]]
    param_names = list(param_options.keys())
    random.seed(random_seed)
    # Calculate the total number of parameters sampled
    total_params = reduce(
        lambda x, y: x * y, map(len, list(param_options.values()))
    )
    # By default, sample 5% of parameter space
    test_count = int(total_params * 5 / 100)
    print(f"The total parameter space size is {total_params}.")
    print(
        f"Testing {test_count} combinations of parameters. This is {test_count/total_params*100:.3f}% of the parameter space sampled."
    )
    # Get random numbers to select parameters
    param_idxs = sorted(random.sample(range(total_params - 1), k=test_count))
    test_combinations = []
    # Iterate over all parameter options
    for i, combination in enumerate(
        tqdm(
            get_param_combinations(param_options=param_options),
            total=total_params,
            desc="Sampling parameters",
        )
    ):
        # As soon as the index of random numbers is exhausted, exit loop
        if len(param_idxs) == 0:
            break
        if i == param_idxs[0]:
            param_idxs.pop(0)
            # Type conversion performed after selection to speed up loop
            valid_params = param_type_conversion(combination)
            test_combinations.append(valid_params)
    print(f"Performing hyperparameter optimisation using {n_jobs} processes")
    # Build function with common arguments
    cross_validation_models_args = partial(
        cross_validation_models,
        training_mols=training_mols,
        training_data=training_data,
        param_names=param_names,
        run_id=run_id,
    )
    with tqdm_joblib(
        tqdm(desc="Training models", total=test_count)
    ) as progress_bar:
        results = Parallel(n_jobs=n_jobs)(
            delayed(cross_validation_models_args)(params=p)
            for p in test_combinations
        )
        calc_param = [r[0] for r in results]
        calc_score = [r[1] for r in results]
        # Calculate mean precision score across each fold
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
            f"The best performing parameters were {best_params} with an average score of {best_score}.\n"
            f"The score used to calculate was {score_column}\n"
            f"The final values for this score were:\n",
            f"Total False Positives: {fps[best_score_idx]}\n",
            f"Total False Negatives: {fns[best_score_idx]}\n",
            f"Total True Positives: {tps[best_score_idx]}\n",
            f"Total True Negatives: {tns[best_score_idx]}\n",
        )
        print("Completed hyperparameter optimisation")


def cross_validation_models(
    params, training_mols, training_data, param_names, run_id
):
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
        **params_d,
        random_state=32,
        n_jobs=1,
        class_weight="balanced",
        criterion="gini",
    )
    try:
        result = mpscore.cross_validate(data=training_data)
    except Exception as err:
        print(f"Failed for params {params} (parameter names {param_names})")
    db = MongoClient(host=None)  # Fill in host here
    collection = db["sa_project"]["hyperparameters"]
    d = {}
    for score_name in result:
        mean_score = np.mean(result[score_name])
        standard_error = sem(result[score_name])
        d[score_name + "_Mean"] = str(mean_score)
        d[score_name + "_Standard_Error"] = str(standard_error)
    d["run_id"] = run_id
    for param, name in zip(params, param_names):
        d[name] = param
    insert_res = collection.insert_one(d)
    assert insert_res.inserted_id
    return params, result


def get_param_combinations(param_options: dict):
    param_iterable = it.product(
        *[param_options[param_name] for param_name in param_options]
    )
    for params in param_iterable:
        # Perform type conversion of str params
        # print(params)
        yield params


def main():
    data_path = Path("../data/chemist_scores.json").resolve()
    param_path = Path("hyperparameters/test_params.json").resolve()
    # Initialise untrained model with data
    training_data = MPScore().load_data(str(data_path))
    with open(param_path) as f:
        param_steps = dict(json.load(f))
    n_jobs = os.environ.get("NCPUS", None)
    if n_jobs is None:
        perform_randomised_grid_search(training_data, param_steps)
    else:
        perform_randomised_grid_search(
            training_data, param_steps, n_jobs=int(n_jobs)
        )


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
