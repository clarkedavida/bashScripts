#!/bin/bash

# 
# env.bash                                                               
# 
# D. Clarke 
#
# Environment script for SIMULATeQCD compilation. 
#
# Tested cluster	Date of last known compilation
#
# NONE                  2024 Jun 04 
# bielefeld		2023 Aug 11 
# crusher		2023 Jan 10
# fermilab              2024 Oct 26 
# houston
# lumi-G		2023 Jan 10
# summit                2024 Mar
#

source "${bashToolsPath}/bashTools.bash"

#
# User settings
#
export BUILDFOLDER=buildSIMULATeQCD
export GITLFSFOLDER=${HOME}/git-lfs
export CONFSCRIPT=configureSIMULATeQCD.bash
export CLEANSCRIPT=cleanSIMULATeQCD.bash
export CLUSTER=fermilab
export GITTWOFACTOR=true

#
# These only need to be adjusted for CLUSTER=NONE, i.e.
# if you are running something locally
#
export DEFAULTMAKE=cuda 
export DEFAULTARCH=61


if [ ${CLUSTER} == NONE ]; then

  export GPUMAKE=${DEFAULTMAKE}
  export GPUARCH=${DEFAULTARCH}
  nvcc --version > /dev/null 2>&1
  _checkForFail $? 'You need to install CUDA'
  mpirun --version > /dev/null 2>&1
  _checkForFail $? 'You need to install OPENMPI'

elif [ ${CLUSTER} == 'crusher' ]; then

  module load PrgEnv-amd
  module load craype-accel-amd-gfx90a
  module load cray-mpich
  module load cmake
  module load rocm
  module unload cray-libsci
  export CXX=hipcc
  export GPUMAKE=hip
  export GPUARCH=gfx90a

elif [ ${CLUSTER} == 'summit' ]; then

  module load cmake
  module load cuda
  module load ums/default
  module load ums-stf010/default
  module load gcc/11.1.0-latest
  export GPUMAKE=cuda
  export GPUARCH=70

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

elif [ ${CLUSTER} == 'fermilab' ]; then

  module load cmake
  module load gcc 
  module load gompi ucx_cuda ucc_cuda
  export GPUMAKE=cuda
  export GPUARCH=80

else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi

