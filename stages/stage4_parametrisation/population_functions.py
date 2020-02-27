'''
Contains useful population functions
for projects, using stk.
Date: 17/02/2020
Author: Steven Bennett
'''
import argparse
from pathlib import Path
import stk
import logging


class PopulationLoadError(Exception):
    '''Error loading population dumps.
    '''
    ...


def combine_populations(pop_paths, output_path):
    '''Combines multiple population files.

    '''
    # Load initial populations.
    try:
        small_pops = [stk.EAPopulation.load(str(p)) for p in pop_paths]
    except PopulationLoadError:
        logger.error('Could not load all population files.')

    large_pop = stk.EAPopulation()
    # Add all individual molecules to the large population.
    large_pop.add_members(mol for pop in small_pops for mol in pop)
    # Dump the large population.
    large_pop.dump(output_path)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Perform actions on stk populations.')
    parser.add_argument('-c', nargs=2)
    args = parser.parse_args()
    # Combine the populations.
    logger = logging.getLogger()
    if args.c:
        pop_paths = Path(args.c[0]).glob('**/*.json')
        # Combine and dump the large population.
        combine_populations(pop_paths, args.c[1])
