#!/bin/bash
set -eax

base_dir=`pwd`

path=$1
cli_output_file=$2
language=$3
verbose=$4
CCN=$5
input_file=$6
output_file=$7
length=$8
arguments=$9
warnings_only=${10}
warning_msvs=${11}
ignore_warnings=${12}
exclude=${13}
working_threads=${14}
xml=${15}
html=${16}
modified=${17}
extension=${18}
sort=${19}
Threshold=${20}
whitelist=${21}

echo `$whitelist`

result_cli="test"
result_cli=`lizard | tee $cli_output_file`
result_cli="${result_cli//$'\n'/\\n}"

echo "::group::Outputs"
echo ::set-output name=result_cli::$result_cli