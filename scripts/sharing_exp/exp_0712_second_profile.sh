#!/bin/bash

# 1. atari start
run_cur_script="/mnt/code/profile/scripts/run_atari.sh"
cur_model="atari"

run_tar_script="/mnt/code/profile/scripts/run_bert.sh"
model_combination="${cur_model}_bert"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_transformer.sh"
model_combination="${cur_model}_transformer"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_graph_rnn.sh"
model_combination="${cur_model}_graph_rnn"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_half_cheetah.sh"
model_combination="${cur_model}_half_cheetah"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_atari.sh"
model_combination="${cur_model}_half_atari"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_pong.sh"
model_combination="${cur_model}_pong"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)