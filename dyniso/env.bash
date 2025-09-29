#!/bin/bash

# 
# env.bash                                                               
# 
# D. Clarke 
#
# Environment script for dyniso compilation. 
#
# Tested cluster	Date of last known compilation
#
# bielefeld		2025 Sept 18 
#

source "${bashToolsPath}/bashTools.bash"

export MAKEFILE=/home/dclarke/dyniso/Makefile

export CLUSTER=bielefeld

if [ ${CLUSTER} == 'bielefeld' ]; then

  export GPUMAKE=cuda
  export GPUARCH=70
  export CUDAFOLD=/usr/local/cuda-12.8
  module load opt/mpfr-4.1.0

else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi

