#! /bin/bash

# 
# build_milc_quda.bash                                                               
# 
# C. DeTar, D. Clarke 
# 

source "${bashToolsPath}/MILC/env.bash"


QUDA_INSTALL=${INSTALLROOT}/quda


LIBQUDA="-Wl,-rpath ${QUDA_INSTALL}/lib -L${QUDA_INSTALL}/lib -lquda -D__gfx90a --amdgpu-target=gfx90a -Wl,-rpath=${ROCM_PATH}/hiprand/lib -L${ROCM_PATH}/hiprand/lib -Wl,-rpath=${ROCM_PATH}/rocfft/lib -L${ROCM_PATH}/rocfft/lib -lhiprand -lrocfft -Wl,-rpath=${ROCM_PATH}/hipblas/lib -L${ROCM_PATH}/hipblas/lib -lhipblas -Wl,-rpath=${ROCM_PATH}/rocblas/lib -L${ROCM_PATH}/rocblas/lib -lrocblas -Wl,-rpath=${ROCM_PATH}/hip/lib"



echo
echo "Prepping quda/install folder for MILC..."
mkdir -p ${INSTALLROOT}/quda
mkdir -p ${INSTALLROOT}/qio/lib
mkdir -p ${INSTALLROOT}/qio/include
mkdir -p ${INSTALLROOT}/qio/other_libs
mkdir -p ${INSTALLROOT}/qmp/lib
mkdir -p ${INSTALLROOT}/qmp/include



if [ ! -d milc_qcd ]; then
  echo "Cloning MILC git..."
  git clone --branch develop https://github.com/milc-qcd/milc_qcd/
else
  cd milc_qcd
  echo "Updating MILC git..."
  git pull
  cd ..
fi


echo "Moving and copying remaining files to install directory..."
cd quda
mv install/bin install/quda/.
mv install/examples install/quda/.
mv install/include install/quda/.
mv install/lib install/quda/.
cp -r  build/_deps/qio-build/lib/* install/qio/lib/.
cp -r  build/_deps/qio-build/include/* install/qio/include/.
cp -r  build/_deps/qio-src/include/* install/qio/include/.
cp -r  build/_deps/qmp-build/lib/* install/qmp/lib/.
cp -r  build/_deps/qmp-src/include/* install/qmp/include/.
cd ..



############ Make ks_spectrum_hisq ##################
echo
echo
echo "Making ks_spectrum"
echo
echo

cd milc_qcd/ks_spectrum
cp ../Makefile .
make clean

MY_CC=hipcc \
MY_CXX=hipcc \
ARCH="" \
COMPILER="gnu" \
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
OFFLOAD=HIP \
WANT_KS_CONT_GPU=true \
WANT_SHIFT_GPU=true \
WANT_SPIN_TASTE_GPU=true \
WANT_GAUGEFIX_OVR_GPU=true \
make -j 1 ks_spectrum_hisq
cd ..


############ Make su3_rhmd_hisq ##################
echo
echo
echo "Making su3_rhmd_hisq"
echo
echo
cd ks_imp_rhmc
cp ../Makefile .
make clean

MY_CC=hipcc \
MY_CXX=hipcc \
ARCH="" \
COMPILER="gnu" \
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
PRECISION=1 \
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
OFFLOAD=HIP \
WANT_KS_CONT_GPU=true \
WANT_SHIFT_GPU=true \
WANT_SPIN_TASTE_GPU=true \
WANT_GAUGEFIX_OVR_GPU=true \
make -j 1 su3_rhmd_hisq
cd ../..

echo
echo "moving executable to kpp_spectrum"
mv /ccs/home/dclarke/crusher/milc_qcd/ks_spectrum/ks_spectrum_hisq /ccs/home/dclarke/crusher/kpp_spectrum/l3248f211b580m002426m06730m8447/.
