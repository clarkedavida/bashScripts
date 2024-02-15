#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6245 ]]; then
  ml=00297
  ms=0802
  betae=6.245
  mle=0.00297
  mse=0.0802
else
  _bashFail "nt10ms27: Invalid beta."
fi
