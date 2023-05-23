#!/bin/bash

# 1. pong start
log_script="./log_gpu_cpu_mem_1st.sh"
cur_model="pong"

tar_model="bert"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination