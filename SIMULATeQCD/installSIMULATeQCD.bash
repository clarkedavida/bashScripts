#!/bin/bash

# 
# installSIMULATeQCD.bash                                                               
# 
# D. Clarke 
# 
# Get SIMULATeQCD set up.
# 

source "${bashToolsPath}/SIMULATeQCD/env.bash"
bashrcFile=${HOME}/.bashrc


if [ ! -d SIMULATeQCD ]; then
  if [ ! -d git-lfs ]; then
    echo
    echo 'Installing git-lfs, which was assumed to be in your home directory.'
    echo
    mkdir git-lfs
    cd git-lfs
    wget https://github.com/git-lfs/git-lfs/releases/download/v3.0.2/git-lfs-linux-amd64-v3.0.2.tar.gz
    tar -xf git-lfs-linux-amd64-v3.0.2.tar.gz
    PREFIX=${GITLFSFOLDER} ./install.sh
    echo "export PATH=${GITLFSFOLDER}/bin:\$PATH" >> ${bashrcFile}
    cd ..
  fi
  source .bashrc 
  ${GITLFSFOLDER}/bin/git-lfs install
  git clone git@github.com:LatticeQCD/SIMULATeQCD.git
fi


mkdir -p ${BUILDFOLDER}
cp ${bashToolsPath}/SIMULATeQCD/cleany.bash .
cd ${BUILDFOLDER}
cp ${bashToolsPath}/SIMULATeQCD/myconf.bash .
./myconf.bash
