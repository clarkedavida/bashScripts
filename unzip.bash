#!/bin/bash

# 
# unzip.bash                                                               
# 
# D. Clarke 
# 
# Untars everything within present directory, then deletes the folder after
# it finished the untar. 
# 

source "${bashToolsPath}/bashTools.bash"

echo
echo "tar -zxf on everyone in this folder:"
echo
for f in *.tgz; do

  echo "  "${f}
  tar -zxf ${f}
  if [ $? -eq 0 ]; then
    rm ${f}
  else
    _bashFail "Couldn't extract "${f}
  fi

done
echo
echo "Done."
echo
