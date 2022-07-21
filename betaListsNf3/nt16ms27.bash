#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6050 ]]; then
  m=00394
  pre=1064
  betae=6.050
  me=0.00394
  pree=0.1064
elif [[ $beta -eq 6315 ]]; then
  m=00281
  pre=07587
  betae=6.315
  me=0.00281
  pree=0.07587
else
  _bashFail "nt16ms27: Invalid beta."
fi
