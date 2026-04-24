#!/bin/bash

whatsInQueue=$(squeue --format="%.14i %.9P %.14j %.8u %.10T %.10M %.9l %.6D %R" --me --noheader)
whatsMyPrio=$(sprio -u "$(whoami)" --noheader)

declare -A jobPriority

whitespace='  '

# Collect priority
while read -r job; do
    [[ -z "$job" ]] && continue
    jobInfo=($job)
    ID=${jobInfo[0]}
    prio=${jobInfo[3]}
    jobPriority[$ID]=$prio
    IDlength=${#ID}
    length=$((IDlength - 5))
    whitespace=$(printf "%${length}s" "")
done <<< "$whatsMyPrio"

echo "${whitespace}JOBID PARTITION           NAME     USER      STATE       TIME TIMELIMIT  NODES NODELIST(REASON)  PRIORITY"

# Process jobs and print with priority
while read -r job; do
    [[ -z "$job" ]] && continue
    jobInfo=($job)
    ID=${jobInfo[0]}
    priority=${jobPriority[$ID]}
    echo "$job       $priority"
done <<< "$whatsInQueue"
