#! /bin/bash

# 
# make_ks_spectrum_hisq.bash 
# 
# D. Clarke 
# 

source "${bashToolsPath}/MILC/env.bash"


GPU_ARCH=${CLUSTER_GPU_ARCH} \
MY_CC=${CLUSTER_CC} \
MY_CXX=${CLUSTER_CXX} \
ARCH="" \
COMPILER=${CLUSTER_COMPILER} \
OFFLOAD=${CLUSTER_OFFLOAD} \
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
WANT_GAUGEFIX_OVR_GPU=true \
PRECISION=2 \
MPP=true \
OMP=true \
WANTQIO=true \
WANTQMP=true \
QIOPAR=${INSTALLROOT}/qio \
QMPPAR=${INSTALLROOT}/qmp \
LIBQUDA=${CLUSTER_LIBQUDA} \
CGEOM="-DFIX_NODE_GEOM -DFIX_IONODE_GEOM" \
KSCGMULTI="-DKS_MULTICG=HYBRID -DMULTISOURCE -DMULTIGRID" \
LDFLAGS=${CLUSTER_LDFLAGS} \
CTIME="-DNERSC_TIME -DCGTIME -DFFTIME -DFLTIME -DGFTIME -DREMAP -DPRTIME -DIOTIME" \
make -j 1 ks_spectrum_hisq


_checkForFail $? "make ks_spectrum_hisq"
