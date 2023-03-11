#!/bin/bash

# 
# testTarballer.bash
# 
# D. Clarke 
# 
# Try the tarBaller in the tarBaller subfolder. 
# 

source ${bashToolsPath}"/bashTools.bash"

rm -rf tarBaller
cp -r tarBallerTestFolder tarBaller

TESTFOLDER="tarBaller"

_createCompressedSubfolders $TESTFOLDER
