#!/bin/sh
set -eax
result_cli="test"
lizard $2
echo ::set-output name=time::$result_cli