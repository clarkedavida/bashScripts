#!/bin/bash
source "${bashToolsPath}/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6285 ]]; then
  ml=0009875
  ms=0790
  betae=6.285
  mle=9.875000e-04
  mse=7.900000e-02
elif [[ $beta -eq 6300 ]]; then
  ml=0009650
  ms=0772
  betae=6.300
  mle=9.650000e-04
  mse=7.720000e-02
elif [[ $beta -eq 6315 ]]; then
  ml=0009500
  ms=0760
  betae=6.315
  mle=9.500000e-04
  mse=7.600000e-02
elif [[ $beta -eq 6330 ]]; then
  ml=0009325
  ms=0746
  betae=6.330
  mle=9.325000e-04
  mse=7.460000e-02
elif [[ $beta -eq 6354 ]]; then
  ml=0009100
  ms=0728
  betae=6.354
  mle=9.100000e-04
  mse=7.280000e-02
elif [[ $beta -eq 6372 ]]; then
  ml=0008891
  ms=0711
  betae=6.372
  mle=8.891000e-04
  mse=7.110000e-02
elif [[ $beta -eq 6390 ]]; then
  ml=0008675
  ms=0694
  betae=6.390
  mle=8.675000e-04
  mse=6.940000e-02
elif [[ $beta -eq 6423 ]]; then
  ml=0008375
  ms=0670
  betae=6.423
  mle=8.375000e-04
  mse=6.700000e-02
elif [[ $beta -eq 6445 ]]; then
  ml=0008150
  ms=0652
  betae=6.445
  mle=8.150000e-04
  mse=6.520000e-02
else
  _bashFail "nt8ms80: Invalid beta."
fi
