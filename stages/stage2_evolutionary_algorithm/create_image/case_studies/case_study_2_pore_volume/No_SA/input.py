# #####################################################################
# Imports.
# #####################################################################

import stk
import logging
from pathlib import Path
import numpy as np
import pywindow

# Global settings.

random_seed = 3
macromodel_path = '/rds/general/user/sb2518/home/opt/schrodinger2018-1'

file_path = Path(__file__)

# Identify and set the base directory.
for parent in file_path.parents:
    if parent.name == 'create_image':
        base_image_path = parent

logging.info('Loading input file.')

# #####################################################################
# Number of processes to start with the EA.
# #####################################################################

num_processes = 32

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
# Set attributes to write to JSON.
# #####################################################################

dump_attrs = [
    'sa_score',
    'largest_window',
    'window_std',
    'pore_diameter',
]

# #####################################################################
# Initial population.
# #####################################################################

population_size = 25

building_blocks_path = base_image_path.joinpath(
    'databases',
    'all_precursors_filtered',
)

aldehydes = building_blocks_path.glob('**/aldehyde*.mol')
amines = building_blocks_path.glob('**/amine*.mol')

# Initialize building block structures.
aldehyde_building_blocks = [
    stk.BuildingBlock.init_from_file(
        str(building_block),
        ['aldehyde'],
        use_cache=True
    )
    for building_block in aldehydes
]

