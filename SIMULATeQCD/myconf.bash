#!/bin/bash

# 
# myconf.bash                                                               
# 
# D. Clarke 
# 
# Set up SIMULATeQCD build according to env.bash. 
# 

source "${bashToolsPath}/SIMULATeQCD/env.bash"


if [ ${GPUMAKE} == 'cuda' ]; then

  echo 'Building using CUDA'
  cmake ../SIMULATeQCD/ \
-DARCHITECTURE="${GPUARCH}" \
-DUSE_GPU_AWARE_MPI=ON \
-DUSE_GPU_P2P=ON

# Double check whether DUSE_CUDA and DUSE_HIP_AMD needed
elif [ ${GPUMAKE} == 'hip' ]; then

  echo 'Building using HIP'
  cmake ../SIMULATeQCD/ \
-DARCHITECTURE="${GPUARCH}" \
-DUSE_GPU_AWARE_MPI=ON \
-DUSE_GPU_P2P=OFF \
-DUSE_CUDA=OFF \
-DUSE_HIP_AMD=ON \
-DBACKEND="hip_amd" \

else
  _bashFail "Invalid GPUMAKE ${GPUMAKE}"
fi
