#!/bin/bash

# 
# cleany.bash                                                               
# 
# D. Clarke 
# 
# Clean out the build folder after compilation. 
#
 
source "${bashToolsPath}/SIMULATeQCD/env.bash"

mv ${BUILDFOLDER}/myconf.bash* .
rm -rf ${BUILDFOLDER}/*
mv myconf.bash* ${BUILDFOLDER}/. 
