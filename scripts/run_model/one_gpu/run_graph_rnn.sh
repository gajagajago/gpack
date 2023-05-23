#!/bin/bash

model_combination=$1
dup_arg=$2

python /mnt/code/profiler/gnn/GraphRNN/main.py /mnt/code/profiler/results/$model_combination/graphrnn${dup_arg}