
# #####################################################################
# Imports.
# #####################################################################

import joblib
import stk
import logging
from pathlib import Path
import numpy as np
import pywindow
from rdkit.Chem import AllChem as rdkit
import os

# Global settings.

random_seed = 2
macromodel_path = "/rds/general/user/sb2518/home/opt/schrodinger2018-1"
precursor_dir = Path(
    "/rds/general/user/sb2518/home/PhD/main_projects"
    "/synthetic_accessibility_project/stages/Project_Data/Precursor_Databases"
    "/all_precursors_filtered"
)

logging.info("Loading input file.")

# #####################################################################
# Number of processes to start with the EA.
# #####################################################################

num_processes = int(os.environ.get("CPUS"))

# #####################################################################
# Set logging level.
# #####################################################################

logging_level = logging.DEBUG


# #####################################################################
# Toggle the writing of a log file.
# #####################################################################

log_file = True


# #####################################################################
# Toggle the dumping of EA generations.
# #####################################################################

progress_dump = True

# #####################################################################
# Toggle the dumping of molecules at every generation.
# #####################################################################

debug_dumps = False

# #####################################################################
# Make a tar archive of the output.
# #####################################################################

tar_output = True

# #####################################################################
# Initial population.
# #####################################################################

population_size = 25


# Generator for all precursors.
aldehydes = precursor_dir.glob("**/aldehyde*.mol")
amines = precursor_dir.glob("**/amine*.mol")

# Initialize building block structures.
aldehyde_building_blocks = [
    stk.BuildingBlock.init_from_file(
        str(building_block),
        ["aldehyde"],
        use_cache=True
    )
    for building_block in aldehydes
]

amine_building_blocks = [
    stk.BuildingBlock.init_from_file(
        str(building_block),
        ["primary_amine"],
        use_cache=True
    )
    for building_block in amines
]


topology_graph = [
    stk.cage.FourPlusSix()
]

# Create initial population.

population = stk.EAPopulation.init_diverse(
    building_blocks=[aldehyde_building_blocks, amine_building_blocks],
    topology_graphs=topology_graph,
    size=population_size,
    use_cache=True,
)

# #####################################################################
# Selector for selecting the next generation.
# #####################################################################

# Settings for stochastic sampling.
generation_selector = stk.StochasticUniversalSampling(
    num_batches=population_size,
    random_seed=random_seed,
    duplicate_batches=False,
    duplicate_mols=False,
)

# #####################################################################
# Selector for selecting parents.
# #####################################################################

# Settings for tournament sampling for crossover.
crossover_selector = stk.Tournament(
    num_batches=10,
    batch_size=2,
    duplicate_batches=False,
    duplicate_mols=False,
    random_seed=random_seed,
)

# #####################################################################
# Selector for selecting molecules for mutation.
# #####################################################################

mutation_selector = stk.Roulette(
    num_batches=5,
    duplicate_mols=False,
    batch_size=1,
    random_seed=random_seed,
)


# #####################################################################
# Crosser.
# #####################################################################

crosser = stk.GeneticRecombination(
    key=lambda mol: mol.func_groups[0].fg_type.name,
    random_seed=random_seed,
)

# #####################################################################
# Mutator.
# #####################################################################

mutator = stk.Random(
    stk.RandomBuildingBlock(
        amine_building_blocks,
        key=lambda mol:
            mol.func_groups[0].fg_type.name
            == "primary_amine",
        duplicate_building_blocks=False,
        random_seed=random_seed,
    ),
    stk.SimilarBuildingBlock(
        amine_building_blocks,
        key=lambda mol:
            mol.func_groups[0].fg_type.name
            == "primary_amine",
        duplicate_building_blocks=False,
        random_seed=random_seed,
    ),
    stk.RandomBuildingBlock(
        aldehyde_building_blocks,
        key=lambda mol:
            mol.func_groups[0].fg_type.name
            == "aldehyde",
        duplicate_building_blocks=False,
        random_seed=random_seed,
    ),
    stk.SimilarBuildingBlock(
        aldehyde_building_blocks,
        key=lambda mol:
            mol.func_groups[0].fg_type.name
            == "aldehyde",
        duplicate_building_blocks=False,
        random_seed=random_seed,
    ),
)


# #####################################################################
# Optimizer.
# #####################################################################


