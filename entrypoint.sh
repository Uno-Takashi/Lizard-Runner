#!/bin/bash
set -eax

base_dir=`pwd`
echo $base_dir
echo $3
echo $4

cd $1

result_cli="test"
result_cli=`lizard $2 | tee lizard.txt`
result_cli="${result_cli//$'\n'/\\n}"

echo "::group::Outputs"
echo ::set-output name=result_cli::$result_cli