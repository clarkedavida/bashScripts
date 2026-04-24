#!/bin/bash

whatsInQueue=$(squeue --format="%.14i %.9P %.14j %.8u %.10T %.10M %.9l %.6D %R" --me --noheader)
whatsMyPrio=$(sprio -u "$(whoami)" --noheader)

declare -A jobPriority

# Collect priority
while read -r job; do
    [[ -z "$job" ]] && continue
    jobInfo=($job)
    ID=${jobInfo[0]}
    prio=${jobInfo[3]}
    jobPriority[$ID]=$prio
done <<< "$whatsMyPrio"

echo " JOBID PARTITION           NAME     USER      STATE       TIME TIME_LIMI  NODES NODELIST(REASON)  PRIORITY"

# Process jobs and print with priority
while read -r job; do
    [[ -z "$job" ]] && continue
    jobInfo=($job)
    ID=${jobInfo[0]}
    priority=${jobPriority[$ID]}
    echo "$job       $priority"
done <<< "$whatsInQueue"
