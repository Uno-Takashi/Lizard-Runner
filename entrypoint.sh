#!/bin/bash
set -eax

echo "::group::SetArguments"

base_dir=`pwd`

path=$1
cli_output_file=$2
language=$3
verbose=$4
CCN=$5
input_file=$6
if [ -z "$input_file" ]; then
  input_file="None"
fi
output_file=$7
if [ -z "$output_file" ]; then
  output_file="None"
fi
length=$8
arguments=$9
if [ -z "$arguments" ]; then
  arguments="None"
fi
warnings_only=${10}
warning_msvs=${11}
ignore_warnings=${12}
if [ -z "$ignore_warnings" ]; then
  ignore_warnings="None"
fi
exclude=${13}
if [ -z "$exclude" ]; then
  exclude="None"
fi
working_threads=${14}
xml=${15}
html=${16}
modified=${17}
extension=${18}
if [ -z "$extension" ]; then
  extension="None"
fi
sort=${19}
if [ -z "$sort" ]; then
  sort="None"
fi
Threshold=${20}
if [ -z "$Threshold" ]; then
  Threshold="None"
fi
whitelist=${21}

result_cli=`lizard | tee $cli_output_file`
result_cli="${result_cli//$'\n'/\\n}"

python /src/lizard_argument_validator.py

echo "::group::Outputs"
echo ::set-output name=result_output_path::$cli_output_file