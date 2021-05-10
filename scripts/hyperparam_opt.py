from mpscore import MPScore, get_fingerprint_as_bit_counts
from pathlib import Path
import json
import pandas as pd

# import numpy as np
from rdkit import Chem
import itertools as it


def perform_grid_search(training_data: pd.DataFrame, params: dict):
    """
    Performs a parallel grid search for the MPScore.

    training_data: Chemist classification data used to train the model
    params: Hyperparameters for the random forest model and fingerprints
    """
    training_mols = [Chem.MolFromInchi(i) for i in training_data["inchi"]]
    param_iterable = it.product(*[params[param_name] for param_name in params])
    print(len(list(param_iterable)))
    # for bits in fp_bits:
    #     for radius in fp_radius:
    #         # Update the training data with fingerprints for each hyperparameter
    #         training_data["fingerprint"] = [
    #             get_fingerprint_as_bit_counts(mol, nbits=bits, radius=radius)
    #             for mol in training_mols
    #         ]


def main():
    data_path = Path("../data/chemist_scores.json").resolve()
    param_path = Path("hyperparameters/test_params.json").resolve()
    # Initialise untrained model with data
    training_data = MPScore().load_data(str(data_path))
    with open(param_path) as f:
        params = dict(json.load(f))
    perform_grid_search(training_data, params)


if __name__ == "__main__":
    main()
