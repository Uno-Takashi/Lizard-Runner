import argparse
from pathlib import Path

parser = argparse.ArgumentParser(description="Validate the argument of lizard")
parser.add_argument(
    "-language",
    choices=[
        "cpp",
        "java",
        "csharp",
        "javascript",
        "python",
        "objectivec",
        "ttcn",
        "ruby",
        "php",
        "swift",
        "scala",
        "GDScript",
        "go",
        "lua",
        "rust",
        "typescript",
    ],
    type=str,
)
parser.add_argument("-verbose", choices=["true", "false"], type=str)
parser.add_argument("-CCN", type=int)
parser.add_argument("-input_file", type=str)
parser.add_argument("-output_file", type=str)
parser.add_argument("-length", type=int)
parser.add_argument("-arguments", type=str)
parser.add_argument("-warnings_only", choices=["true", "false"], type=str)
parser.add_argument("-warning_msvs", choices=["true", "false"], type=str)
parser.add_argument("-ignore_warnings", type=str)
parser.add_argument("-exclude", type=str)
parser.add_argument("-working_threads", type=int)
parser.add_argument("-xml", choices=["true", "false"], type=str)
parser.add_argument("-html", choices=["true", "false"], type=str)
parser.add_argument("-modified", choices=["true", "false"], type=str)
parser.add_argument("-extension", type=str)
parser.add_argument("-sort", type=str)
parser.add_argument("-Threshold", type=str)
parser.add_argument("-whitelist", type=Path)

args = parser.parse_args()

print(args)

lizard_args: list = []

lizard_args.extend(["-language", args.language])
if args.verbose.lower() == "true":
    lizard_args.append("-verbose")

print(" ".join(lizard_args))
