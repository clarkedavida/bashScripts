#!/bin/bash

#source "${bashToolsPath}/bashTools.bash"
#JOBID=$1
#_checkIfParamEmpty "JOBID" ${JOBID}
#scontrol show job ${JOBID}

source "${bashToolsPath}/slurmTools.bash"
_showJobDetails "$1"

