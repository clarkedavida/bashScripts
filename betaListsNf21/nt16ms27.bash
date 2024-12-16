#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6973 ]]; then
  ml=00139
  ms=0376
  betae=6.973
  mle=0.00139
  mse=0.0376
elif [[ $beta -eq 7010 ]]; then
  ml=00132
  ms=0357
  betae=7.010
  mle=0.00132
  mse=0.0357
elif [[ $beta -eq 7054 ]]; then
  ml=00129
  ms=0348
  betae=7.054
  mle=0.00129
  mse=0.0348
elif [[ $beta -eq 7095 ]]; then
  ml=00124
  ms=0334
  betae=7.095
  mle=0.00124
  mse=0.0334
elif [[ $beta -eq 7130 ]]; then
  ml=00119
  ms=0322
  betae=7.130
  mle=0.00119
  mse=0.0322
else
  _bashFail "nt16ms27: Invalid beta."
fi