# Optimizer for full-run.
failed_optimizer = stk.NullOptimizer(use_cache=True)

optimizer = stk.TryCatch(
    stk.Sequence(
        stk.MacroModelForceField(
            macromodel_path=macromodel_path,
            restricted=True,
            use_cache=True,
            timeout=10800,
        ),
        stk.MacroModelForceField(
            macromodel_path=macromodel_path,
            restricted=False,
            use_cache=True,
            timeout=10800,
        ),
        stk.TryCatch(
            stk.MacroModelMD(
                macromodel_path=macromodel_path,
                temperature=700,
                eq_time=100,
                use_cache=True,
                timeout=10800,
            ),
            stk.NullOptimizer(
                use_cache=True,
            ),
        ),
    ),
    failed_optimizer,
    use_cache=True,
)


# #####################################################################
# Fitness Attributes to Dump.
# #####################################################################

dump_attrs = [
    "pore_diameter",
    "largest_window",
    "window_std",
    "sa_score",
]

# #####################################################################
# Fitness Calculator.
# #####################################################################

# Normalizer for saving individual fitness scores.


class Saver(stk.FitnessNormalizer):
    # Fitness function in order:
    # Pore volume
    # Window size
    # Asymmetry
    # Synthetic accessibility
    def normalize(self, population):
        # Write the individual fitness values to the file.
        fitness_values = population.get_fitness_values()
        for mol in population:
            mol.pore_diameter = fitness_values[mol][0]
            mol.largest_window = fitness_values[mol][1]
            mol.window_std = fitness_values[mol][2]
            mol.sa_score = fitness_values[mol][3]
        return fitness_values


save_fitness = Saver()


