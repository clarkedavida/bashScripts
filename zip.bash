#!/bin/bash

# 
# zip.bash                                                               
# 
# D. Clarke 
# 
# Tars everything within present directory, then deletes the folder after
# it finished the tar. 
# 

source "${bashToolsPath}/bashTools.bash"

_createCompressedSubfolders .
