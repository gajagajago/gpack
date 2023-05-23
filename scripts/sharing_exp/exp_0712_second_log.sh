#!/bin/bash

# 1. atari start
log_script="./log_gpu_cpu_mem_2nd.sh"
cur_model="atari"

tar_model="bert"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="transformer"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="graph_rnn"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="half_cheetah"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="atari"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

tar_model="pong"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination
