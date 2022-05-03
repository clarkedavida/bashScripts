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
# PARAMETER HANDLING. Example use:
#   _checkIfParamEmpty ${paramName} ${param}
#
function _checkIfParamEmpty {
  paramName=$1
  param=$2
  if [ -z ${param} ]; then
    _bashFail "Please set "${paramName}
  fi
}


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
  _checkIfParamEmpty "cm" ${cm}
  _checkIfParamEmpty "cpre" ${cpre}
  _checkIfParamEmpty "msmf" ${msmf}
  echo
  echo "Running script with parameters:"
  echo "     Ns = "${Ns}
  echo "     Nt = "${Nt}
  echo "   beta = "${beta}
  echo "     cm = "${cm}
  echo "   cpre = "${cpre}
  echo "  ms/mf = "${msmf}
  echo
} 
