#!/bin/bash

log_script="./log_gpu_cpu_mem_6th.sh"

# 1. graph_rnn start
cur_model="graph_rnn"

tar_model="atari"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. half_cheetah start
cur_model="half_cheetah"

tar_model="atari"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# Pair
cur_model="atari"
tar_model="graph_rnn"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="atari"
tar_model="half_cheetah"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination