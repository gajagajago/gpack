#!/bin/bash

NUM_PROC=2

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/transformer${dup_arg}
touch $outfilename

# fairseq-train binds free port by default
# Thus, no need to explicitly search for a free master port

CUDA_VISIBLE_DEVICES=$(seq -s , 0 $(($NUM_PROC-1)))

CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES /mnt/code/profiler/models/language/transformer/train.sh $outfilename
