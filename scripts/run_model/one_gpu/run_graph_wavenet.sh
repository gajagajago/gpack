#!/bin/bash

model_combination=$1
dup_arg=$2

python /mnt/code/profiler/gnn/Graph-WaveNet/train.py \
    --gcn_bool \
    --adjtype doubletransition \
    --addaptadj  \
    --randomadj \
    --epochs 1000000 \
    --batch_time_output_file /mnt/code/profiler/results/$model_combination/graph_wavenet${dup_arg}