#!/bin/bash

# 
# env.bash                                                               
# 
# C. DeTar, D. Clarke 
# 
# Environment script for MILC and QUDA compilation. At the moment this
# seems to be targeted for AMD... 
# 

source "${bashToolsPath}/bashTools.bash"

#
# User settings 
#
export BUILDFOLDERMILC=buildMILC
export CLUSTER=NONE


_bashInfo "Loading modules for cluster ${CLUSTER}"


if [ ${CLUSTER} == NONE ]; then

  _bashFail "Still a work in progress"

elif [ ${CLUSTER} == 'crusher' ]; then

  module swap PrgEnv-cray PrgEnv-amd
  module load craype-accel-amd-gfx90a
  module load cray-mpich/8.1.16
  module load cmake
  module load rocm/5.1.0
  module unload cray-libsci
  export TARGET_GPU=gfx90a
  
  # Needed for GDR (this is the NVLINK stuff, if using CUDA backend)
  export MPICH_ROOT=/opt/cray/pe/mpich/8.1.16
  export GTL_ROOT=/opt/cray/pe/mpich/8.1.16/gtl/lib
  export MPICH_DIR=${MPICH_ROOT}/ofi/rocm-compiler/5.0
  

elif [ ${CLUSTER} == 'jlse' ]; then


  module use /soft/modulefiles
# module swap PrgEnv-cray PrgEnv-amd
#  module load craype-accel-amd-gfx90a
  module load mpi/aurora_mpich 
  module load cmake
  module load rocm
  module load gcc 


elif [ ${CLUSTER} == 'sunspot' ]; then

  module swap oneapi
  module load spack
  module load cmake


else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi


module list


#
# Some common environment variables for QUDA and MILC. MILC needs to know where to
# find QUDA, where it was installed, and so on. INSTALL is a folder that organizes all
# "install" folders, which the USQCD people and QUDA seem to like. 
#
export QUDA_SRC=${HOME}/quda
export QUDA_BUILD=${HOME}/build_quda
export INSTALLROOT=${HOME}/install
export QUDA_INSTALL=${INSTALLROOT}/quda
export PATH=${ROCM_PATH}/bin:${ROCM_PATH}/llvm/bin:${PATH}
export LD_LIBRARY_PATH=${INSTALLROOT}/quda/lib:${INSTALLROOT}/qmp/lib:${INSTALLROOT}/qio/lib:${ROCM_PATH}/llvm/lib64:${ROCM_PATH}/llvm/lib:${MPICH_DIR}/lib:${GTL_ROOT}:${LD_LIBRARY_PATH}


MPI_LDFLAGS="-g -Wl,-rpath=${MPICH_DIR}/lib -L${MPICH_DIR}/lib -lmpi -L${GTL_ROOT} -Wl,-rpath=${GTL_ROOT} -lmpi_gtl_hsa"
MPI_CFLAGS="-I${MPICH_DIR}/include -g"
export PK_BUILD_TYPE="Release"


_bashInfo "LOADED MILC/QUDA ENVIRONMENT ${CLUSTER}"


