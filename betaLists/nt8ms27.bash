#!/bin/bash
source ${bashToolsPath}"/bashTools.bash"
source "${bashToolsPath}/HotQCDTools.bash"

if [[ $beta -eq 6245 ]]; then
  ml=00307
  ms=0830
  betae=6.245
  mle=3.070000e-03
  mse=8.300000e-02
elif [[ $beta -eq 6285 ]]; then
  ml=00293
  ms=0790
  betae=6.285
  mle=2.930000e-03
  mse=7.900000e-02
elif [[ $beta -eq 6315 ]]; then
  ml=00281
  ms=0759
  betae=6.315
  mle=2.810000e-03
  mse=7.590000e-02
elif [[ $beta -eq 6354 ]]; then
  ml=00270
  ms=0728
  betae=6.354
  mle=2.700000e-03
  mse=7.280000e-02
elif [[ $beta -eq 6390 ]]; then
  ml=00257
  ms=0694
  betae=6.390
  mle=2.570000e-03
  mse=6.940000e-02
elif [[ $beta -eq 6423 ]]; then
  ml=00248
  ms=0670
  betae=6.423
  mle=2.480000e-03
  mse=6.700000e-02
elif [[ $beta -eq 6445 ]]; then
  ml=00241
  ms=0652
  betae=6.445
  mle=2.410000e-03
  mse=6.520000e-02
elif [[ $beta -eq 6474 ]]; then
  ml=00234
  ms=0632
  betae=6.474
  mle=2.340000e-03
  mse=6.320000e-02
elif [[ $beta -eq 6500 ]]; then
  ml=00228
  ms=0614
  betae=6.500
  mle=2.280000e-03
  mse=6.140000e-02
else
  _bashFail "nt8ms27: Invalid beta."
fi
