#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6050 ]]; then
  m=00394
  pre=1064
  betae=6.050
  me=0.00394
  pree=0.1064
elif [[ $beta -eq 6085 ]]; then
  m=00376
  pre=1015
  betae=6.085
  me=0.00376
  pree=0.1015
elif [[ $beta -eq 6110 ]]; then
  m=00364
  pre=0982
  betae=6.110
  me=0.00364
  pree=0.0982
elif [[ $beta -eq 6140 ]]; then
  m=00350
  pre=
  betae=6.140
  me=0.00350
  pree=
elif [[ $beta -eq 6160 ]]; then
  m=00341
  pre=0920
  betae=6.160
  me=0.00341
  pree=0.0920
elif [[ $beta -eq 6175 ]]; then
  m=00334
  pre=0902
  betae=6.175
  me=0.00334
  pree=0.0902
elif [[ $beta -eq 6190 ]]; then
  m=00328
  pre=0885
  betae=6.190
  me=0.00328
  pree=0.0885
elif [[ $beta -eq 6215 ]]; then
  m=00318
  pre=0858
  betae=6.215
  me=0.00318
  pree=0.0858
elif [[ $beta -eq 6245 ]]; then
  m=00307
  pre=
  betae=6.245
  me=0.00307
  pree=
elif [[ $beta -eq 6285 ]]; then
  m=00293
  pre=
  betae=6.285
  me=0.00293
  pree=
elif [[ $beta -eq 6315 ]]; then
  m=00281
  pre=07587
  betae=6.315
  me=0.00281
  pree=0.07587
elif [[ $beta -eq 6354 ]]; then
  m=00270
  pre=
  betae=6.354
  me=0.00270
  pree=
elif [[ $beta -eq 6390 ]]; then
  m=00257
  pre=
  betae=6.390
  me=0.00257
  pree=
elif [[ $beta -eq 6423 ]]; then
  m=00248
  pre=
  betae=6.423
  me=0.00248
  pree=
elif [[ $beta -eq 6445 ]]; then
  m=00241
  pre=
  betae=6.445
  me=0.00241
  pree=
elif [[ $beta -eq 6474 ]]; then
  m=00234
  pre=
  betae=6.474
  me=0.00234
  pree=
elif [[ $beta -eq 6500 ]]; then
  m=00228
  pre=
  betae=6.500
  me=0.00228
  pree=
else
  _bashFail "nt8ms27: Invalid beta."
fi
