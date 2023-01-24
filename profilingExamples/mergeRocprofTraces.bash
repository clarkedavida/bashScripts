#!/bin/bash

source env.bash

$1

${ROCM_PATH}/rocprofiler/bin/merge_traces.sh $1
