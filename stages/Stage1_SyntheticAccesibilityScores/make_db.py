from synthetic_accesibility_scores import SyntheticAccesibilityScorer
from rdkit.Chem import AllChem as rdkit
import sqlite3
import multiprocessing as mp
from pathos.pools import ProcessPool
import os
import argparse
from functools import partial
from typing import Generator
from glob import iglob
import itertools as it
import traceback
from tqdm import tqdm

fg_names = {
    "primary amine": "[NX3;H2;!$(NC=[!#6]);!$(NC#[!#6])][#6]",
    "aldehyde": "[CX3H1](=O)[#6]",
}


def make_entry(
    mol: rdkit.Mol, sa_scorer: SyntheticAccesibilityScorer,
):
    # Ensure hydrogens are added to molecule.
    mol = rdkit.AddHs(mol)
    sascore, scscore, rfmodel = [
        sa_scorer.calculate_sa(mol, func) for func in sa_scorer.sa_funcs
    ]
    try:
        fg_name = str(
            list(
                filter(
                    lambda x: len(
                        mol.GetSubstructMatch(rdkit.MolFromSmarts(fg_names[x]))
                    )
                    != 0,
                    fg_names,
                )
            )[0]
        )
    except:
        fg_name = ""
    return (
        rdkit.MolToSmiles(mol),
        str(fg_name),
        float(sascore),
        float(scscore),
        float(rfmodel),
    )


def make_database(db_path: str, mol_paths: Generator[str, None, None]):
    processes = int(os.environ.get("NCPUS", mp.cpu_count()))
    with ProcessPool(processes) as pool:
        try:
            print("Starting loading molecules.")
            mols = list(
                pool.map(
                    lambda m: rdkit.MolFromMolFile(m, removeHs=False),
                    tqdm(mol_paths),
                )
            )
            sa_scorer = SyntheticAccesibilityScorer()
            conn = sqlite3.connect(db_path)
            cur = conn.cursor()
            cur.execute(
                """
                CREATE TABLE IF NOT EXISTS synthetic_accesibility (
                    smiles TEXT,
                    func_group TEXT,
                    sascore FLOAT,
                    scscore FLOAT,
                    rfmodel FLOAT
                )"""
            )
            func = partial(make_entry, sa_scorer=sa_scorer,)
            results = pool.map(func, mols,)
            print("Starting calculating scores.")
            cur.executemany(
                "INSERT INTO synthetic_accesibility VALUES (?, ?, ?, ?, ?)",
                results,
            )
            conn.commit()
            conn.close()
            pool.close()
        except Exception as err:
            traceback.print_exc()
            print(err)
            pool.close()


def main():
    parser = argparse.ArgumentParser(
        description="Calculate synthetic accesibility scores."
    )
    parser.add_argument(
        "db",
        type=str,
        nargs="+",
        help="Path to directory containing molecules as `.mol` files.",
    )
    parser.add_argument("-n", type=str, help="Filename of database.")
    args = parser.parse_args()
    db_gen = it.chain.from_iterable(iglob(p + "/*.mol") for p in args.db)
    make_database(args.n, db_gen)


if __name__ == "__main__":
    main()
