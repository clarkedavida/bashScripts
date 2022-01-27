#!/bin/bash
source "/home/dclarke/scripts_bash/bashTools.bash"

if [ $beta -eq 6285 ]; then
  ml=00049375
  ms=0790
  betae=6.285
  mle=4.937500e-04
  mse=7.900000e-02
elif [ $beta -eq 6300 ]; then
  ml=00048250
  ms=0772
  betae=6.300
  mle=4.825000e-04
  mse=7.720000e-02
elif [ $beta -eq 6315 ]; then
  ml=00047500
  ms=0760
  betae=6.315
  mle=4.750000e-04
  mse=7.600000e-02
elif [ $beta -eq 6330 ]; then
  ml=00046625
  ms=0746
  betae=6.330
  mle=4.662500e-04
  mse=7.460000e-02
elif [ $beta -eq 6354 ]; then
  ml=00045500
  ms=0728
  betae=6.354
  mle=4.550000e-04
  mse=7.280000e-02
elif [ $beta -eq 6372 ]; then
  ml=00044456
  ms=0711
  betae=6.372
  mle=4.445600e-04
  mse=7.110000e-02
elif [ $beta -eq 6390 ]; then
  ml=00043375
  ms=0694
  betae=6.390
  mle=4.337500e-04
  mse=6.940000e-02
elif [ $beta -eq 6423 ]; then
  ml=00041875
  ms=0670
  betae=6.423
  mle=4.187500e-04
  mse=6.700000e-02
elif [ $beta -eq 6445 ]; then
  ml=00040750
  ms=0652
  betae=6.445
  mle=4.075000e-04
  mse=6.520000e-02
else
  _bashFail "nt8ms160: Invalid beta."
fi
