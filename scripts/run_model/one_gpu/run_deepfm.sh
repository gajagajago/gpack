#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/deepfm${dup_arg}
touch $outfilename

python /mnt/code/profiler/models/recommendation/deepfm/main.py \
    --outfile=$outfilename