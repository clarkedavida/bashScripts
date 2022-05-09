#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6260 ]]; then
  ml=002025
  ms=0810
  betae=6.260
  mle=2.025000e-03
  mse=8.100000e-02
elif [[ $beta -eq 6285 ]]; then
  ml=001975
  ms=0790
  betae=6.285
  mle=1.975000e-03
  mse=7.900000e-02
elif [[ $beta -eq 6300 ]]; then
  ml=001930
  ms=0772
  betae=6.300
  mle=1.930000e-03
  mse=7.720000e-02
elif [[ $beta -eq 6315 ]]; then
  ml=001900
  ms=0760
  betae=6.315
  mle=1.900000e-03
  mse=7.600000e-02
elif [[ $beta -eq 6330 ]]; then
  ml=001865
  ms=0746
  betae=6.330
  mle=1.865000e-03
  mse=7.460000e-02
elif [[ $beta -eq 6354 ]]; then
  ml=001820
  ms=0728
  betae=6.354
  mle=1.820000e-03
  mse=7.280000e-02
elif [[ $beta -eq 6365 ]]; then
  ml=001790
  ms=0716
  betae=6.365
  mle=1.790000e-03
  mse=7.160000e-02
elif [[ $beta -eq 6390 ]]; then
  ml=001735
  ms=0694
  betae=6.390
  mle=1.735000e-03
  mse=6.940000e-02
elif [[ $beta -eq 6423 ]]; then
  ml=001675
  ms=0670
  betae=6.423
  mle=1.675000e-03
  mse=6.700000e-02
elif [[ $beta -eq 6445 ]]; then
  ml=001630
  ms=0652
  betae=6.445
  mle=1.630000e-03
  mse=6.520000e-02
elif [[ $beta -eq 6474 ]]; then
  ml=00158
  ms=0632
  betae=6.474
  mle=1.580000e-03
  mse=6.320000e-02
elif [[ $beta -eq 6500 ]]; then
  ml=001535
  ms=0614
  betae=6.500
  mle=1.535000e-03
  mse=6.140000e-02
else
  _bashFail "nt8ms40: Invalid beta."
fi
