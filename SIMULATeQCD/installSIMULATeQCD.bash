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
THISFOLDER=$(pwd)

_bashInfo "Build for cluster ${CLUSTER}"

if [ ! -d SIMULATeQCD ]; then
  if [ ! -d ${GITLFSFOLDER} ]; then
    echo
    _bashInfo "Installing git-lfs, which was assumed to be in ${HOME}."
    echo
    mkdir ${GITLFSFOLDER}
    cd ${GITLFSFOLDER}
    wget https://github.com/git-lfs/git-lfs/releases/download/v3.0.2/git-lfs-linux-amd64-v3.0.2.tar.gz
    _checkForFail $? "wget"
    _decompressTarball git-lfs-linux-amd64-v3.0.2.tar.gz
    PREFIX=${GITLFSFOLDER} ./install.sh
    _checkForFail $? "gitlfs_install.sh"
    echo "export PATH=${GITLFSFOLDER}/bin:\$PATH" >> ${bashrcFile}
    cd ${THISFOLDER}
  fi
  source ${bashrcFile} 
  ${GITLFSFOLDER}/bin/git-lfs install
  _checkForFail $? "gitlfs_install"
  git clone git@github.com:LatticeQCD/SIMULATeQCD.git
fi


mkdir -p ${BUILDFOLDER}
cp ${bashToolsPath}/SIMULATeQCD/${CLEANSCRIPT} .
cd ${BUILDFOLDER}
cp ${bashToolsPath}/SIMULATeQCD/${CONFSCRIPT} .
./${CONFSCRIPT}
