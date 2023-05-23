#!/bin/bash

log_script="./log_gpu_cpu_mem_5th.sh"

# 1. dlrm start
cur_model="dlrm"

tar_model="data2vec"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. deepfm start
cur_model="deepfm"

tar_model="data2vec"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. graph_rnn start
cur_model="graph_rnn"

tar_model="half_cheetah"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# Pair
cur_model="data2vec"
tar_model="dlrm"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="data2vec"
tar_model="deepfm"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

cur_model="half_cheetah"
tar_model="graph_rnn"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination