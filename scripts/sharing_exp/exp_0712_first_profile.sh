#!/bin/bash

# 1. pong start
run_cur_script="/mnt/code/profile/scripts/run_pong.sh"
cur_model="pong"

run_tar_script="/mnt/code/profile/scripts/run_bert.sh"
model_combination="${cur_model}_bert"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)