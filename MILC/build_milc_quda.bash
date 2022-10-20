#! /bin/bash

# 
# build_milc_quda.bash                                                               
# 
# C. DeTar, D. Clarke 
# 

source "${bashToolsPath}/MILC/env.bash"


QUDA_INSTALL=${INSTALLROOT}/quda


LIBQUDA="-Wl,-rpath ${QUDA_INSTALL}/lib -L${QUDA_INSTALL}/lib -lquda -D__gfx90a --amdgpu-target=gfx90a -Wl,-rpath=${ROCM_PATH}/hiprand/lib -L${ROCM_PATH}/hiprand/lib -Wl,-rpath=${ROCM_PATH}/rocfft/lib -L${ROCM_PATH}/rocfft/lib -lhiprand -lrocfft -Wl,-rpath=${ROCM_PATH}/hipblas/lib -L${ROCM_PATH}/hipblas/lib -lhipblas -Wl,-rpath=${ROCM_PATH}/rocblas/lib -L${ROCM_PATH}/rocblas/lib -lrocblas -Wl,-rpath=${ROCM_PATH}/hip/lib"


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


EXECUTABLE=ks_spectrum_hisq
echo
echo
echo "Making ${EXECUTABLE}"
echo
echo
cd milc_qcd/ks_spectrum
cp ../Makefile .
make clean
bash -x "${bashToolsPath}/MILC/make_${EXECUTABLE}.bash" 2> ${EXECUTABLE}.err
python3 "${bashToolsPath}/MILC/getOptAndErr.py" ${EXECUTABLE}
rm ${EXECUTABLE}.err
cd ..


EXECUTABLE=su3_rhmd_hisq
echo
echo
echo "Making ${EXECUTABLE}"
echo
echo
cd ks_imp_rhmc
cp ../Makefile .
make clean
bash -x "${bashToolsPath}/MILC/make_${EXECUTABLE}.bash" 2> ${EXECUTABLE}.err
python3 "${bashToolsPath}/MILC/getOptAndErr.py" ${EXECUTABLE}
rm ${EXECUTABLE}.err
cd ../..


echo
echo "moving executable to kpp_spectrum"
mv /ccs/home/dclarke/crusher/milc_qcd/ks_spectrum/ks_spectrum_hisq* /ccs/home/dclarke/crusher/kpp_spectrum/l3248f211b580m002426m06730m8447/.
