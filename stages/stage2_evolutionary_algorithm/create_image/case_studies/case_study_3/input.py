# #####################################################################
# Imports.
# #####################################################################

import itertools as it
import stk
import logging
from pathlib import Path
import numpy as np
import pywindow as pw
import sys
from rdkit.Chem import AllChem as rdkit
from functools import wraps

current_path = Path.cwd()
base_stage_path = current_path.parents[1]

logging.info('Loading input file.')
sys.path.append(str(current_path.parents[1]))

from utilities.scscore.scscore import SCScore

# #####################################################################
# Run GA serially.
# #####################################################################

processes = 4

# #####################################################################
# Set logging level.
# #####################################################################

logging_level = logging.WARNING

# #####################################################################
# Initial population.
# #####################################################################

population_size = 25

building_blocks_path = base_stage_path.joinpath(
    'databases',
    'all_precursors_filtered'
)

aldehydes = building_blocks_path.glob('**/aldehyde*.mol')
amines = building_blocks_path.glob('**/amine*.mol')

# Initialize building block structures.
aldehyde_building_blocks = [
    stk.BuildingBlock.init_from_file(
        str(building_block),
        ['aldehyde']) for building_block in aldehydes
]

amine_building_blocks = [
    stk.BuildingBlock.init_from_file(
        str(building_block),
        ['primary_amine']) for building_block in amines
]


topology_graph = [
    stk.cage.FourPlusSix()
]

# Create initial population.
population = stk.EAPopulation.init_diverse(
    building_blocks=[aldehyde_building_blocks, amine_building_blocks],
    topology_graphs=topology_graph,
    size=population_size,
    use_cache=True
)

# #####################################################################
# Selector for selecting the next generation.
# #####################################################################

# Settings for stochastic sampling.
generation_selector = stk.StochasticUniversalSampling(
    num_batches=population_size
)

# #####################################################################
# Selector for selecting parents.
# #####################################################################

# Settings for deterministic sampling.
crossover_selector = stk.Tournament(
    num_batches=10,
    batch_size=2
)

# #####################################################################
# Selector for selecting molecules for mutation.
# #####################################################################

mutation_selector = stk.Roulette(
    num_batches=5,
    duplicates=True,
    batch_size=1,
)


# #####################################################################
# Crosser.
# #####################################################################

crosser = stk.GeneticRecombination(
    key=lambda mol: mol.func_groups[0].fg_type.name)

# #####################################################################
# Mutator.
# #####################################################################

mutator = stk.RandomMutation(
    stk.RandomBuildingBlock(
        amine_building_blocks,
        key=lambda mol: mol.func_groups[0].\
        fg_type.name == 'primary_amine'
    ),
    stk.SimilarBuildingBlock(
        amine_building_blocks,
        key=lambda mol: mol.func_groups[0].\
        fg_type.name == 'primary_amine',
        duplicate_building_blocks=False
    ),
    stk.RandomBuildingBlock(
        aldehyde_building_blocks,
        key=lambda mol: mol.func_groups[0].fg_type.name == 'aldehyde'
    ),
    stk.SimilarBuildingBlock(
        aldehyde_building_blocks,
        key=lambda mol: mol.func_groups[0].fg_type.name == 'aldehyde',
        duplicate_building_blocks=False
    ),
)

# #####################################################################
# Optimizer.
# #####################################################################

# Schrödinger path settings.

# Optimizer for testing purposes.
macromodel_path = '/opt/schrodinger/suites2019-1'

optimizer = stk.CageOptimizerSequence(
    stk.MacroModelForceField(
        macromodel_path=macromodel_path,
        restricted=True
    ),
    stk.MacroModelMD(
        macromodel_path=macromodel_path,
        temperature=700,
        eq_time=100,
    )
)


# #####################################################################
# Fitness calculator.
# #####################################################################


scscore = SCScore()


def _function_attributes(fitness_calculator):
    @wraps(fitness_calculator)
    def add_empty_attribute(mol):
        if not hasattr(mol, 'fitness_values'):
            mol.fitness_values = {
                'asymmetry': None,
                'sascore': None,
                'volume': None,
                'window_size': None}
        return fitness_calculator(mol)
    return add_empty_attribute


@_function_attributes
def calculate_pore_volume(mol):
    rdkit_mol = mol.to_rdkit_mol()
    pywindow_system = pw.MolecularSystem.load_rdkit_mol(rdkit_mol)
    pywindow_molecule = pywindow_system.system_to_molecule()
    volume = pywindow_molecule.calculate_pore_volume()
    if volume is None:
        mol.fitness_values['volume'] = None
        return None
    mol.fitness_values['volume'] = volume
    return abs(volume-16)


