#!/bin/bash

# 
# cleany.bash                                                               
# 
# D. Clarke 
# 
# Clean out the build folder after compilation. 
#
 
source "${bashToolsPath}/SIMULATeQCD/env.bash"

mv ${BUILDFOLDER}/${CONFSCRIPT}* .
rm -rf ${BUILDFOLDER}/*
mv ${CONFSCRIPT}* ${BUILDFOLDER}/. 
