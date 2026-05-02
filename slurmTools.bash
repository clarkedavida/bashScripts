# 
# slurmTools.bash                                                               
# 
# D. Clarke
# 
# Some definitions and functions that one might use in bash scripts
# that interface with Slurm. To use these, just
#
#   source "${bashToolsPath}/slurmTools.bash"
#
# Mostly these are wrappers for slurm commands I can never remember.
#

source "${bashToolsPath}/bashTools.bash"

#
# Example use:
#   _showJobDetails 12345
#
function _showJobDetails {
  JOBID="$1"
  _checkIfParamEmpty "JOBID" "${JOBID}"
  scontrol show job "${JOBID}"
}


#
# WHAT NODE AM I RUNNING ON. Example use:
#   _whatsMyNode
#
function _whatsMyNode {
  _bashInfo
  _bashInfo "RUNNING ON NODE: $(hostname)"
  _bashInfo
}

