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

if [ ${CLUSTER} == 'crusher' ]; then
  cpp_comp=CC
  c_comp=cc
elif [ ${CLUSTER} == 'jlse' ]; then
  cpp_comp=gcc
  c_comp=gcc
else
  _bashFail "Unrecognized cluster ${CLUSTER}."
fi

cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_CXX_COMPILER=${cpp_comp} \
    -DCMAKE_C_COMPILER=${c_comp} \
    -DCMAKE_C_STANDARD=99 \
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



exit


make -j16

make install
mv install quda/.
cd ..

mv build quda/.
