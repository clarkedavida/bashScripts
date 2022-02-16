# 
# bashTools.bash                                                               
# 
# D. Clarke, 19 Aug 2021 
# 
# Some definitions and functions that one might use in a bash script. To
# use these, just
#   source "/path/to/bashTools.bash"
#


#
# COLORS. Example use: 
#   echo -e "  ${cred}ERROR encountered while running in this folder!${endc}"
#
endc="\e[0m"
cblk="\e[90m"
cred="\e[91m"
cgrn="\e[92m" 
cyel="\e[93m" 
cblu="\e[94m" 
cpur="\e[95m" 
ccyn="\e[96m" 
cwhi="\e[97m"


#
# ERROR HANDLING. Example use:
#   _checkForError $? "That was not supposed to happen..."
#
function _checkForError {
  if [ ! $1 -eq 0 ]; then
    echo -e "  ${cred}ERROR $2 ${endc}"
  fi
}


#
# FAIL. Example use:
#   _bashFail "Division by zero!"
#
function _bashFail {
  echo -e "  ${cred}FAIL $1 ${endc}"
  exit
} 


#
# PASS. Example use:
#  _bashPass "Tests worked!"
#
function _bashPass {
  echo -e "  ${cgrn}PASS $1 ${endc}"
}


#
# CHECK FAIL. Example use:
#   _checkForFail $? "Something went wrong."
#
function _checkForFail {
  if [ ! $1 -eq 0 ]; then
    echo -e "  ${cred}FAIL $2 ${endc}"
    exit
  fi
}


#
# CHECK EXTENSION. Example use:
#   _checkExtension CampaignExample.xml xml
#
function _checkExtension {
  case $1 in *.$2) return 1;; esac
  return 0
}
