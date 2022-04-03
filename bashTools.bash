# 
# bashTools.bash                                                               
# 
# D. Clarke
# 
# Some definitions and functions that one might use in a bash script. To
# use these, just
#   source "${bashToolsPath}/bashTools.bash"
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
  if [ ! $1 -eq 0 ]; then echo -e "  ${cred}ERROR $2 ${endc}"; fi
}


#
# FAIL. Example use:
#   _bashFail "Division by zero!"
#
function _bashFail {
  echo
  echo -e "  ${cred}FAIL $1 ${endc}"
  echo
  exit
} 


#
# PASS. Example use:
#  _bashPass "Tests worked!"
#
function _bashPass {
  echo
  echo -e "  ${cgrn}PASS $1 ${endc}"
  echo
}


#
# CHECK FAIL. Example use:
#   _checkForFail $? "Something went wrong."
#
function _checkForFail {
  if [ ! $1 -eq 0 ]; then _bashFail $2; fi
}


#
# CHECK EXTENSION. Example use:
#   _checkExtension CampaignExample.xml xml
#
function _checkExtension {
  case $1 in *.$2) return 1;; esac
  return 0
}


#
# OUTPUT FOR TESTS. Example use:
# _checkPassFail $? "Test name"
#
function _checkPassFail {
  if [ $1 -eq 0 ]; then
    _bashPass $2
  else
    _bashFail $2
  fi
}


#
# COMPRESS ALL SUBFOLDERS INTO TARBALLS. Example use:
#   _createCompressedSubfolders folder
#
function _createCompressedSubfolders {
  folder=$1
  echo
  echo "Compressing subfolders using tar..."
  cd ${folder}
  for subfolder in *; do
    if [ ! -d ${subfolder} ]; then continue; fi
    echo "  "${subfolder}
    tar -zcf ${subfolder}.tgz ${subfolder}
    _checkForFail $? "Unable to tar this folder, aborting."
    rm -rf ${subfolder}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# COMBINE ALL SUBFOLDERS INTO UNCOMPRESSED TARBALLS. Example use:
#   _createTarSubfolders folder
#
function _createTarSubfolders {
  folder=$1
  echo
  echo "Combining subfolders using tar..."
  cd ${folder}
  for subfolder in *; do
    if [ ! -d ${subfolder} ]; then continue; fi
    echo "  "${subfolder}
    tar -cf ${subfolder}.tar ${subfolder}
    _checkForFail $? "Unable to tar this folder, aborting."
    rm -rf ${subfolder}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# Compare two files and return result.
#   compareFiles file1 file2
# Returns 0 if the files are identical.
#
function _compareFiles {
  diff $1 $2 &>/dev/null
  return $?
}
