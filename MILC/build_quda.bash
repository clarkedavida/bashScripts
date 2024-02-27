#! /bin/bash

# 
# build_quda.bash                                                               
# 
# C. DeTar, D. Clarke 
# 
# A setup script that gets QUDA running and prepares it for MILC compilation
# on various clusters. The goal is that everything gets installed in the $HOME
# directory.
# 


source "${bashToolsPath}/MILC/env.bash"


BRANCH_NAME=develop
#BRANCH_NAME=feature/staggered_correlators_gk
#BRANCH_NAME=feature/sycl


_bashInfo "Working with QUDA_SRC = ${QUDA_SRC}"
_bashInfo "Branch name = ${BRANCH_NAME}"


if [ ${BRANCH_NAME} == 'feature/staggered_correlators_gk' ]; then
  _bashWarn "As of 23 Jan 2023, this branch is not ready for use with HIP!"
fi


#
# Note: If you try to switch branches when you already have some QUDA folder, things
# may not work. I advise you just redownload the branch from the beginning.
#
if [ -d quda ]; then
  cd quda
  git pull
  git checkout ${BRANCH_NAME}
else
  git clone --branch ${BRANCH_NAME} https://github.com/lattice/quda
  cd quda
  git checkout ${BRANCH_NAME}
fi


_checkForFail $? "Clone or update QUDA git"


cd ${HOME}
mkdir -p ${QUDA_BUILD} 
cd ${QUDA_BUILD} 


# BRANCH	DATE OF LAST COMPILATION 
# develop       23 Jan 2023
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
-DCMAKE_INSTALL_PREFIX=${QUDA_INSTALL} \
-DQUDA_BUILD_SHAREDLIB=ON \
-DQUDA_DIRAC_DEFAULT_OFF=ON \
-DQUDA_DIRAC_STAGGERED=ON \
-DQUDA_DOWNLOAD_USQCD=ON \
-DQUDA_GPU_ARCH=${TARGET_GPU} \
-DQUDA_QIO=ON \
-DQUDA_QMP=ON \
-DQUDA_TARGET_TYPE=HIP \
-DROCM_PATH=${ROCM_PATH} \
${QUDA_SRC}

  _checkForFail $? "cmake QUDA"


# BRANCH	DATE OF LAST COMPILATION
# develop
elif [ ${CLUSTER} == 'jlse' ]; then

  cmake \
-DCMAKE_BUILD_TYPE=RELEASE \
-DCMAKE_INSTALL_PREFIX=${QUDA_INSTALL} \
-DQUDA_BUILD_SHAREDLIB=ON \
-DQUDA_DIRAC_DEFAULT_OFF=ON \
-DQUDA_DIRAC_STAGGERED=ON \
-DQUDA_DOWNLOAD_USQCD=ON \
-DQUDA_QIO=ON \
-DQUDA_QMP=ON \
-DQUDA_TARGET_TYPE=SYCL \
${QUDA_SRC}

  _checkForFail $? "cmake QUDA"


# BRANCH	DATE OF LAST COMPILATION
# develop       23 Jan 2023
elif [ ${CLUSTER} == 'sunspot' ]; then

  cmake \
-DCMAKE_BUILD_TYPE=RELEASE \
-DCMAKE_CXX_COMPILER=${CXX} \
-DCMAKE_C_COMPILER=${CC} \
-DCMAKE_INSTALL_PREFIX=${QUDA_INSTALL} \
-DQUDA_BUILD_SHAREDLIB=ON \
-DQUDA_DIRAC_DEFAULT_OFF=ON \
-DQUDA_DIRAC_STAGGERED=ON \
-DQUDA_DOWNLOAD_USQCD=ON \
-DQUDA_QIO=ON \
-DQUDA_QMP=ON \
-DQUDA_TARGET_TYPE=SYCL \
${QUDA_SRC}

  _checkForFail $? "cmake QUDA"


else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi


# For now this just flashes a message, but one could use this in the future
# to move things around in case only a partial install completes.
make -j16 install
_checkForFail $? "install QUDA"
