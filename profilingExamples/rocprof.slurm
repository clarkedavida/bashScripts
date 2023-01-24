#!/bin/bash

#SBATCH -A lgt104_crusher
#SBATCH -J mrhs_bench
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH --mail-user=clarke.davida@gmail.com --mail-type=END,FAIL

source env.bash

#rocprof --stats --timestamp on ./launch.bash  
srun --gpus-per-task 1 -N 1 -n 1 ./wrapper.bash --hip-trace -i rocprofInput.txt --trace-start off ./launch.bash --log rocprofDSlash
