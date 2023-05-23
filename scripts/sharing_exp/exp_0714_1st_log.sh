#!/bin/bash

# 1. wav2vec2 start
log_script="./log_gpu_cpu_mem_1st.sh"

cur_model="deepfm"
tar_model="data2vec"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# cur_model="wav2vec2"

# tar_model="resnet"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="mobilenet"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="vgg"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="efficientnet"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="dlrm"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="deepfm"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="bert"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="transformer"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="graph_rnn"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="graph_wavenet"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="half_cheetah"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="atari"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="pong"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination

# tar_model="wav2vec2"
# model_combination=${cur_model}_${tar_model}
# mkdir -p ../results/${model_combination}
# timeout 1h $log_script $model_combination
