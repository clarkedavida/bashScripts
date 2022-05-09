#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6085 ]]; then
  m=001692
  pre=045684
  betae=6.085
  me=0.001692
  pree=0.045684
else
  _bashFail "nt8ms60: Invalid beta."
fi
