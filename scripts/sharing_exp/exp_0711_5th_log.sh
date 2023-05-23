#!/bin/bash

log_script="./log_gpu_cpu_mem_5th.sh"

# 1. transformer start
cur_model="transformer"

tar_model="bert"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 2. graphrnn start
cur_model="graph_rnn"

tar_model="mobilenet"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="vgg"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="efficientnet"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="bert"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination