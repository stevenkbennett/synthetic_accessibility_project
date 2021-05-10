from mpscore import MPScore
from pathlib import Path


def perform_grid_search():
    ...


if __name__ == "__main__":
    data_path = Path("../data/chemist_scores.json")
    # Initialise untrained model with data
    mpscore = MPScore().load_data(str(data_path))
    
