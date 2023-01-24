#! /bin/bash

# 
# make_ks_spectrum_hisq.bash 
# 
# D. Clarke 
# 

source "${bashToolsPath}/MILC/env.bash"


LIBQUDA="-Wl,-rpath ${QUDA_INSTALL}/lib -L${QUDA_INSTALL}/lib -lquda -D__gfx90a --amdgpu-target=gfx90a -Wl,-rpath=${ROCM_PATH}/hiprand/lib -L${ROCM_PATH}/hiprand/lib -Wl,-rpath=${ROCM_PATH}/rocfft/lib -L${ROCM_PATH}/rocfft/lib -lhiprand -lrocfft -Wl,-rpath=${ROCM_PATH}/hipblas/lib -L${ROCM_PATH}/hipblas/lib -lhipblas -Wl,-rpath=${ROCM_PATH}/rocblas/lib -L${ROCM_PATH}/rocblas/lib -lrocblas -Wl,-rpath=${ROCM_PATH}/hip/lib"


MY_CC=hipcc \
MY_CXX=hipcc \
ARCH="" \
COMPILER="gnu" \
OFFLOAD="HIP" \
OPT="-O3 -Ofast" \
PATH_TO_NVHPCSDK="" \
CUDA_HOME="" \
QUDA_HOME=${QUDA_INSTALL} \
WANTQUDA=true \
WANT_FN_CG_GPU=true \
WANT_FL_GPU=true \
WANT_GF_GPU=true \
WANT_FF_GPU=true \
WANT_MIXED_PRECISION_GPU=2 \
PRECISION=2 \
MPP=true \
OMP=true \
WANTQIO=true \
WANTQMP=true \
QIOPAR=${INSTALLROOT}/qio \
QMPPAR=${INSTALLROOT}/qmp \
LIBQUDA=${LIBQUDA} \
CGEOM="-DFIX_NODE_GEOM -DFIX_IONODE_GEOM" \
KSCGMULTI="-DKS_MULTICG=HYBRID -DMULTISOURCE -DMULTIGRID" \
CTIME="-DNERSC_TIME -DCGTIME -DFFTIME -DFLTIME -DGFTIME -DREMAP -DPRTIME -DIOTIME" \
WANT_GAUGEFIX_OVR_GPU=true \
make -j 1 ks_spectrum_hisq


_checkForFail $? "make ks_spectrum_hisq"