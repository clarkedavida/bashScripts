#!/bin/bash

# 
# HotQCDTools.bash                                                               
# 
# D. Clarke 
#
# Some useful tools when setting up HotQCD lattice runs.
#

source "${bashToolsPath}/bashTools.bash"


#
# DISPLAY RUN PARAMETERS. Example use:
#   _printLatticeParams
#
function _printLatticeParams {
  _checkIfParamEmpty "Ns" ${Ns}
  _checkIfParamEmpty "Nt" ${Nt}
  _checkIfParamEmpty "beta" ${beta}
  echo
  echo "Running script with parameters:"
  echo "     Ns = "${Ns}
  echo "     Nt = "${Nt}
  echo "  cbeta = "${beta}
  echo "    cml = "${ml}
  echo "    cms = "${ms}
  echo
} 
function _printLatticeParamsNf3 {
  _checkIfParamEmpty "Ns" ${Ns}
  _checkIfParamEmpty "Nt" ${Nt}
  _checkIfParamEmpty "beta" ${beta}
  _checkIfParamEmpty "cm" ${m}
  _checkIfParamEmpty "cpre" ${pre}
  _checkIfParamEmpty "msmf" ${msmf}
  echo
  echo "Running script with parameters:"
  echo "     Ns = "${Ns}
  echo "     Nt = "${Nt}
  echo "  cbeta = "${beta}
  echo "     cm = "${m}
  echo "   cpre = "${pre}
  echo "  ms/mf = "${msmf}
  echo
} 