@_function_attributes
def calculate_window_size(mol):
    rdkit_mol = mol.to_rdkit_mol()
    pywindow_system = pw.MolecularSystem.load_rdkit_mol(rdkit_mol)
    pywindow_molecule = pywindow_system.system_to_molecule()
    windows = pywindow_molecule.calculate_windows()
    if None in windows:
        mol.fitness_values['window_size'] = None
        return None
    mol.fitness_values['window_size'] = max(windows)
    return max(windows)


@_function_attributes
def calculate_asymmetry(mol):
    rdkit_mol = mol.to_rdkit_mol()
    pywindow_system = pw.MolecularSystem.load_rdkit_mol(rdkit_mol)
    pywindow_molecule = pywindow_system.system_to_molecule()
    windows = pywindow_molecule.calculate_windows()
    diffs = list(abs(np.ediff1d(windows)))
    sorted_diffs = sorted(diffs, reverse=True)
    # Code is from old version of stk.
    # Get indices of where the list should be split.
    split = []
    for x in range(mol.topology_graph.num_window_types-1):
        i = diffs.index(sorted_diffs[x]) + 1
        split.append(i)

    # Get the sub-lists.
    og = list(windows)
    clusters = []
    for i in sorted(split, reverse=True):
        clusters.append(og[i:])
        og = og[:i]

    if mol.topology_graph.num_window_types == 1:
        clusters.append(og)

    # After this sum the differences in each group and then
    # sum the group totals.
    diff_sums = []
    for cluster in clusters:
        diff_sum = sum(abs(w1 - w2) for w1, w2 in
                       it.combinations(cluster, 2))

        diff_num = sum(1 for _ in it.combinations(cluster, 2))
        if diff_num == 0:
            return None
        diff_sums.append(diff_sum / diff_num)
    if None in diff_sums:
        mol.fitness_values['asymmetry'] = None
        return None
    mol.fitness_values['asymmetry'] = np.mean(diff_sums)
    return np.mean(diff_sums)


@_function_attributes
def calculate_scscore(mol):
    score = []
    for bb in mol.get_building_blocks():
        rdkit_mol = bb.to_rdkit_mol()
        rdkit_mol.UpdatePropertyCache()
        rdkit.GetSymmSSSR(rdkit_mol)
        rdkit_mol.GetRingInfo()
        score.append(scscore.score(rdkit_mol))
    if None in score:
        mol.fitness_values['sascore'] = None
        return None
    mol.fitness_values['sascore'] = np.mean(score)
    return np.mean(score)


fitness_calculator = stk.PropertyVector(
    calculate_pore_volume,
    calculate_window_size,
    calculate_asymmetry,
    calculate_scscore
)

# #####################################################################
# Fitness normalizer.
# #####################################################################

# Minimize synthetic accessibility and asymmetry.
# Maximise pore volume and window size.
fitness_normalizer = stk.NormalizerSequence(
    stk.Power([-1, 1, -1, -1]),
    stk.ScaleByMean(),
    # Coefficient in order: 
    # Pore volume
    # Window size
    # Asymmetry
    # Synthetic accessibility
    stk.Multiply([10, 0, 5, 1]),
    stk.Sum()
)

# #####################################################################
# Exit condition.
# #####################################################################

terminator = stk.FitnessPlateau(
    num_generations=10,
    top_members=5
)

# #####################################################################
# Make plotters.
# #####################################################################

plotters = [
    stk.ProgressPlotter(
        filename='fitness_plot',
        property_fn=lambda mol: mol.fitness,
        y_label='Fitness',
    ),
    stk.ProgressPlotter(
        filename='sascore_plot',
        property_fn=lambda mol: mol.fitness_values['sascore'],
        y_label='Synthetic Accessibility',
    ),
    stk.ProgressPlotter(
        filename='volume_plot',
        property_fn=lambda mol: mol.fitness_values['volume'],
        y_label='Pore Volume',
    ),
    stk.ProgressPlotter(
        filename='window_size',
        property_fn=lambda mol: mol.fitness_values['window_size'],
        y_label='Window Size',
    ),
    stk.ProgressPlotter(
        filename='asymmetry',
        property_fn=lambda mol: mol.fitness_values['asymmetry'],
        y_label='Asymmetry',
    )
]

stk.SelectionPlotter(
    filename='generational_selection',
    selector=generation_selector
)
stk.SelectionPlotter(
    filename='crossover_selection',
    selector=crossover_selector
)
stk.SelectionPlotter(
    filename='mutation_selection',
    selector=mutation_selector
)
