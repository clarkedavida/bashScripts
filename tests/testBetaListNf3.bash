#!/bin/bash

# 
# testBetaList.bash
# 
# D. Clarke 
# 


beta=6085
source ${bashToolsPath}"/betaListsNf3/nt8ms60.bash"


testFile="tmp"
controlFile="betaListTest/b6085.txt"


echo "cm: $m
cpre: $pre
beta: $betae
m: $me
pre: "$pree > ${testFile} 


_compareFiles ${testFile} ${controlFile}
_checkPassFail $? "Nf=3 Beta list test."
rm ${testFile}
