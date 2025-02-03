source "${bashToolsPath}/bashTools.bash"

filename=$1

_checkIfParamEmpty "filename" ${filename}
_bashInfo "Search current directory for ${filename}:"
find . -name "${filename}"
