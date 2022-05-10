#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6050 ]]; then
  m=001330
  pre=035910
  betae=6.050
  me=0.001330
  pree=0.035910
elif [[ $beta -eq 6085 ]]; then
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
elif [[ $beta -eq 6160 ]]; then
  m=001150
  pre=031043
  betae=6.160
  me=0.001150
  pree=0.031043
elif [[ $beta -eq 6175 ]]; then
  m=001128
  pre=030454
  betae=6.175
  me=0.001128
  pree=0.030454
elif [[ $beta -eq 6215 ]]; then
  m=001072
  pre=028956
  betae=6.215
  me=0.001072
  pree=0.028956
elif [[ $beta -eq 6245 ]]; then
  m=001033
  pre=
  betae=6.245
  me=0.001033
  pree=
elif [[ $beta -eq 6285 ]]; then
  m=000984
  pre=
  betae=6.285
  me=0.000984
  pree=
elif [[ $beta -eq 6315 ]]; then
  m=000949
  pre=
  betae=6.315
  me=0.000949
  pree=
else
  _bashFail "nt8ms80: Invalid beta."
fi
