#!/bin/bash

run_cur_script="/mnt/code/profile/scripts/run_mobilenet.sh"

run_tar_script="/mnt/code/profile/scripts/run_resnet.sh"
model_combination="mobilenet_resnet"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_mobilenet.sh"
model_combination="mobilenet_mobilenet"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_vgg.sh"
model_combination="mobilenet_vgg"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_efficientnet.sh"
model_combination="mobilenet_efficientnet"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_deepfm.sh"
model_combination="mobilenet_deepfm"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_transformer.sh"
model_combination="mobilenet_transformer"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_atari.sh"
model_combination="mobilenet_atari"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_tar_script="/mnt/code/profile/scripts/run_pong.sh"
model_combination="mobilenet_pong"
mkdir -p /mnt/code/profile/results/${model_combination}
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)