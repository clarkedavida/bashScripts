#!/bin/bash

source "../bashTools.bash"


lpass=1


_checkExtension file.xml xml
result=$?
lpass=$((result * lpass))


_checkExtension file.xml xsd
if [ $? -eq 0 ]; then 
  result=1
else
  result=0
fi
lpass=$((result * lpass))


if [ $lpass -eq 1 ]; then
  _bashPass "Extension test."
else
  _bashFail "Extension test."
fi 
