#!/bin/bash

# 
# untgz.bash                                                               
# 
# D. Clarke 
# 
# Unzip compressed .tgz 
# 

source "${bashToolsPath}/bashTools.bash"

target=$1

# If the argument is empty, then do every folder in this directory. 
if [ -z "${target}" ]; then
  _decompressSubfolders .

# If the argument is a .tgz, then just do that .tgz.
elif [ -f "${target}" ]; then
  _decompressTarball ${target}

# If the argument is a folder, do that folder.
elif [ -d "${target}" ]; then
  _decompressSubfolders ${target}

else
  _bashFail "pass nothing, a tgz file, or a folder name" 
fi

