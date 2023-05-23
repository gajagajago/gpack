#!/bin/bash

# 1. transformer start
run_cur_script="/mnt/code/profile/scripts/run_wav2vec2.sh"
cur_model="wav2vec2"

run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
model_combination="${cur_model}_data2vec"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. graph_rnn start
# run_cur_script="/mnt/code/profile/scripts/run_graph_rnn.sh"
# cur_model="graph_rnn"

# run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
# model_combination="${cur_model}_data2vec"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. graph_wavenet start
# run_cur_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
# cur_model="graph_wavenet"

# run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
# model_combination="${cur_model}_data2vec"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. half_cheetah start
# run_cur_script="/mnt/code/profile/scripts/run_half_cheetah.sh"
# cur_model="half_cheetah"

# run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
# model_combination="${cur_model}_data2vec"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. atari start
# run_cur_script="/mnt/code/profile/scripts/run_atari.sh"
# cur_model="atari"

# run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
# model_combination="${cur_model}_data2vec"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. pong start
# run_cur_script="/mnt/code/profile/scripts/run_pong.sh"
# cur_model="pong"

# run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
# model_combination="${cur_model}_data2vec"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. data2vec start
# run_cur_script="/mnt/code/profile/scripts/run_data2vec.sh"
# cur_model="data2vec"

# run_tar_script="/mnt/code/profile/scripts/run_data2vec.sh"
# model_combination="${cur_model}_data2vec"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)


# # 1. half_cheetah start
# run_cur_script="/mnt/code/profile/scripts/run_half_cheetah.sh"
# cur_model="half_cheetah"

# run_tar_script="/mnt/code/profile/scripts/run_wav2vec2.sh"
# model_combination="${cur_model}_wav2vec2"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. atari start
# run_cur_script="/mnt/code/profile/scripts/run_atari.sh"
# cur_model="atari"

# run_tar_script="/mnt/code/profile/scripts/run_wav2vec2.sh"
# model_combination="${cur_model}_wav2vec2"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# # 1. pong start
# run_cur_script="/mnt/code/profile/scripts/run_pong.sh"
# cur_model="pong"

# run_tar_script="/mnt/code/profile/scripts/run_wav2vec2.sh"
# model_combination="${cur_model}_wav2vec2"
# mkdir -p /mnt/code/profile/results/${model_combination}
# echo $model_combination
# (timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
# (timeout 1h $run_tar_script $model_combination $tar_dup_arg)