"""Script for running evolutionary algorithm in parallel."""
import argparse
import subprocess as sp
from pathlib import Path
import re
import itertools as it


def parse_directory(path: str):
    """Parses directory structure to build input file."""
    input_info = {}
    scores = set(["SCScore", "SAScore", "NoSA", "MLModel"])
    case_study = set(["Case_Study_1", "Case_Study_2"])
    input_info.update({"Score_Name": x for x in scores if x in path})
    input_info.update({"Case_Study": x for x in case_study if x in path})
    coefficient_match = re.search("Coefficient_(\d+)", path)
    if coefficient_match:
        coefficient = coefficient_match.group(1)
    else:
        coefficient = "0"
    input_info.update({"SA_Coefficient": coefficient})
    return input_info


def convert_input(input_info, path):
    """Writes new input file."""
    # Read template first.
    with open(
        str(Path(__file__).resolve().parent.joinpath("Input_Template.py")), "r"
    ) as f:
        input_template = f.readlines()
    changed_lines = [
        "stk.Multiply",
        "synthetic_accesibility_func = ",
    ]
    filtered_lines_indexes = (
        input_template.index(line)
        for changed_line in changed_lines
        for line in input_template
        if changed_line in line
    )
    for index in filtered_lines_indexes:
        if "0]" in input_template[index]:
            # Replace coefficients for case study.
            if "1" in input_info["Case_Study"]:
                input_template[index] = input_template[index].replace(
                    "[0, 0, 0,", "[5, 1, 10,"
                )
            elif "2" in input_info["Case_Study"]:
                input_template[index] = input_template[index].replace(
                    "[0, 0, 0,", "[10, 0, 5,"
                )
            # Replace coefficients for SA score.
            input_template[index] = input_template[index].replace(
                "0]", f"{input_info['SA_Coefficient']}]"
            )
        elif "synthetic_" in input_template[index]:
            input_template[index] = (
                input_template[index].split("=")[0]
                + f"= {input_info['Score_Name'].lower()}\n"
            )

    # Check if directory exists. If not, create it.
    with open(str(Path(path).resolve().joinpath("Input.py")), "w") as f:
        # Write new input file.
        f.write("".join(it.chain.from_iterable(input_template)))


def main(args):
    input_info = parse_directory(args.directory)
    # Write input to the specified directory.
    convert_input(input_info, args.directory)
    pbs_array_path = Path(__file__).parent.joinpath("EA_Job.pbs")
    # Build the the PBS command.
    if args.num_runs != "1":
        pbs_run_command = [
            "qsub",
            "-lwalltime=72:00:00",
            "-lselect=1:ncpus=8:mem=10gb:ompthreads=8",
            "-N",
            args.run_name,
            "-J",
            f"1-{args.num_runs}",
            # Specify environmental variables.
            "-v",
            f"START_DIR={str(Path(args.directory).resolve())}, CPUS=8",
            str(pbs_array_path),
        ]
    elif args.num_runs == "1":
        pbs_run_command = [
            "qsub",
            "-lwalltime=00:29:00",
            "-lselect=1:ncpus=1:mem=5gb:ompthreads=1",
            "-N",
            args.run_name,
            # Specify environmental variables.
            "-v",
            f"START_DIR={str(Path(args.directory).resolve())}, CPUS=1",
            str(pbs_array_path),
        ]
    # # Executes the PBS script.
    sp.run(pbs_run_command)


if __name__ == "__main__":
    parser = argparse.ArgumentParser("Starts evolutionary algorithm run.")
    parser.add_argument(
        "-d",
        dest="directory",
        type=str,
        action="store",
        help="The directory to start the run from.",
    )
    parser.add_argument(
        "-n",
        dest="num_runs",
        type=str,
        action="store",
        help="The number of evolutionary algorithm runs.",
    )
    parser.add_argument(
        "--name",
        dest="run_name",
        type=str,
        action="store",
        help="The name of the PBS job.",
    )
    args = parser.parse_args()
    main(args)
