#!/bin/bash

#     
# comments.bash                                                
#
# D. Clarke
#
# Bash script to generate standard comment headings for new programs. Call
# using
#
# 	sh comments.sh [-l language] [-f] [program name]
#
# where [language] can be one of {bash, c (default), fortran, python},
# [program name] should include the extension (e.g. program.f) and -f will
# put the comment block at the top of a previously existing file.
#

# Usage
usage()
{
cat << EOF

$0
This script creates comment blocks for programs.

USAGE: sh $0 [options] [program name]

OPTIONS:
 -h  Show this message
 -l  Language {bash, c (default), fortran, python}
 -p  Parameter file
 -f  Top of existing file

EOF
}

# Set default program option.
LANGUAGE="bash"
FRONT=false
PFILE=false

# Parse options. You need to include a ':' to the right of any option that
# takes in an argument. Make sure you follow this syntax closely.
while getopts "hl:pf" OPTION; do
  case $OPTION in
    h)
      usage
      exit
      ;;
    l) 
      LANGUAGE=$OPTARG
      ;;
    p)
      PFILE=true
      ;;
    f) 
      FRONT=true
      ;;
    ?) 
      usage
      exit
      ;;
  esac
done

# After looking for options, check for any other arguments. (For this script
# we always need to include program name.)
shift $((OPTIND-1))
NAME=$1

# Make sure LANGUAGE and NAME are nonempty.
if [ -z $LANGUAGE ] || [ -z $NAME ]; then
  usage
  exit
fi

# Make sure you aren't overwriting any files. If you are, make sure you aren't
# trying to write to a directory.
if [ -e $NAME ]; then
  if $FRONT; then
    if ! [ -f $NAME ]; then
      echo $NAME" is not a regular file."
    fi
  else
    echo $NAME" already exists."
    exit
  fi
fi

# Set comment characters
case $LANGUAGE in
  bash)
    c1="# "
    c2=$c1
    c3=$c1
    ;;
  c)
    c1="/* "
    c2=" * "
    c3=" */"
    ;;
  fortran)
    c1="! "
    c2=$c1
    c3=$c1
    ;;
  python)
    c1="# "
    c2=$c1
    c3=$c1
    ;;
  ?)
    usage
    exit
    ;;
esac

# Create temporary file with comment block.
if $PFILE; then
  echo "${c1}
${c2}${NAME}                                                              
${c2}
${c2}[Purpose of parameter file]
${c2}
${c2}[Parameter: description]
${c3}" > temp1
else
  echo "${c1}
${c2}${NAME}                                                               
${c2}
${c2}[F. Last]
${c2}
${c2}[Program description]
${c2}
${c3}" > temp1
fi

# Move temporary file to permanent file.
if $FRONT; then
  cat temp1 $NAME > temp2 && mv temp2 $NAME
  rm temp1
else
  mv temp1 $NAME
fi

# All done.
echo "Successfully added comment block to "$NAME
