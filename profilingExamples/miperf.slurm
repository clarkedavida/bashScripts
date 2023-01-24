#!/bin/bash

#SBATCH -A lgt104_crusher
#SBATCH -J mrhs_bench
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH --mail-user=clarke.davida@gmail.com --mail-type=END,FAIL

source env.bash

srun -u -n 1 -c 1 --ntasks-per-node 1 --gpus-per-task=1 miperf profile -n Dslash -c  ./launch.bash
