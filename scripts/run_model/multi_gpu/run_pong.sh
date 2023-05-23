#!/bin/bash

NUM_PROC=2

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/pong${dup_arg}
touch $outfilename

RAY_USE_MULTIPROCESSING_CPU_COUNT=1 rllib train -f /mnt/code/profiler/models/rl/multi_gpu/$NUM_PROC/pong-ppo.yaml >> $outfilename