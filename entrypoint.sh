#!/bin/bash
set -eax

echo "::group::ChangeDirectory"
base_dir=`pwd`

execute_path=$1
cd $execute_path

echo "::group::ValidateArguments"

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

lizard_args=`python /lib/lizard_argument_validator.py \
                    -language $language \
                    -verbose $verbose \
                    -CCN $CCN \
                    -input_file $input_file \
                    -output_file $output_file \
                    -length $length \
                    -arguments $arguments \
                    -warnings_only $warnings_only \
                    -warning_msvs $warning_msvs \
                    -ignore_warnings $ignore_warnings \
                    -exclude $exclude \
                    -working_threads $working_threads \
                    -xml $xml \
                    -html $html \
                    -modified $modified \
                    -extension $extension \
                    -sort $sort \
                    -Threshold $Threshold \
                    -whitelist $whitelist
                    `
echo "::group::RunLizard"

lizard $lizard_args | tee $cli_output_file

echo "::group::Outputs"
echo ::set-output name=result_output_path::$cli_output_file