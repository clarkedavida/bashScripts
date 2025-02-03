source "${bashToolsPath}/bashTools.bash"

declare -a extensions=(txt sh md py h cpp param rat)

# Loop over all subfolders
_bashInfo "Removing whitespace from files:"
for file in $(find . -type f); do

  ext="${file##*.}"

  _checkInArray "${ext}" "${extensions[@]}"
  inArray=$?

  # This means I found it in the array
  if [ ${inArray} -eq 0 ]; then 
    _bashInfo "    $file"
    _removeTrailingWhitespace $file
  fi

done

_bashInfo "Done."
