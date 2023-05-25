#!/bin/bash

# 
# testCompareFiles.bash
# 
# D. Clarke 
# 


source ${bashToolsPath}"/bashTools.bash"

# Make a fake file with trailing whitespace
echo "i'm in    	
  the      mood		   	 	
 

for love  
simply because you're		
near me" > temp.txt

_removeTrailingWhitespace temp.txt

_compareFiles temp.txt compareFilesTest/trailingWhitespace.txt

_checkPassFail $? "Whitespace test."

rm temp.txt

