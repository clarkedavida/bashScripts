# 
# bashTools.bash                                                               
# 
# D. Clarke
# 
# Some definitions and functions that one might use in a bash script. To
# use these, just
#   source "${bashToolsPath}/bashTools.bash"
#


# Whatever you do, do not google this date. 
export BASHTOOLSSEED=7281978


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
# CHECK FOR ERRORS OR FAILURES. Example use:
#   _checkForError $? "That was not supposed to happen..."
#
function _checkForError {
  if [ ! $1 -eq 0 ]; then _bashError "$2"; fi
}
function _checkForFail {
  if [ ! $1 -eq 0 ]; then 
    _bashFail "$2"
  fi
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
  _checkIfParamEmpty "fileName" ${1}
  _checkIfParamEmpty "extension" ${2}
  case $1 in *.$2) return 0;; esac
  return 1
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
# COMPRESS A FOLDER. Example use
#   _compressFolder subfolder
#
function _compressFolder {
  local subfolder=$1
  if [ ! -d ${subfolder} ]; then 
    _bashFail "must call on folder"
  fi
  echo "  "${subfolder}
  tar -zcf ${subfolder}.tgz ${subfolder}
  _checkForFail $? "compress folder"
  _checkSum ${subfolder}.tgz
  rm -rf ${subfolder}
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
    _compressFolder ${subfolder}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# DECOMPRESS A TARBALL. Example use:
#   _decompressTarball archive
#
function _decompressTarball {
  local archive=$1
  _checkExtension ${archive} tgz
  if [ $? -eq 1 ]; then
    _bashFail "must call on .tgz file" 
  fi 
  echo "  "${archive}
  if [ -f ${archive}.md5 ]; then
    md5sum -c --quiet ${archive}.md5
  fi    
  tar -zxf ${archive}
  _checkForFail $? "decompress folder"
  rm ${archive}
  if [ -f ${archive}.md5 ]; then
    rm ${archive}.md5
  fi    
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
    _decompressTarball ${archive}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# TAR A FOLDER. Example use:
#   _tarFolder subfolder
#
function _tarFolder {
  local subfolder=$1
  if [ ! -d ${subfolder} ]; then continue; fi
  echo "  "${subfolder}
  tar -cf ${subfolder}.tar ${subfolder}
  _checkForFail $? "compress folder"
  _checkSum ${subfolder}.tar
  rm -rf ${subfolder}
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
    _tarFolder ${subfolder}
  done
  cd ..
  echo
  echo "Done."
  echo
}


#
# OPEN A TARBALL. Example use:
#   _decompressTarball archive
#
function _openTarball {
  local archive=$1
  _checkExtension ${archive} tar
  if [ $? -eq 1 ]; then
    _bashFail "must call on .tar file" 
  fi 
  echo "  "${archive}
  if [ -f ${archive}.md5 ]; then
    md5sum -c --quiet ${archive}.md5
  fi    
  tar -xf ${archive}
  _checkForFail $? "open folder"
  rm ${archive}
  if [ -f ${archive}.md5 ]; then
    rm ${archive}.md5
  fi    
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
    if [ $? -eq 1 ]; then continue; fi
    _openTarball ${archive}
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
  _checkIfParamEmpty "folder name" $1
  if [ -z ${2} ]; then
    echo "Counting all files." 
    find $1 -type f | wc -l
  else
    echo "Counting files of form $2" 
    find $1 -type f -name $2 | wc -l
  fi
}


#
# RECURSIVE COUNT TOTAL FILES IN HOME. Example use: 
#   _countTotalFiles
#
function _countTotalFiles {
  cd
  find . -type f | wc -l
}


#
# REMOVE TRAILING WHITE SPACE. Example use:
#   _removeTrailingWhitespace filename.txt
#
function _removeTrailingWhitespace {
  _checkIfParamEmpty "file name" $1
  if [ -f "$1" ]; then
    sed -i 's/[[:blank:]]*$//' "$1"
  fi 
}


#
# CHECK IF EOF HAS NEWLINE. Example use:
#   _checkNewlineEOF filename.txt
#
function _checkNewlineEOF {
  num_lines=$(wc -l < $1)
  last_char=$(tail -c 1 $1)
  if [ $num_lines -gt 0 ] && [ "$last_char" == "" ]; then
    : 
  else
    echo "$1 has no newline at EOF"
  fi
}


#
# DOES STRING START WITH SUBSTRING? Example use:
#   _startsWith helloWorld hello
#
function _startsWith {
  string=$1
  substring=$2
  _checkIfParamEmpty "string" ${1}
  _checkIfParamEmpty "substring" ${2}
  if [[ $1 == "$2"* ]]; then
      return 0 
  else
      return 1 
  fi
}


#
# UPDATE ALL TIMESTAMPS RECURSIVELY IN CURRENT DIRECTORY. 
#
function _touchEverything {
  find . -exec touch {} \;
}
