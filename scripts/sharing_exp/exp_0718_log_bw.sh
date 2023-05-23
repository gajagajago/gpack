#!/bin/bash

log_script="./log_mem_bandwidth.sh"

cur_model="atari"
tar_model="atari"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="atari"
tar_model="pong"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="pong"
tar_model="pong"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="pong"
tar_model="atari"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination