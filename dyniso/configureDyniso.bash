#!/bin/bash

# 
# myconf.bash                                                               
# 
# D. Clarke 
# 
# Set up SIMULATeQCD build according to env.bash. 
# 

source "${bashToolsPath}/SIMULATeQCD/env.bash"

MAKEAPPEND=/home/dclarke/scripts_bash/dyniso/appendToMake

if [[ "${GPUMAKE}" == cuda ]]; then
  USECUDA=1
else
  USECUDA=0
fi

echo"DEBUG=0
GAUGE_ACTION=symanzik_tree_action.h
ARCH=x86_64
CUDA=${USECUDA}
OPENCL=0
OPENCL_PROFILING=0
USE_GPU_OPTIMIZATIONS=1
CL_PROG_PATH=\${CURDIR}
OPENCL_KNL_BIN=0
BC=0
MCG_OPT=1
CUDALIB=${CUDAFOLD}
CUDAARCH= -arch sm_${GPUARCH}" > ${MAKEFILE}

${MAKEAPPEND} >> ${MAKEFILE}

