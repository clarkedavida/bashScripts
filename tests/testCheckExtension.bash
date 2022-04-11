#!/bin/bash

source ${bashToolsPath}"/bashTools.bash"


lpass=0


_checkExtension file.xml xml
result=$?
lpass=$((result + lpass))


_checkExtension file.xml xsd
_bitFlip $?
result=$?
lpass=$((result + lpass))


_checkExtension file.xsd.xml xsd
_bitFlip $?
result=$?
lpass=$((result + lpass))


_checkPassFail ${lpass} "Extension test."
