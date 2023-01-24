#! /bin/bash

# 
# build_milc_quda.bash                                                               
# 
# C. DeTar, D. Clarke.
#
# Sets up MILC so that you can compile executables. We will always put MILC in our $HOME folder. 
# 

source "${bashToolsPath}/MILC/env.bash"


BRANCH_NAME=develop


if [ ! -d milc_qcd ]; then
  echo "Cloning MILC git..."
  git clone --branch ${BRANCH_NAME} https://github.com/milc-qcd/milc_qcd/
else
  cd milc_qcd
  echo "Updating MILC git..."
  git pull
  git checkout ${BRANCH_NAME}
  cd ..
fi


_checkForFail $? "Clone or update MILC git"


_bashInfo  "Preparing ${INSTALLROOT} for MILC"
mkdir -p ${INSTALLROOT}/qio/lib
mkdir -p ${INSTALLROOT}/qio/include
mkdir -p ${INSTALLROOT}/qmp/lib
mkdir -p ${INSTALLROOT}/qmp/include
cp -r  ${QUDA_BUILD}/_deps/qio-build/lib/* ${INSTALLROOT}/qio/lib/.
cp -r  ${QUDA_BUILD}/_deps/qio-build/include/* ${INSTALLROOT}/qio/include/.
cp -r  ${QUDA_BUILD}/_deps/qio-src/include/* ${INSTALLROOT}/qio/include/.
cp -r  ${QUDA_BUILD}/_deps/qmp-build/lib/* ${INSTALLROOT}/qmp/lib/.
cp -r  ${QUDA_BUILD}/_deps/qmp-src/include/* ${INSTALLROOT}/qmp/include/.


# BRANCH        DATE OF LAST COMPILATION 
# develop       24 Jan 2023
if [ ${CLUSTER} == 'crusher' ]; then

  export CLUSTER_CC=hipcc
  export CLUSTER_CXX=hipcc
  export CLUSTER_OFFLOAD=HIP
  export CLUSTER_GPU_ARCH=""
  export CLUSTER_COMPILER="gnu"
  export CLUSTER_LDFLAGS=""
  export CLUSTER_LIBQUDA="-Wl,-rpath ${QUDA_INSTALL}/lib -L${QUDA_INSTALL}/lib -lquda -D__gfx90a --amdgpu-target=gfx90a -Wl,-rpath=${ROCM_PATH}/hiprand/lib -L${ROCM_PATH}/hiprand/lib -Wl,-rpath=${ROCM_PATH}/rocfft/lib -L${ROCM_PATH}/rocfft/lib -lhiprand -lrocfft -Wl,-rpath=${ROCM_PATH}/hipblas/lib -L${ROCM_PATH}/hipblas/lib -lhipblas -Wl,-rpath=${ROCM_PATH}/rocblas/lib -L${ROCM_PATH}/rocblas/lib -lrocblas -Wl,-rpath=${ROCM_PATH}/hip/lib"


# BRANCH        DATE OF LAST COMPILATION
# develop
elif [ ${CLUSTER} == 'jlse' ]; then

  export CLUSTER_CC=hipcc
  export CLUSTER_CXX=hipcc
  export CLUSTER_OFFLOAD=HIP
  export CLUSTER_GPU_ARCH="intel"
  export CLUSTER_COMPILER="gnu"
  export CLUSTER_LDFLAGS=""
  export CLUSTER_LIBQUDA="-Wl,-rpath ${QUDA_INSTALL}/lib -L${QUDA_INSTALL}/lib -lquda -D__gfx90a --amdgpu-target=gfx90a -Wl,-rpath=${ROCM_PATH}/hiprand/lib -L${ROCM_PATH}/hiprand/lib -Wl,-rpath=${ROCM_PATH}/rocfft/lib -L${ROCM_PATH}/rocfft/lib -lhiprand -lrocfft -Wl,-rpath=${ROCM_PATH}/hipblas/lib -L${ROCM_PATH}/hipblas/lib -lhipblas -Wl,-rpath=${ROCM_PATH}/rocblas/lib -L${ROCM_PATH}/rocblas/lib -lrocblas -Wl,-rpath=${ROCM_PATH}/hip/lib"


# BRANCH        DATE OF LAST COMPILATION
# develop       24 Jan 2023
elif [ ${CLUSTER} == 'sunspot' ]; then

  export CLUSTER_CC=mpicc
  export CLUSTER_CXX=mpicxx
  export CLUSTER_OFFLOAD=SYCL
  export CLUSTER_GPU_ARCH=""
  export CLUSTER_COMPILER="intel"

  export mkl="-lmkl_sycl -lmkl_intel_ilp64 -lmkl_core -lmkl_tbb_thread"
  export CLUSTER_LDFLAGS="-fsycl -fopenmp -fsycl-device-code-split=per_kernel ${mkl}"
  export CLUSTER_LIBQUDA="-Wl,-rpath ${QUDA_INSTALL}/lib -L${QUDA_INSTALL}/lib -lquda"


fi


EXECUTABLE=ks_spectrum_hisq
_bashInfo "Making ${EXECUTABLE}"
cd milc_qcd/ks_spectrum
cp ../Makefile .
make clean
bash -x "${bashToolsPath}/MILC/make_${EXECUTABLE}.bash" 2> ${EXECUTABLE}.err
python3 "${bashToolsPath}/MILC/getOptAndErr.py" ${EXECUTABLE}
cd ..


EXECUTABLE=su3_rhmd_hisq
_bashInfo "Making ${EXECUTABLE}"
cd ks_imp_rhmc
cp ../Makefile .
make clean
bash -x "${bashToolsPath}/MILC/make_${EXECUTABLE}.bash" 2> ${EXECUTABLE}.err
python3 "${bashToolsPath}/MILC/getOptAndErr.py" ${EXECUTABLE}
