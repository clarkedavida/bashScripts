#!/bin/bash

# 
# env.bash                                                               
# 
# D. Clarke 
#
# Environment script for SIMULATeQCD compilation. 
# 

source "${bashToolsPath}/bashTools.bash"

export BUILDFOLDER=buildSIMULATeQCD
export GITLFSFOLDER=${HOME}/git-lfs

#
# Tested cluster	Date of last known compilation
#
# bielefeld		2023 Aug 11 
# crusher		2023 Jan 10
# lumi-G		2023 Jan 10
#
export CLUSTER=bielefeld

if [ ${CLUSTER} == 'crusher' ]; then

  module load PrgEnv-amd
  module load craype-accel-amd-gfx90a
  module load cray-mpich
  module load cmake
  module load rocm
  module unload cray-libsci
  export CXX=hipcc
  export GPUMAKE=hip
  export GPUARCH=gfx90a

elif [ ${CLUSTER} == 'bielefeld' ]; then

  export GPUMAKE=cuda
  export GPUARCH=70

elif [ ${CLUSTER} == 'lumig' ]; then

  export MPICH_GPU_SUPPORT_ENABLED=1
  module load CrayEnv
  module load buildtools/22.08
  module load craype-accel-amd-gfx90a
  module load cray-mpich
  module load rocm
  export CXX=hipcc
  export HIP_PATH=${ROCM_PATH}/hip
  export GPUMAKE=hip
  export GPUARCH=gfx90a

else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi

echo
echo "LOAD ENVIRONMENT ${CLUSTER}"
echo
