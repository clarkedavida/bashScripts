#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6085 ]]; then
  m=001269
  pre=034250
  betae=6.085
  me=0.001269
  pree=0.034250
elif [[ $beta -eq 6110 ]]; then
  m=001227
  pre=033131
  betae=6.110
  me=0.001227
  pree=0.033131
elif [[ $beta -eq 6140 ]]; then
  m=001180
  pre=031855
  betae=6.140
  me=0.001180
  pree=0.031855
else
  _bashFail "nt8ms80: Invalid beta."
fi
