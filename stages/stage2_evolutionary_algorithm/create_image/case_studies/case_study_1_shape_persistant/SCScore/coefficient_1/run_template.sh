#!/bin/bash
ea_run_count=$(($(find run* -maxdepth 0 -type d | wc -l)+1))
mkdir run$ea_run_count
cp {input_template.pbs, input_template.py, tar_ea_run.py} run$ea_run_count
cd run$ea_run_count
mv input_template.pbs input.pbs
mv input_template.py input.py
random_seed=$(shuf -i 1-65000 -n 1)
sed -i "s/random_seed = 20/random_seed = $random_seed/g" input.py
qsub input.pbs