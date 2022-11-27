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

_createCompressedSubfolders .
