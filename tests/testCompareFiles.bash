#!/bin/bash

# 
# testCompareFiles.bash
# 
# D. Clarke 
# 

source ${bashToolsPath}"/bashTools.bash"

folder="compareFilesTest"
file1=${folder}/file1.txt
file2=${folder}/file2.txt
file3=${folder}/file3.txt

_compareFiles $file1 $file2
echo $?
_compareFiles $file2 $file3
echo $?
