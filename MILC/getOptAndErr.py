#!/bin/python3
import sys

executable = sys.argv[1]

errFile  = open(executable+'.err','r')
optFile  = open(executable+'.opt','w')
warnFile = open(executable+'.warn','w')

for line in errFile:

  if line.startswith('+++'):
    continue
  elif line.startswith('++'):
    continue
  elif line.startswith('+'):
    parse=line.split()
    if parse[1].startswith("'"):
      continue
    if parse[1].startswith("_"):
      continue
    if parse[1].startswith("set"):
      continue
    if parse[1].startswith("unset"):
      continue
    if parse[1].startswith("source"):
      continue
    if parse[1].startswith("case"):
      continue
    if parse[1].startswith("make"):
      continue
    optFile.write(line[2:])
  else:
    warnFile.write(line)

errFile.close()
optFile.close()
warnFile.close()
