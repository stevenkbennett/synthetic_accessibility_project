import stk
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
    pop_path = Path('/rds/general/user/sb2518/home/WORK/main_projects/synthetic_accessibility_project/stages/stage2_evolutionary_algorithm/create_image/case_studies/case_study_1_shape_persistant/No_SA/run3_almost_finished/ea_run.log')
    pop = load_population(pop_path)
    print(pop[0])
    

if __name__='__main__':
    main()