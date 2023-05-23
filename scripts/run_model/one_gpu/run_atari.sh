#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/atari${dup_arg}
touch $outfilename

RAY_USE_MULTIPROCESSING_CPU_COUNT=1 rllib train -f /mnt/code/profiler/models/rl/atari-ppo.yaml >> $outfilename