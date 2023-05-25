#!/bin/bash

# 
# untar.bash                                                               
# 
# D. Clarke 
# 
# Open up all tar archives in present directory. 
# 

source "${bashToolsPath}/bashTools.bash"

target=$1

# If the argument is empty, then do every folder in this directory. 
if [ -z "${target}" ]; then
  _openTarSubfolders .

# If the argument is a .tar, then just do that .tar.
elif [ -f "${target}" ]; then
  _openTarball ${target}

# If the argument is a folder, do that folder.
elif [ -d "${target}" ]; then
  _openTarSubfolders ${target}

else
  _bashFail "pass nothing, a tgz file, or a folder name" 
fi

