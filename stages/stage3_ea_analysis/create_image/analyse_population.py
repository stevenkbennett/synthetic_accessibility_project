from pathlib import Path
from itertools import islice


def load_population(pop_path):
    '''Loads the population of molecules from the EA.'''
    with open(str(pop_path),'r') as f:
        pop = []
        subpop = [] 
        for line in f:
            # Obtain first population.
            recording = False
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