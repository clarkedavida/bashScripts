#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6050 ]]; then
  m=00266
  pre=
  betae=6.050
  me=0.00266
  pree=
elif [[ $beta -eq 6085 ]]; then
  m=0025375
  pre=
  betae=6.085
  me=0.0025375
  pree=
elif [[ $beta -eq 6110 ]]; then
  m=002455
  pre=06629
  betae=6.110
  me=0.06629
  pree=
elif [[ $beta -eq 6140 ]]; then
  m=00236
  pre=
  betae=6.140
  me=0.00236
  pree=
elif [[ $beta -eq 6160 ]]; then
  m=0023
  pre=
  betae=6.160
  me=0.0023
  pree=
elif [[ $beta -eq 6175 ]]; then
  m=002255
  pre=0609
  betae=6.175
  me=0.002255
  pree=0.0609
elif [[ $beta -eq 6190 ]]; then
  m=002213
  pre=0597
  betae=6.190
  me=0.002213
  pree=0.0597
elif [[ $beta -eq 6215 ]]; then
  m=002145
  pre=0579
  betae=6.215
  me=0.002145
  pree=0.0579
elif [[ $beta -eq 6245 ]]; then
  m=00207
  pre=
  betae=6.245
  me=0.00207
  pree=
elif [[ $beta -eq 6285 ]]; then
  m=001978
  pre=
  betae=6.285
  me=0.001978
  pree=
elif [[ $beta -eq 6315 ]]; then
  m=001895
  pre=
  betae=6.315
  me=0.001895
  pree=
elif [[ $beta -eq 6354 ]]; then
  m=001823
  pre=
  betae=6.354
  me=0.001823
  pree=
elif [[ $beta -eq 6390 ]]; then
  m=001733
  pre=
  betae=6.390
  me=0.001733
  pree=
elif [[ $beta -eq 6423 ]]; then
  m=001672
  pre=
  betae=6.423
  me=0.001672
  pree=
elif [[ $beta -eq 6445 ]]; then
  m=001625
  pre=
  betae=6.445
  me=0.001625
  pree=
elif [[ $beta -eq 6474 ]]; then
  m=001578
  pre=
  betae=6.474
  me=0.001578
  pree=
elif [[ $beta -eq 6500 ]]; then
  m=001538
  pre=
  betae=6.500
  me=0.001538
  pree=
else
  _bashFail "nt8ms40: Invalid beta."
fi
