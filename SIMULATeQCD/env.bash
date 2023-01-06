#!/bin/bash

# 
# env.bash                                                               
# 
# D. Clarke 
#
# Environment script for SIMULATeQCD compilation. 
# 

source "${bashToolsPath}/bashTools.bash"

BUILDFOLDER='buildSIMULATeQCD'

# cuda or amd
GPUMAKE='cuda'

# pascal: 60
# volta: 70
GPUARCH=60
