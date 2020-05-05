'''Script for running evolutionary algorithm in parallel.'''
import argparse
import os
import subprocess as sp
from pathlib import Path


def main(args):
    directory = Path(args.directory)
    num_runs = args.num_runs
    run_name = args.run_name
    pbs_array_path = (
        '/rds/general/user/sb2518/home/WORK/'
        'main_projects/synthetic_accessibility_project/stages/'
        'stage2_evolutionary_algorithm/create_image/ea_array/'
        'ea_array.pbs'
    )
    # Sets up the PBS command.
    pbs_run_command = [
        'qsub',
        '-N', run_name,
        '-J', f'1-{num_runs}',
        # Note: Everything must be comma-separated in variables.
        '-v', f'START_DIR={str(directory)}, CPU_COUNT=8',
        pbs_array_path,
    ]
    # Executes the PBS script.
    sp.run(pbs_run_command)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        'Starts evolutionary algorithm run.'
    )
    parser.add_argument(
        '-d',
        dest='directory',
        type=str,
        action='store',
        help='The directory to start the run from.',
        default=os.getcwd(),
    )
    parser.add_argument(
        '-n',
        dest='num_runs',
        type=int,
        action='store',
        help='The number of evolutionary algorithm runs to complete.'
    )
    parser.add_argument(
        '--name',
        dest='run_name',
        type=str,
        action='store',
        help='The name of the PBS job.'
    )
    args = parser.parse_args()
    main(args)
