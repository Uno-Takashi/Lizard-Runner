#!/bin/bash
set -eax

base_dir=`pwd`

path=$0
cli_output_file=$1
language=$2
verbose=$3
CCN=$4
input_file=$5
output_file=$6
length=$7
arguments=$8
warnings_only=$9
warning_msvs=${10}
ignore_warnings=${11}
exclude=${12}
working_threads=${13}
xml=${14}
html=${15}
modified=${16}
extension=${17}
sort=${18}
Threshold=${19}
whitelist=${20}

echo $whitelist

result_cli="test"
result_cli=`lizard | tee $cli_output_file`
result_cli="${result_cli//$'\n'/\\n}"

echo "::group::Outputs"
echo ::set-output name=result_cli::$result_cli