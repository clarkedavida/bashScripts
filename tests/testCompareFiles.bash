#!/bin/bash

# 
# testWhitespace.bash
# 
# D. Clarke 
# 


source ${bashToolsPath}"/bashTools.bash"


folder="compareFilesTest"
file1=${folder}/file1.txt
file2=${folder}/file2.txt
file3=${folder}/file3.txt


lpass=0


_compareFiles $file1 $file2
result=$?
lpass=$((result + lpass))


_compareFiles $file2 $file3
_bitFlip $?
result=$?
lpass=$((result + lpass))


_checkPassFail ${lpass} "Compare files test."

