#!/bin/bash

# 
# concatenateFiles.bash                                                               
# 
# D. Clarke 
# 
# One way to manage a large number of files is to combine them into one. This script
# takes a PREFIX with EXTENSION and combines them into a single file. The
# output format is:
#
#   file1.ext
#   ...
#
#   file2.ext
#   ...
# 
# Call using: bash concatenateFile.bash PREFIX EXTENSION 
#

source "/home/dclarke/scripts_bash/bashTools.bash"

PREFIX=$1
EXTENSION=$2

if [ -z "$PREFIX" ] || [ -z "$EXTENSION" ]; then
  _bashFail "  Useage: bash concatenateFile.bash PREFIX EXTENSION"
fi


combinedFile="combined_"${PREFIX}"."${EXTENSION}

echo
echo "Combining files into "${combinedFile}
echo

for file in ${PREFIX}*${EXTENSION}; do
  echo >> ${combinedFile}
  echo "@@@ ------------------------------ "${file}":" >> ${combinedFile}
  echo >> ${combinedFile}
  cat ${file} >> ${combinedFile} 
done
