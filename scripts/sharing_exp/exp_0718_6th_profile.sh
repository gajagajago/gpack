#!/bin/bash

cur_dup_arg="_0718"
tar_dup_arg="_0718"

# 1. graph_rnn start
cur_model="graph_rnn"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"

tar_model="atari"
run_tar_script="/mnt/code/profile/scripts/run_${tar_model}.sh"
model_combination="${cur_model}_${tar_model}"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 2. half_cheetah start
cur_model="half_cheetah"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"

tar_model="atari"
run_tar_script="/mnt/code/profile/scripts/run_${tar_model}.sh"
model_combination="${cur_model}_${tar_model}"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# Pair
cur_model="atari"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"

tar_model="graph_rnn"
run_tar_script="/mnt/code/profile/scripts/run_${tar_model}.sh"
model_combination="${cur_model}_${tar_model}"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# Pair
cur_model="atari"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"

tar_model="half_cheetah"
run_tar_script="/mnt/code/profile/scripts/run_${tar_model}.sh"
model_combination="${cur_model}_${tar_model}"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)