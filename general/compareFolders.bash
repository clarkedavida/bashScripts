#!/bin/bash

# 
# compareFolders.bash                                                               
# 
# D. Clarke 
# 
# Compare the contents of two folders. 
# 

source "${bashToolsPath}/bashTools.bash"

folder_a=$1
folder_b=$2

_checkIfParamEmpty "source folder" ${folder_a}
_checkIfParamEmpty "target folder" ${folder_b}

files_a=$(find "$folder_a" -type f -printf "%P\n")
files_b=$(find "$folder_b" -type f -printf "%P\n")

echo
echo "Files in ${folder_a} that aren't in in ${folder_b}:"
echo
for file_a in $files_a; do
    if [[ ! "$files_b" =~ (^|[[:space:]])"$file_a"($|[[:space:]]) ]]; then
        echo "$file_a"
    fi
done
echo
