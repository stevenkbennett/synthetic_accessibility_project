#!/usr/bin/env python
# coding: utf-8

# In[1]:


import stk
from pathlib import Path
import sys
from random import shuffle
import os


# In[2]:


sys.path.append('/rdsgpfs/general/user/sb2518/home/WORK/main_projects/synthetic_accessibility_project/stages/stage2_evolutionary_algorithm/create_image/case_studies/case_study_3/parametrisation')
sys.path.append('/rds/general/user/sb2518/home/WORK/main_projects/synthetic_accessibility_project/stages/stage2_evolutionary_algorithm/create_image')
from fitness import fitness_calculator


# In[6]:


finished_runs = list(Path.cwd().glob('case_study*/**/run*_finished'))


# In[12]:


shuffle(finished_runs)


# In[ ]:


for i, run in enumerate(finished_runs):
    running_file = run.joinpath('temp_run')
    if running_file.exists():
        continue
    else:
        print('Created file for run.')
        os.mknod(str(running_file))
    for generation in run.glob('stk_ea_runs/0/scratch/generation_*.json'):
        print(f'Loading {generation.stem}')
        generation_num = str(generation.stem).split('_')[1]
        pop = stk.EAPopulation.load(str(generation))
        print(f'{len(pop)} cages have been loaded from the generation.')
        print(f'Setting fitness values using calculator.')
        pop.set_fitness_values_from_calculators(
            fitness_calculator,
            num_processes=1,
        )
        write_path = run.joinpath('stk_ea_runs', f'fitness_generation_{generation_num}.json')
        if not write_path.exists():
            print(f'Writing generation {generation_num} to {str(write_path)}.')
            pop.dump(str(write_path), include_attrs=['sa_score', 'pore_diameter', 'largest_window', 'window_std', 'sc_score'], ignore_missing_attrs=False)
        else:
            print(f'{write_path} already exists.')
    print('Removed file for run.')
    os.remove(str(running_file))