amine_building_blocks = [
    stk.BuildingBlock.init_from_file(
        str(building_block),
        ['primary_amine'],
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
)

# #####################################################################
# Selector for selecting parents.
# #####################################################################

# Settings for tournament sampling for crossover.
crossover_selector = stk.Tournament(
    num_batches=10,
    batch_size=2,
    duplicate_batches=False,
    random_seed=random_seed,
)

# #####################################################################
# Selector for selecting molecules for mutation.
# #####################################################################

mutation_selector = stk.Roulette(
    num_batches=5,
    duplicate_mols=True,
    batch_size=1,
    random_seed=random_seed,
)


# #####################################################################
# Crosser.
# #####################################################################

crosser = stk.GeneticRecombination(
    key=lambda mol: mol.func_groups[0].fg_type.name,
    random_seed=random_seed,
    use_cache=True,
)

# #####################################################################
# Mutator.
# #####################################################################

mutator = stk.Random(
    stk.RandomBuildingBlock(
        amine_building_blocks,
        key=lambda mol: mol.func_groups[0].\
        fg_type.name == 'primary_amine',
        random_seed=random_seed,
        use_cache=True,
    ),
    stk.SimilarBuildingBlock(
        amine_building_blocks,
        key=lambda mol: mol.func_groups[0].\
        fg_type.name == 'primary_amine',
        duplicate_building_blocks=False,
        random_seed=random_seed,
        use_cache=True,
    ),
    stk.RandomBuildingBlock(
        aldehyde_building_blocks,
        key=lambda mol: mol.func_groups[0].fg_type.name == 'aldehyde',
        random_seed=random_seed,
        use_cache=True,
    ),
    stk.SimilarBuildingBlock(
        aldehyde_building_blocks,
        key=lambda mol: mol.func_groups[0].fg_type.name == 'aldehyde',
        duplicate_building_blocks=False,
        random_seed=random_seed,
        use_cache=True,
    ),
)

# #####################################################################
# Optimizer.
# #####################################################################


# Optimizer for full-run.
optimizer = stk.Sequence(
    stk.MacroModelForceField(
        macromodel_path=macromodel_path,
        restricted=True,
        use_cache=True,
    ),
    stk.MacroModelForceField(
        macromodel_path=macromodel_path,
        restricted=False,
        use_cache=True,
    ),
    stk.MacroModelMD(
        macromodel_path=macromodel_path,
        temperature=700,
        eq_time=100,
        use_cache=True,
    ),
    use_cache=True,
)


# #####################################################################
# Fitness Calculator.
# #####################################################################

def pore_diameter(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    mol.pore_diameter = pw_mol.calculate_pore_diameter()
    # Ideal pore diameter is 5 A.
    return mol.pore_diameter


def largest_window(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    mol.largest_window = None
    windows = pw_mol.calculate_windows()
    if windows is not None:
        mol.largest_window = max(windows)
    # Ideal window diameter is 5 A.
    return mol.largest_window


def window_std(mol):
    pw_mol = pywindow.Molecule.load_rdkit_mol(mol.to_rdkit_mol())
    windows = pw_mol.calculate_windows()
    mol.window_std = None
    if windows is not None and len(windows) > 3:
        mol.window_std = np.std(windows)
    return mol.window_std


def sa_score(mol):
    return 10


fitness_calculator = stk.PropertyVector(
    pore_diameter,
    largest_window,
    window_std,
    sa_score,
)

# #####################################################################
# Fitness normalizer.
# #####################################################################


def valid_fitness(population, mol):
    return None not in population.get_fitness_values()[mol]


# Minimize synthetic accessibility and asymmetry.
# Maximise pore volume and window size.
fitness_normalizer = stk.Sequence(
    stk.Power([1, 1, 1, 1], filter=valid_fitness),
    stk.DivideByMean(filter=valid_fitness),
    # Coefficients of fitness function in order:
    # Pore volume: 10
    # Window size: 0
    # Asymmetry: 5
    # Synthetic accessibility: 0
    stk.Multiply([10, 0, 5, 0], filter=valid_fitness),
    stk.Sum(filter=valid_fitness),
    # Replace all fitness values that are lists with
    # minimum fitness / 2.
    stk.ReplaceFitness(
        replacement_fn=lambda population:
            min(
                f for _, f in population.get_fitness_values().items()
                if not isinstance(f, list)
            ) / 2,
        filter=lambda p, m:
            isinstance(p.get_fitness_values()[m], list),
    )
)

# #####################################################################
# Exit condition.
# #####################################################################

terminator = stk.FitnessPlateau(
    num_generations=5,
    top_members=3,
)

# #####################################################################
# Make plotters.
# #####################################################################

plotters = [
    stk.ProgressPlotter(
        filename='fitness_plot',
        property_fn=lambda progress, mol:
            progress.get_fitness_values()[mol],
        y_label='Fitness',
        filter=lambda progress, mol:
            progress.get_fitness_values()[mol],
        progress_fn=lambda progress:
            progress.set_fitness_values_from_calculators(
                fitness_calculator=fitness_calculator,
                fitness_normalizer=fitness_normalizer,
                num_processes=num_processes,
            )
    ),
    stk.ProgressPlotter(
        filename='sascore_plot',
        property_fn=lambda mol: mol.sa_score,
        y_label='Synthetic Accessibility / unitless',
        filter=lambda progress, mol:
            mol.sa_score is not None,
    ),
    stk.ProgressPlotter(
        filename='volume_plot',
        property_fn=lambda mol: mol.pore_diameter,
        y_label='Pore Diameter / A',
        filter=lambda progress, mol:
            mol.pore_diameter is not None,
    ),
    stk.ProgressPlotter(
        filename='max_window_size',
        property_fn=lambda mol: mol.largest_window,
        y_label='Maximum Window Size / A',
        filter=lambda progress, mol:
            mol.largest_window is not None,
    ),
    stk.ProgressPlotter(
        filename='window_std',
        property_fn=lambda mol: mol.window_std,
        y_label='Std. Dev. of Window Diameters / A',
        filter=lambda progress, mol:
            mol.window_std is not None,
    )
]

stk.SelectionPlotter(
    filename='generational_selection',
    selector=generation_selector,
)
stk.SelectionPlotter(
    filename='crossover_selection',
    selector=crossover_selector,
)
stk.SelectionPlotter(
    filename='mutation_selection',
    selector=mutation_selector,
)
