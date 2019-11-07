import tarfile
from pathlib import Path
import shutil
import os

current_dir = Path.cwd()
ea_run = current_dir.joinpath('stk_ea_runs', '0')

with tarfile.open(str(ea_run.joinpath('schrodinger_files.tar.gz')), "w:gz") as tar:
    schrodinger_files = ea_run.joinpath('scratch')
    print('Compressing Schrodinger files.')
    for file in schrodinger_files.glob('[0-9]*'):
        tar.add(file)
        if file.is_dir():
            shutil.rmtree(file)
        else:
            os.remove(file)
    print('Finished compressing Schrodinger files.')

with tarfile.open(str(ea_run.joinpath('ea_selection_files.tar.gz')), "w:gz") as tar:
    schrodinger_files = ea_run.joinpath('scratch')
    print('Compressing selection files.')
    patts = ('crossover*', 'generational*', 'mutation*')
    for patt in patts:
        for file in schrodinger_files.glob(patt):
            tar.add(file)
            if file.is_dir():
                shutil.rmtree(file)
            else:
                os.remove(file)
    print('Finished compressing EA run graphs.')
