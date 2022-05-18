#!/bin/sh
set -eax
result_cli="test"
result_cli=`lizard $2`
result_cli="${result_cli//$'\n'/\\n}"

echo "::group::Outputs"
echo ::set-output name=result_cli::$result_cli