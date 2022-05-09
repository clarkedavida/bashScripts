#!/bin/bash

# 
# testBetaList.bash
# 
# D. Clarke 
# 


beta=6285
source ${bashToolsPath}"/betaListsNf21/nt8ms80.bash"


testFile="tmp"
controlFile="betaListTest/b6285.txt"


echo "cml: $ml
cms: $ms
beta: $betae
ml: $mle
ms: "$mse > ${testFile} 


_compareFiles ${testFile} ${controlFile}
_checkPassFail $? "Nf=2+1 Beta list test."
rm ${testFile}
