#!/bin/bash

# 
# myconf.bash                                                               
# 
# D. Clarke 
# 
# Set up SIMULATeQCD build according to env.bash. 
# 

source "${bashToolsPath}/SIMULATeQCD/env.bash"

if [ ${GPUMAKE}=='cuda' ]; then

  cmake3 ../SIMULATeQCD/ \
-DARCHITECTURE="${GPUARCH}" \
-DUSE_GPU_AWARE_MPI=ON \
-DUSE_GPU_P2P=ON

elif [ ${GPUMAKE}=='amd' ]; then

  cmake ../SIMULATeQCD/ \
-DARCHITECTURE="${GPUARCH}" \
-DUSE_GPU_AWARE_MPI=ON \
-DUSE_GPU_P2P=OFF \
-DBACKEND="hip_nvidia"

else

  _bashFail "Invalid GPUMAKE ${GPUMAKE}"

fi
