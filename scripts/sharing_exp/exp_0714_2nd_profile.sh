#!/bin/bash

# 1. graph_wavenet start
run_cur_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
cur_model="graph_wavenet"

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

run_tar_script="/mnt/code/profile/scripts/run_deepfm.sh"
model_combination="${cur_model}_deepfm"
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

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
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
model_combination="${cur_model}_atari"
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

# 1. resnet start
run_cur_script="/mnt/code/profile/scripts/run_resnet.sh"
cur_model="resnet"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. mobilenet start
run_cur_script="/mnt/code/profile/scripts/run_mobilenet.sh"
cur_model="mobilenet"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. vgg start
run_cur_script="/mnt/code/profile/scripts/run_vgg.sh"
cur_model="vgg"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. efficientnet start
run_cur_script="/mnt/code/profile/scripts/run_efficientnet.sh"
cur_model="efficientnet"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. dlrm start
run_cur_script="/mnt/code/profile/scripts/run_dlrm.sh"
cur_model="dlrm"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. deepfm start
run_cur_script="/mnt/code/profile/scripts/run_deepfm.sh"
cur_model="deepfm"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. bert start
run_cur_script="/mnt/code/profile/scripts/run_bert.sh"
cur_model="bert"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. transformer start
run_cur_script="/mnt/code/profile/scripts/run_transformer.sh"
cur_model="transformer"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. graph_rnn start
run_cur_script="/mnt/code/profile/scripts/run_graph_rnn.sh"
cur_model="graph_rnn"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. half_cheetah start
run_cur_script="/mnt/code/profile/scripts/run_half_cheetah.sh"
cur_model="half_cheetah"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. atari start
run_cur_script="/mnt/code/profile/scripts/run_atari.sh"
cur_model="atari"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

# 1. pong start
run_cur_script="/mnt/code/profile/scripts/run_pong.sh"
cur_model="pong"

run_tar_script="/mnt/code/profile/scripts/run_graph_wavenet.sh"
model_combination="${cur_model}_graph_wavenet"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

