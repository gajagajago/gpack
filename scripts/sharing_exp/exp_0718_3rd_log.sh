#!/bin/bash

# 1. mobilenet start
log_script="./log_gpu_cpu_mem_3rd.sh"

# 1. efficientnet start
cur_model="efficientnet"

tar_model="dlrm"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="deepfm"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="bert"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# Pair
cur_model="dlrm"
tar_model="efficientnet"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="deepfm"
tar_model="efficientnet"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="bert"
tar_model="efficientnet"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination