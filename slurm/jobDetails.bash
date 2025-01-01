#!/bin/bash

source "${bashToolsPath}/bashTools.bash"

JOBID=$1

_checkIfParamEmpty "JOBID" ${JOBID}

scontrol show job ${JOBID}
