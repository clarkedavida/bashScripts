#! /bin/bash

# 
# build_quda.bash                                                               
# 
# C. DeTar, D. Clarke 
# 
# A setup script that gets QUDA running and prepares it for MILC compilation
# on various clusters. 
# 

source "${bashToolsPath}/MILC/env.bash"

QUDA_HOME=$(pwd)
#BRANCH_NAME=develop
BRANCH_NAME=feature/staggered_correlators_gk

if [ -d quda ]; then
  cd quda
  git pull
  git checkout ${BRANCH_NAME}
else
  git clone --branch ${BRANCH_NAME} https://github.com/lattice/quda
  cd quda
  git checkout ${BRANCH_NAME}
fi

mkdir -p build
cd build



# BRANCH	DATE OF LAST COMPILATION 
# develop
# staggered_gk  19 Oct 2022
if [ ${CLUSTER} == 'crusher' ]; then

  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_CXX_COMPILER=CC \
    -DCMAKE_CXX_FLAGS="--offload-arch=gfx90a" \
    -DCMAKE_C_COMPILER=cc \
    -DCMAKE_C_FLAGS="--offload-arch=gfx90a" \
    -DCMAKE_C_STANDARD=99 \
    -DCMAKE_EXE_LINKER_FLAGS="--offload-arch=gfx90a" \
    -DCMAKE_HIP_FLAGS="--offload-arch=gfx90a" \
    -DCMAKE_INSTALL_PREFIX=${QUDA_HOME}/install \
    -DQUDA_BUILD_SHAREDLIB=ON \
    -DQUDA_DIRAC_DEFAULT_OFF=ON \
    -DQUDA_DIRAC_STAGGERED=ON \
    -DQUDA_DOWNLOAD_USQCD=ON \
    -DQUDA_GPU_ARCH=gfx90a \
    -DQUDA_QIO=ON \
    -DQUDA_QMP=ON \
    -DQUDA_TARGET_TYPE=HIP \
    -DROCM_PATH=${ROCM_PATH} \
    ${QUDA_HOME}/quda


# BRANCH	DATE OF LAST COMPILATION
# develop
# staggered_gk
elif [ ${CLUSTER} == 'jlse' ]; then

  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=${QUDA_HOME}/install \
    -DQUDA_BUILD_SHAREDLIB=ON \
    -DQUDA_DIRAC_DEFAULT_OFF=ON \
    -DQUDA_DIRAC_STAGGERED=ON \
    -DQUDA_DOWNLOAD_USQCD=ON \
    -DQUDA_QIO=ON \
    -DQUDA_QMP=ON \
    -DQUDA_TARGET_TYPE=SYCL \
    ${QUDA_HOME}/quda


else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi



# For now this just flashes a message, but one could use this in the future
# to move things around in case only a partial install completes.
make -j16 install
if [ ! $? -eq 0 ]; then
  _bashError "QUDA install did not complete..."
  mkdir -p ${INSTALLROOT}
else
  echo "QUDA successfully installed."
  mv ${QUDA_HOME}/install ${QUDA_HOME}/quda/.
fi 


echo
echo "Prepping quda/install folder for MILC..."
mkdir -p ${INSTALLROOT}/quda
mkdir -p ${INSTALLROOT}/qio/lib
mkdir -p ${INSTALLROOT}/qio/include
mkdir -p ${INSTALLROOT}/qio/other_libs
mkdir -p ${INSTALLROOT}/qmp/lib
mkdir -p ${INSTALLROOT}/qmp/include

