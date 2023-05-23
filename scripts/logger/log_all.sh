#!/bin/bash

section=$1

first_models=("dlrm")
second_models=("mobilenet") 
third_models=("resnet50")
fourth_models=("bert")
fifth_models=("graphrnn")
sixth_models=("half_cheetah") 

if [ $section -eq 1 ]
then
    current_models=$first_models
    log_script="./log_gpu_cpu_mem_1st.sh"
elif [ $section -eq 2 ]
then
    current_models=$second_models
    log_script="./log_gpu_cpu_mem_2nd.sh"
elif [ $section -eq 3 ]
then
    current_models=$third_models
    log_script="./log_gpu_cpu_mem_3rd.sh"
elif [ $section -eq 4 ]
then
    current_models=$fourth_models
    log_script="./log_gpu_cpu_mem_4th.sh"
elif [ $section -eq 5 ]
then
    current_models=$fifth_models
    log_script="./log_gpu_cpu_mem_5th.sh"
else
    current_models=$sixth_models
    log_script="./log_gpu_cpu_mem_6th.sh"
fi

all_models=("deepfm" "transformer" "atari" "pong")

for cur_model in "${current_models[@]}"; do
for tar_model in "${all_models[@]}"; do

model_combination=${cur_model}_${tar_model}
echo "Logging $model_combination"
echo "[log_script] $log_script"
mkdir -p ../results/${model_combination}
timeout 1h $log_script $model_combination

done
done
