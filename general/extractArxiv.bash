#!/bin/bash

source "${bashToolsPath}/bashTools.bash"

_checkIfParamEmpty "arxiv" $1

if [ ! -f $1 ]; then _bashFail "$1 is not a regular file"; fi

mv $1 temp
mkdir -p $1
mv temp ${1}/.
cd $1
tar -xf temp
_checkForFail $? "extraction"
rm temp
cd ..

echo "Extracted $1"
