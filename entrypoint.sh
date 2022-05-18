#!/bin/sh
set -eax
result_cli="test"
result_cli=`lizard $2`
echo ::set-output name=result_cli::$result_cli