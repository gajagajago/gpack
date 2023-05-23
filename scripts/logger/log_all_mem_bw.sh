#!/bin/bash

# This shell script logs memory bandwidth of MPS sets on 1 GPU sectopm
# Logging of each set runs for 10 min

current_models=("resnet50" "graphrnn" "dlrm" "half_cheetah" "bert")
all_models=("resnet50" "graphrnn" "dlrm" "half_cheetah" "bert")

log_script = "./log_mem_bandwidth.sh"

for cur_model in "${current_models[@]}"; do
for tar_model in "${all_models[@]}"; do

model_combination=${cur_model}_${tar_model}
echo "Running $model_combination." 
echo "[log_script] $log_script"
mkdir -p ../profiler/results/${model_combination}

timeout 10m "./log_mem_bandwidth.sh" $model_combination

done
done
