#! /bin/bash

# 
# prep_milc_quda.bash                                                               
# 
# D. Clarke 
#
# Auxiliary script to help reorganize the QUDA folder so that
# everything chan be found by build_milc_quda.bash. 
# 

source env.bash

echo "Updating MILC git..."

if [ ! -d milc_qcd ]; then
  git clone --branch develop https://github.com/milc-qcd/milc_qcd/
else
  cd milc_qcd
  git pull
  cd ..
fi

echo
echo "Prepping quda/install folder..."
mkdir -p ${INSTALLROOT}
mkdir -p ${INSTALLROOT}/qio/lib
mkdir -p ${INSTALLROOT}/qio/include
mkdir -p ${INSTALLROOT}/qio/other_libs
mkdir -p ${INSTALLROOT}/qmp/lib
mkdir -p ${INSTALLROOT}/qmp/include
mkdir -p ${INSTALLROOT}/quda


cd quda

mv install/bin install/quda/.
mv install/examples install/quda/.
mv install/include install/quda/.
mv install/lib install/quda/.

#cp -r  ~/crusher/quda/build/lib/libquda.so install/quda/lib/.
#cp -r  ~/crusher/quda/build/include* install/quda/include/.
#cp -r  ~/ZZ_piecesOfMILC/quda_define.h install/quda/include/.

cp -r  ~/crusher/quda/build/_deps/qio-build/lib/* install/qio/lib/.
cp -r  ~/crusher/quda/build/_deps/qio-build/include/* install/qio/include/.
#cp -r  ~/ZZ_piecesOfMILC/c-lime/include/*.h install/qio/include/.
cp -r  ~/crusher/quda/build/_deps/qio-src/include/* install/qio/include/.
cp -r  ~/crusher/quda/build/_deps/qmp-build/lib/* install/qmp/lib/.
cp -r  ~/crusher/quda/build/_deps/qmp-src/include/* install/qmp/include/.

#cp -r ~/ZZ_piecesOfMILC/c-lime install/qio/other_libs/.

echo
echo "Done."
echo
