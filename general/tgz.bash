#!/bin/bash

# 
# tgz.bash                                                               
# 
# D. Clarke 
# 
# Tar -z everything within present directory, then deletes the folder after
# it finished the tar. 
# 

source "${bashToolsPath}/bashTools.bash"

target=$1

# If the argument is empty, then do every folder in this directory. 
if [ -z "${target}" ]; then
  _createCompressedSubfolders .

# If the argument is a folder, then just do that folder.
elif [ -d "${target}" ]; then
  _compressFolder ${target}

else
  _bashFail "pass nothing or a folder name" 
fi

