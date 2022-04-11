# 
# testCheckArray.bash                                                               
# 
# D. Clarke 
# 
# Test function that determines whether certain elements exist in an array. 
# 


source ${bashToolsPath}"/bashTools.bash"


lpass=0


array1=("a" "b" "c" "d")
array2=("some strings" "can have spaces")
array3=(1 2 3)


_checkInArray "a" "${array1[@]}"
result=$?
lpass=$((result + lpass))

_checkInArray "some strings" "${array2[@]}"
result=$?
lpass=$((result + lpass))

_checkInArray "3" "${array3[@]}"
result=$?
lpass=$((result + lpass))

_checkInArray "e" "${array1[@]}"
_bitFlip $?
result=$?
lpass=$((result + lpass))

_checkInArray "o" "${array2[@]}"
_bitFlip $?
result=$?
lpass=$((result + lpass))

_checkInArray "some" "${array2[@]}"
_bitFlip $?
result=$?
lpass=$((result + lpass))


_checkPassFail ${lpass} "Check in array test."

