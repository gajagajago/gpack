#!/bin/bash

# 1. resnet start
run_cur_script="/mnt/code/profile/scripts/run_resnet.sh"
cur_model="resnet"

run_tar_script="/mnt/code/profile/scripts/run_bert.sh"
model_combination="${cur_model}_bert"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 2. mobilenet start
run_cur_script="/mnt/code/profile/scripts/run_mobilenet.sh"
cur_model="mobilenet"

run_tar_script="/mnt/code/profile/scripts/run_resnet.sh"
model_combination="${cur_model}_resnet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_mobilenet.sh"
model_combination="${cur_model}_mobilenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_vgg.sh"
model_combination="${cur_model}_vgg"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_efficientnet.sh"
model_combination="${cur_model}_efficientnet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_dlrm.sh"
model_combination="${cur_model}_dlrm"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_bert.sh"
model_combination="${cur_model}_bert"
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