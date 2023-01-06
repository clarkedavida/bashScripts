#!/bin/bash

# 
# installSIMULATeQCD.bash                                                               
# 
# D. Clarke 
# 
# Get SIMULATeQCD set up.
# 

source "${bashToolsPath}/SIMULATeQCD/env.bash"

if [ ! -d SIMULATeQCD ]; then
  git clone git@github.com:LatticeQCD/SIMULATeQCD.git
fi

mkdir -p ${BUILDFOLDER}
cp ${bashToolsPath}/SIMULATeQCD/cleany.bash .

cd ${BUILDFOLDER}
cp ${bashToolsPath}/SIMULATeQCD/myconf.bash .

./myconf.bash
