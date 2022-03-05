#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"

if [ $beta -eq 6794 ]; then
  ml=00167
  ms=0450
  betae=6.794
  mle=1.670000e-03
  mse=4.500000e-02
elif [ $beta -eq 6850 ]; then
  ml=00157
  ms=0424
  betae=6.850
  mle=1.570000e-03
  mse=4.240000e-02
elif [ $beta -eq 6910 ]; then
  ml=00148
  ms=0401
  betae=6.910
  mle=1.480000e-03
  mse=4.010000e-02
else
  _bashFail "nt12ms27: Invalid beta."
fi
