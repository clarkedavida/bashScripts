#!/bin/bash

# 
# env.bash                                                               
# 
# D. Clarke 
#
# Environment script for DenseCode compilation. 
#
# Tested cluster	Date of last known compilation
#
# fermilab		2025 Oct 10 
#

source "${bashToolsPath}/bashTools.bash"

export CLUSTER=fermilab

if [ ${CLUSTER} == 'fermilab' ]; then

#  module load cmake (v3.26 already seems loaded) 
#  module unload gcc
#  module load gcc/11.4.0
#  module load ucc/1.2.0
#  module load ucx/1.14.1 
#  module load ucx_cuda/1.14.1_cuda_12.2.1
#  module load ucc_cuda/1.2.0_cuda_12.2.1

  # IF THIS DOESN'T WORK:
  # try CUDA 11
  # try CUDA 11 with tschebysheff filter branch
  module unload gcc
  module load gcc/11.4.0
  module load cuda/12.2.1
  export GPUMAKE=cuda
  export GPUARCH=80

else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi
