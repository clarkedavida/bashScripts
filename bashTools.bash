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
# FAIL AND EXIT. Example use:
#   _bashFail "Division by zero!"
#
function _bashFail {
  echo
  echo -e "  ${cred}FAIL: $1 ${endc}"
  echo
  exit
}


#
# LOGGING. Example use:
#   _bashWarn "Using this package is not recommended."
#
function _bashError {
  echo
  echo -e "  ${cred}ERROR: $1 ${endc}"
  echo
} 
function _bashWarn {
  echo
  echo -e "  ${cyel}WARNING: $1 ${endc}"
  echo
} 
function _bashPass {
  echo
  echo -e "  ${cgrn}SUCCESS: $1 ${endc}"
  echo
}
function _bashInfo {
  echo
  echo -e "  ${ccyn}INFO: $1 ${endc}"
  echo
}


#
# CHECK ERROR. Example use:
#   _checkForError $? "That was not supposed to happen..."
#
function _checkForError {
  if [ ! $1 -eq 0 ]; then _bashError "$2"; fi
}


#
# CHECK FAIL. Example use:
#   _checkForFail $? "Something went wrong."
#
function _checkForFail {
  if [ ! $1 -eq 0 ]; then 
    _bashFail "$2"
  fi
}


#
# PARAMETER HANDLING. Example use:
#   _checkIfParamEmpty ${paramName} ${param}
#
function _checkIfParamEmpty {
  paramName=$1
  param=$2
  if [ -z ${param} ]; then
    _bashFail "Please set ${paramName}"
  fi
}


#
# CHECK EXTENSION. Example use:
#   _checkExtension CampaignExample.xml xml
# Returns 0 if the extension matches.
#
function _checkExtension {
  case $1 in *.$2) return 0;; esac
  return 1
}


#
# OUTPUT FOR TESTS. Example use:
# _checkPassFail $? "Test name"
#
function _checkPassFail {
  if [ $1 -eq 0 ]; then
    _bashPass "$2"
  else
    _bashFail "$2"
  fi
}
function _checkPassError {
  if [ $1 -eq 0 ]; then
    _bashPass "$2"
  else
    _bashError "$2"
  fi
}


#
# MAKE CHECKSUM FILE. Example use:
#   _checkSum fileName
#
function _checkSum {
  local fileName=$1
  _checkIfParamEmpty "fileName" ${fileName}
  md5sum ${fileName} > ${fileName}.md5
  _checkForFail $? "Unable to md5sum ${fileName}"
}


#
# COMPRESS ALL SUBFOLDERS INTO TARBALLS. Example use:
#   _createCompressedSubfolders folder
#
function _createCompressedSubfolders {
  local folder=$1
  _checkIfParamEmpty "folder" ${folder} 
  echo
  echo "Compressing subfolders using tar..."
  cd ${folder}
  for subfolder in *; do
    if [ ! -d ${subfolder} ]; then continue; fi
    echo "  "${subfolder}
    tar -zcf ${subfolder}.tgz ${subfolder}
    _checkForFail $? "compress folder."
    _checkSum ${subfolder}.tgz
    rm -rf ${subfolder}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# DECOMPRESS ALL TARBALLS. Example use:
#   _decompressSubfolders folder
#
function _decompressSubfolders {
  local folder=$1
  _checkIfParamEmpty "folder" ${folder} 
  echo
  echo "Decompressing archives using tar..."
  cd ${folder}
  for archive in *; do
    _checkExtension ${archive} tgz
    if [ $? -eq 1 ]; then continue; fi
    echo "  "${archive}
    if [ -f ${archive}.md5 ]; then
      md5sum -c --quiet ${archive}.md5
    fi    
    tar -zxf ${archive}
    _checkForFail $? "decompress folder"
    rm ${archive} 
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
  local folder=$1
  _checkIfParamEmpty "folder" ${folder} 
  echo
  echo "Combining subfolders using tar..."
  cd ${folder}
  for subfolder in *; do
    if [ ! -d ${subfolder} ]; then continue; fi
    echo "  "${subfolder}
    tar -cf ${subfolder}.tar ${subfolder}
    _checkForFail $? "compress folder"
    _checkSum ${subfolder}.tar
    rm -rf ${subfolder}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# OPEN ALL TARBALLS. Example use:
#   _openTarSubfolders folder
#
function _openTarSubfolders {
  local folder=$1
  _checkIfParamEmpty "folder" ${folder} 
  echo
  echo "Open subfolders using tar..."
  cd ${folder}
  for archive in *; do
    _checkExtension ${archive} tar
    echo "  "${archive}
    if [ -f ${archive}.md5 ]; then
      md5sum -c --quiet ${archive}.md5
    fi    
    tar -xf ${archive} 
    _checkForFail $? "decompress folder"
    rm -rf ${archive}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# COMPARE TWO FILES. Example use:
#   _compareFiles file1 file2
# Returns 0 if the files are identical.
#
function _compareFiles {
  diff $1 $2 &>/dev/null
  return $?
}


#
# CHECK IF ELEMENT IN ARRAY. Example use:
#   _checkInArray "element" "${array[@]}"
# Returns 0 if it finds element in the array.
#
function _checkInArray {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


#
# FLIP 0 TO 1 AND VICE-VERSA. Example use:
#   _bitFlip $?
function _bitFlip {
  if [ "$1" -eq "0" ]; then
    return 1
  elif [ "$1" -eq "1" ]; then
    return 0
  else
    _bashFail "_bitFlip can only take 0 or 1!"
  fi
}


#
# ARE YOU SURE YOU WANT TO DO THIS? Example use:
#   _confirmAction "Are you sure you want to do this?"
#
function _confirmAction {
  read -p "$1 (Y/y to proceed.) "
  if ! [[ $REPLY =~ [Yy]$ ]]; then
    exit
  fi
}


#
# IS THIS REQUIRED FILE MISSING? Example use:
#   _lookForFile fileName
#
function _lookForFile {
  if [ ! -f $1 ]; then _bashFail "Missing required file $1"; fi
}


#
# COUNT FILES MATCHING REGEX IN FOLDER. Example use:
#   _countFilesInFolder l3216f3b6315m00281m07587 "*.check"
#
function _countFilesInFolder {
  _checkIfParamEmpty "folder name and regular expression" $1
  _checkIfParamEmpty "folder name and regular expression" $2
  find $1 -type f -name $2 | wc -l
}


#
# RECURSIVE COUNT TOTAL FILES IN HOME. Example use: 
#   _countTotalFiles
#
function _countTotalFiles {
  cd
  find . -type f | wc -l
}

