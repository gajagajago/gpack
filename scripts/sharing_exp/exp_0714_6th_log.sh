#!/bin/bash

log_script="./log_gpu_cpu_mem_6th.sh"

# 1. transformer start
cur_model="wav2vec2"
tar_model="data2vec"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. graph_rnn start
# cur_model="graph_rnn"
# tar_model="data2vec"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. graph_wavenet start
# cur_model="graph_wavenet"
# tar_model="data2vec"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. half_cheetah start
# cur_model="half_cheetah"
# tar_model="data2vec"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. atari start
# cur_model="atari"
# tar_model="data2vec"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. pong start
# cur_model="pong"
# tar_model="data2vec"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. data2vec start
# cur_model="data2vec"
# tar_model="data2vec"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination


# # 1. half_cheetah start
# cur_model="half_cheetah"
# tar_model="wav2vec2"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. atari start
# cur_model="atari"
# tar_model="wav2vec2"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# # 1. pong start
# cur_model="pong"
# tar_model="wav2vec2"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination