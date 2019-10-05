import pandas as pd
from rdkit.Chem import PandasTools
from rdkit.Chem import AllChem as rdkit

data = pd.DataFrame(columns=['Score', 'Smiles'])
# Firstly merge all the data.
data1 = pd.read_json('stages/stage1_synthetic_accessibility_model_training/create_image/databases/opinions_becky.json', typ='series')
data2 = pd.read_json('stages/stage1_synthetic_accessibility_model_training/create_image/databases/opinions_mebriggs.json', typ='series')
data3 = pd.read_csv('stages/stage1_synthetic_accessibility_model_training/create_image/databases/filip.csv', sep='\t', header=None, names=['Score', 'Smiles'])
data2 = data2.to_frame('Score')
data1 = data1.to_frame('Score')

molecules = []
scores = []

for mol in data1.index:
    smiles = rdkit.MolToSmiles(rdkit.MolFromInchi(mol))
    molecules.append(smiles)

for mol in data2.index:
    smiles = rdkit.MolToSmiles(rdkit.MolFromInchi(mol))
    molecules.append(smiles)

for mol in data3['Smiles']:
    molecules.append(mol)

for score in data1.iloc[:,0].values:
    scores.append(score)

for score in data2.iloc[:,0].values:
    scores.append(score)

for score in data3['Score']:
    scores.append(score)

data_dict = {'Score': scores, 'Smiles': molecules}
data = pd.DataFrame(data_dict, columns=['Score', 'Smiles'])