#!/bin/bash
set -eax

echo "::group::ChangeDirectory"



echo "::group::ValidateArguments"

db='"'

path=$1
cli_output_file=$2
cli_output_file=`echo ${db}${cli_output_file}${db}`


language=$3
language=`echo ${db}${language}${db}`

verbose=$4
verbose=`echo ${db}${verbose}${db}`

CCN=$5
CCN=`echo ${db}${CCN}${db}`

input_file=$6
if [ -z "$input_file" ]; then
  input_file="None"
fi
input_file=`echo ${db}${input_file}${db}`

output_file=$7
if [ -z "$output_file" ]; then
  output_file="None"
fi
output_file=`echo ${db}${output_file}${db}`

length=$8
length=`echo ${db}${length}${db}`

arguments=$9
if [ -z "$arguments" ]; then
  arguments="None"
fi
arguments=`echo ${db}${arguments}${db}`

warnings_only=${10}
warnings_only=`echo ${db}${warnings_only}${db}`

warning_msvs=${11}
warning_msvs=`echo ${db}${warning_msvs}${db}`

ignore_warnings=${12}
if [ -z "$ignore_warnings" ]; then
  ignore_warnings="None"
fi
ignore_warnings=`echo ${db}${ignore_warnings}${db}`

exclude=${13}
if [ -z "$exclude" ]; then
  exclude="None"
fi
exclude=`echo ${db}${exclude}${db}`

working_threads=${14}
working_threads=`echo ${db}${working_threads}${db}`

xml=${15}
xml=`echo ${db}${xml}${db}`

html=${16}
html=`echo ${db}${html}${db}`

modified=${17}
modified=`echo ${db}${modified}${db}`

extension=${18}
if [ -z "$extension" ]; then
  extension="None"
fi
extension=`echo ${db}${extension}${db}`

sort=${19}
if [ -z "$sort" ]; then
  sort="None"
fi
sort=`echo ${db}${sort}${db}`

Threshold=${20}
if [ -z "$Threshold" ]; then
  Threshold="None"
fi
Threshold=`echo ${db}${Threshold}${db}`

whitelist=${21}
whitelist=`echo ${db}${whitelist}${db}`
echo $whitelist

lizard_args=${python /lib/lizard_argument_validator.py \
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
                    )
echo "::group::RunLizard"

lizard $lizard_args $path | tee $cli_output_file

echo "::group::Outputs"
echo ::set-output name=result_output_path::$cli_output_file