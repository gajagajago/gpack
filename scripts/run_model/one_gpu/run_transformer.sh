#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/transformer${dup_arg}
touch $outfilename

/mnt/code/profiler/models/language/transformer/train.sh $outfilename
