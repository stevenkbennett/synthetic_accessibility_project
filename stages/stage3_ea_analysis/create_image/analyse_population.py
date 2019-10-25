from pathlib import Path
import re
import importlib
from stk import (
    BuildingBlock,
    ConstructedMolecule,
    cage,
)


def load_population(pop_path):
    '''Loads the population of molecules from the EA.'''
    with open(pop_path, 'r') as f:
        pop = []
        subpop = []
        if 'fitness' in pop_path:
            recording = True
        else:
            recording = False
<<<<<<< HEAD
            if 'Population log:' in line:
                recording = True
            elif recording == True and 'ConstructedMolecule' in line:
                subpop.append(line)
                print(subpop)
            elif line == '\n':
                recording = False
                break
        pop.append(subpop)
        finished_recording = False
        while not finished_recording:
            subpop = []
            line = f.readline()
            if 'Selecting members of the next generation' in line:
                for line in f:
                    if 'ConstructedMolecule' in line:
                        subpop.append(line)
                    elif 'Starting' in line:
                        pop.append(subpop)
                        break



def main():
    pop_path = Path('/rds/general/user/sb2518/home/WORK/main_projects/synthetic_accessibility_project/stages/stage3_ea_analysis/create_image/example_pop.log')
    pop = load_population(pop_path)
    print(pop)
    

if __name__=='__main__':
    main()
=======

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


def parse_population(pop):
    # Import modules from stk.
    stk_pop = []
    for sp in pop:
        subpop = []
        for mem in sp:
            p_bb = re.compile('(Const[^\t]+)')
            stk_mem = eval(p_bb.search(mem)[0])
            subpop.append(stk_mem)
        stk_pop.append(stk_mem)
    return stk_pop


def get_stk_pop(pop_path):
    pop_path = Path(pop_path)
    pop = load_population(str(pop_path))
    pop = parse_population(pop)
    return pop
>>>>>>> b433549099eb7c727c6a7ec83d8f7f4d2b017cba
