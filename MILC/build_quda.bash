#! /bin/bash

# 
# build_quda.bash                                                               
# 
# C. DeTar, D. Clarke 
# 
# A setup script that gets QUDA running and prepares it for MILC compilation
# on various clusters. 
# 

source env.bash

# pushd and popd are ways of changing directories that involve a
# directory stack. it can be convenient, but it's not really utilized here it seems.
pushd quda

QUDA_HOME=$(pwd)
#BRANCH_NAME=develop
BRANCH_NAME=feature/staggered_correlators_gk


if [ -d quda ]
then
  cd quda
  git pull
  git checkout ${BRANCH_NAME}
else
  git clone --branch ${BRANCH_NAME} https://github.com/lattice/quda
  cd quda
  git checkout ${BRANCH_NAME}
fi
cd ..

mkdir -p build && cd build

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


# -DCMAKE_SHARED_LINKER_FLAGS="—-offload-arch=gfx90a" \

make -j16

make install
mv install quda/.
cd ..

mv build quda/.
