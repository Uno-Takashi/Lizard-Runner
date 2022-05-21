#!/bin/bash
set -eax

echo "::group::ChangeDirectory"



echo "::group::ValidateArguments"
path=$1
cli_output_file=$2
cli_output_file='"$cli_output_file"'


language=$3
language='"$language"'

verbose=$4
verbose='"$verbose"'

CCN=$5
CCN='"$CCN"'

input_file=$6
if [ -z "$input_file" ]; then
  input_file="None"
fi
input_file='"$input_file"'

output_file=$7
if [ -z "$output_file" ]; then
  output_file="None"
fi
output_file='"$output_file"'

length=$8
length='"$length"'

arguments=$9
if [ -z "$arguments" ]; then
  arguments="None"
fi
arguments='"$arguments"'

warnings_only=${10}
warnings_only='"$warnings_only"'

warning_msvs=${11}
warning_msvs='"$warning_msvs"'

ignore_warnings=${12}
if [ -z "$ignore_warnings" ]; then
  ignore_warnings="None"
fi
ignore_warnings='"$ignore_warnings"'

exclude=${13}
if [ -z "$exclude" ]; then
  exclude="None"
fi
exclude='"$exclude"'

working_threads=${14}
working_threads='"$working_threads"'

xml=${15}
xml='"$xml"'

html=${16}
html='"$html"'

modified=${17}
modified='"$modified"'
extension=${18}
if [ -z "$extension" ]; then
  extension="None"
fi
extension='"$extension"'

sort=${19}
if [ -z "$sort" ]; then
  sort="None"
fi
sort='"$sort"'

Threshold=${20}
if [ -z "$Threshold" ]; then
  Threshold="None"
fi
Threshold='"$Threshold"'

whitelist=${21}
whitelist='"$whitelist"'

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

lizard $lizard_args $path | tee $cli_output_file

echo "::group::Outputs"
echo ::set-output name=result_output_path::$cli_output_file