#!/bin/bash

# 1. data2vec start
log_script="./log_gpu_cpu_mem_5th.sh"
# cur_model="data2vec"

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


# 1. resnet start
cur_model="resnet"
tar_model="wav2vec2"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. mobilenet start
cur_model="mobilenet"
tar_model="wav2vec2"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. vgg start
cur_model="vgg"
tar_model="wav2vec2"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

# 1. efficientnet start
cur_model="efficientnet"
tar_model="wav2vec2"
model_combination=${cur_model}_${tar_model}
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination