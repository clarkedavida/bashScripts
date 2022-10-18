#!/bin/bash

# 
# env.bash                                                               
# 
# C. DeTar, D. Clarke 
# 
# Environment script for MILC and QUDA compilation. 
# 

source "${bashToolsPath}/bashTools.bash"

#
# Set cluster name here. Possibilities include:
#   crusher
#
CLUSTER='crusher'

if [ ${CLUSTER} == 'crusher' ]; then

  module swap PrgEnv-cray PrgEnv-amd
  module load craype-accel-amd-gfx90a
  module load cray-mpich/8.1.16
  module load cmake
  module load rocm/5.1.0
  module unload cray-libsci
  
  # Needed for GDR (this is the NVLINK stuff, if were using CUDA backend)
  export MPICH_ROOT=/opt/cray/pe/mpich/8.1.16
  export GTL_ROOT=/opt/cray/pe/mpich/8.1.16/gtl/lib
  export MPICH_DIR=${MPICH_ROOT}/ofi/rocm-compiler/5.0
  
  export TOPDIR_HIP=~/crusher/quda
  export TARGET_GPU=gfx90a
  
  echo $INSTALLROOT
  
  MPI_CFLAGS="-I${MPICH_DIR}/include -g"
  MPI_LDFLAGS="-g -Wl,-rpath=${MPICH_DIR}/lib -L${MPICH_DIR}/lib -lmpi -L${GTL_ROOT} -Wl,-rpath=${GTL_ROOT} -lmpi_gtl_hsa"
  
  export PK_BUILD_TYPE="Release"
  export PATH=${ROCM_PATH}/bin:${ROCM_PATH}/llvm/bin:${PATH}
  export LD_LIBRARY_PATH=${INSTALLROOT}/quda/lib:${INSTALLROOT}/qmp/lib:${INSTALLROOT}/qio/lib:${ROCM_PATH}/llvm/lib64:${ROCM_PATH}/llvm/lib:${MPICH_DIR}/lib:${GTL_ROOT}:${LD_LIBRARY_PATH}

else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi


#
# Independent of the cluster.
#
export SRCROOT=${TOPDIR_HIP}
export BUILDROOT=${TOPDIR_HIP}
export INSTALLROOT=${TOPDIR_HIP}/install
module list
