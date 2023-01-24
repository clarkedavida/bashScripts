#!/usr/bin/bash

if [[ -n ${OMPI_COMM_WORLD_RANK+z} ]]; then
    # mpich
    export MPI_RANK=${OMPI_COMM_WORLD_RANK}
elif [[ -n ${MV2_COMM_WORLD_RANK+z} ]]; then
    # ompi
    export MPI_RANK=${MV2_COMM_WORLD_RANK}
elif [[ -n ${MPICH_COMM_WORLD_RANK+z} ]]; then
    export MPI_RANK=${MPICH_COMM_WORLD_RANK}
fi
args="$*"
pid="$$"
outdir="rank_${pid}_${MPI_RANK}"
outfile="results_${pid}_${MPI_RANK}.csv"
eval "rocprof -d ${outdir} -o ${outdir}/${outfile} $*"
