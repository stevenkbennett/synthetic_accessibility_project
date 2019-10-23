import stk
from pathlib import Path
from itertools import islice
import re


def load_population(pop_path):
    '''Loads the population of molecules from the EA.'''
    with open(pop_path, 'r') as f:
        pop = []
        subpop = []
        recording = False
        gen = 1
        for line in f:
            # Initial population treated differently.
            if gen == 1:
                if 'Population log:' in line:
                    recording = True
                    print('New generation - recording.')
                elif 'ConstructedMolecule' in line and recording:
                    subpop.append(line)
                elif 'Starting generation' in line and recording:
                    recording = False
                    pop.append(subpop)
                    subpop = []
                    gen += 1
            elif gen != 1:
                if 'Selecting members' in line:
                    recording = True
                    print('New generation - recording.')
                elif 'ConstructedMolecule' in line and recording:
                    subpop.append(line)
                elif 'Starting' in line or 'Successful' in line and recording:
                    recording = False
                    pop.append(subpop)
                    subpop = []
                    gen += 1
        return pop

(\d)+ +\t(.*)\)\)\t\t\[((\d+.\d+), )+]\t(\d+.\d.)
def load_stk_pop(pop):
    '''
    Loads stk populations.
    '''
    for gen in pop:
        for mem in gen:
            id = 


def main():
    pop_path = Path('/Users/stevenbennett/Box/Steven/Work/PhD/Work/main_projects/synthetic_accessibility_project/stages/stage3_ea_analysis/create_image/example_pop.log')
    pop = load_population(str(pop_path))


if __name__=='__main__':
    main()