def pore_diameter(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    pore_diameter = pw_mol.calculate_pore_diameter()
    # Ideal pore diameter is 5 A.
    if (
        pore_diameter is not None or
        isinstance(pore_diameter, float)
    ):
        return pore_diameter
    else:
        return pore_diameter


def largest_window(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    largest_window = None
    windows = pw_mol.calculate_windows()
    if windows is not None and len(windows) > 3:
        largest_window = max(windows)
    # Ideal window diameter is 5 A.
    if (
        largest_window is not None or
        isinstance(largest_window, float)
    ):
        return largest_window
    else:
        return largest_window


def window_std(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    windows = pw_mol.calculate_windows()
    window_std = None
    if windows is not None and len(windows) > 3:
        window_std = np.std(windows)
    return window_std


# #####################################################################
# Synthetic Accessibility Model Scoring Options
# #####################################################################

# RFModel function
def get_fingerprint(mol):
    """
    Gets Morgan fingerprint bit counts.

    Parameters
    ----------
    mol : :class:`rdkit.Mol`
        The molecule in :mod:`rdkit` format to have its fingerprints
        calculated.
    """
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


ml_model = joblib.load(
    "/rds/general/user/sb2518/home/PhD/main_projects/"
    "synthetic_accessibility_project/stages/stage2_screening_workflow/"
    "create_image/Evolutionary_Algorithm"
    "/EA_PBS/Utilities/RandomForestClassifier.joblib"
)


def mlscore(mol):
    scores = []
    for bb in mol.get_building_blocks():
        rdkit_mol = bb.to_rdkit_mol()
        rdkit_mol.UpdatePropertyCache()
        rdkit.GetSymmSSSR(rdkit_mol)
        rdkit_mol.GetRingInfo()
        fp = np.array(get_fingerprint(rdkit_mol)).reshape(1, -1)
        prob = ml_model.predict_proba(fp)[0][0]
        scores.append(prob)
    return sum(scores)


# SAScore function
from Utilities.SAScore.sascorer import calculateScore # noqa:


def sascore(mol):
    scores = []
    for bb in mol.get_building_blocks():
        rdkit_mol = bb.to_rdkit_mol()
        rdkit_mol.UpdatePropertyCache()
        rdkit.GetSymmSSSR(rdkit_mol)
        rdkit_mol.GetRingInfo()
        scores.append(calculateScore(rdkit_mol))
    return sum(scores)


# SCScore function
from Utilities.SCScore.scscore.standalone_model_numpy import SCScorer  # noqa:


scscore_cls = SCScorer()
scscore_cls.restore()
scscorer = lambda m: scscore_cls.get_score_from_smi(rdkit.MolToSmiles(m))  # noqa:


def scscore(mol):
    scores = []
    for bb in mol.get_building_blocks():
        rdkit_mol = bb.to_rdkit_mol()
        rdkit_mol.UpdatePropertyCache()
        rdkit.GetSymmSSSR(rdkit_mol)
        rdkit_mol.GetRingInfo()
        scores.append(scscorer(rdkit_mol)[1])
    return sum(scores)


# Defines synthetic accesibility function to use.
synthetic_accesibility_func = scscore

cage_fitness_calculator = stk.PropertyVector(
    pore_diameter,
    largest_window,
    window_std,
    synthetic_accesibility_func,
)

fitness_calculator = stk.If(
    condition=lambda mol: failed_optimizer.is_in_cache(mol),
    true_calculator=stk.FitnessFunction(lambda mol: None),
    false_calculator=cage_fitness_calculator,
)


# #####################################################################
# Fitness normalizer.
# #####################################################################


def valid_fitness(population, mol):
    f = population.get_fitness_values()[mol]
    if not isinstance(f, list):
        return f is not None

    elif isinstance(f, list):
        return None not in population.get_fitness_values()[mol]

    else:
        return False


# Minimize synthetic accessibility and asymmetry.
# Maximise pore volume and window size.
fitness_normalizer = stk.TryCatch(
    stk.Sequence(
        save_fitness,
        stk.Power([1, 1, -1, -1], filter=valid_fitness),
        stk.DivideByMean(filter=valid_fitness),
        stk.Multiply([0, 0, 0, 0], filter=valid_fitness),
        stk.Sum(filter=valid_fitness),
        # Replace all fitness values that are lists or None with
        # a small value.
        stk.ReplaceFitness(
            replacement_fn=lambda population: 1e-8,
            filter=lambda p, m:
                isinstance(
                    p.get_fitness_values()[m],
                    (list, type(None)),
                )
        ),
    ),
    stk.ReplaceFitness(replacement_fn=lambda population: 1e-8,)
)

# #####################################################################
# Exit condition.
# #####################################################################

terminator = stk.NumGenerations(50)

# #####################################################################
# Make plotters.
# #####################################################################


def apply(fn):

    def filter_fn(mol):
        return not hasattr(mol, fn.__name__)

    def inner(progress):
        all(True for _ in map(fn, filter(filter_fn, progress)))
    return inner


plotters = [
    stk.ProgressPlotter(
        filename="fitness_plot",
        property_fn=lambda progress, mol:
            progress.get_fitness_values()[mol],
        y_label="Fitness",
        filter=lambda progress, mol:
            progress.get_fitness_values()[mol],
        progress_fn=lambda progress:
            progress.set_fitness_values_from_calculators(
                fitness_calculator=fitness_calculator,
                fitness_normalizer=fitness_normalizer,
                num_processes=num_processes,
            ),
    ),
    stk.ProgressPlotter(
        filename="synthetic_accesibility_scores",
        property_fn=lambda progress, mol: mol.sa_score,
        y_label="Synthetic Accessibility / unitless",
        filter=lambda progress, mol:
            mol.sa_score is not None,
        progress_fn=apply(synthetic_accesibility_func),
    ),
    stk.ProgressPlotter(
        filename="volume_plot",
        property_fn=lambda progress, mol: mol.pore_diameter,
        y_label="Pore Diameter / A",
        filter=lambda progress, mol:
            mol.pore_diameter is not None,
        progress_fn=apply(pore_diameter),
    ),
    stk.ProgressPlotter(
        filename="max_window_size",
        property_fn=lambda progress, mol: mol.largest_window,
        y_label="Maximum Window Size / A",
        filter=lambda progress, mol:
            mol.largest_window is not None,
        progress_fn=apply(largest_window),
    ),
    stk.ProgressPlotter(
        filename="window_std",
        property_fn=lambda progress, mol: mol.window_std,
        y_label="Std. Dev. of Window Diameters / A",
        filter=lambda progress, mol:
            mol.window_std is not None,
        progress_fn=apply(window_std),
    )
]

stk.SelectionPlotter(
    filename="generational_selection",
    selector=generation_selector,
)
stk.SelectionPlotter(
    filename="crossover_selection",
    selector=crossover_selector,
)
stk.SelectionPlotter(
    filename="mutation_selection",
    selector=mutation_selector,
)
