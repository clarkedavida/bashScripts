#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"


if [[ $beta -eq 6050 ]]; then
  m=001773
  pre=047880
  betae=6.050
  me=0.001773
  pree=0.047880
elif [[ $beta -eq 6085 ]]; then
  m=001692
  pre=045684
  betae=6.085
  me=0.001692
  pree=0.045684
elif [[ $beta -eq 6110 ]]; then
  m=001636
  pre=
  betae=6.110
  me=0.001636
  pree=
elif [[ $beta -eq 6140 ]]; then
  m=0015730
  pre=042480
  betae=6.140
  me=0.0015730
  pree=0.042480
elif [[ $beta -eq 6175 ]]; then
  m=0015040
  pre=
  betae=6.175
  me=0.0015040
  pree=
elif [[ $beta -eq 6215 ]]; then
  m=0014290
  pre=
  betae=6.215
  me=0.0014290
  pree=
elif [[ $beta -eq 6245 ]]; then
  m=001377
  pre=
  betae=6.245
  me=0.001377
  pree=
else
  _bashFail "nt8ms60: Invalid beta."
fi
