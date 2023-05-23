cur_dup_arg="_erase_0718"
tar_dup_arg="_erase_0718"

run_cur_script="/mnt/code/profile/scripts/run_atari.sh"
cur_model="atari"

run_tar_script="/mnt/code/profile/scripts/run_atari.sh"
model_combination="${cur_model}_atari"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_cur_script="/mnt/code/profile/scripts/run_atari.sh"
cur_model="atari"

run_tar_script="/mnt/code/profile/scripts/run_pong.sh"
model_combination="${cur_model}_pong"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_cur_script="/mnt/code/profile/scripts/run_pong.sh"
cur_model="pong"

run_tar_script="/mnt/code/profile/scripts/run_pong.sh"
model_combination="${cur_model}_pong"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)

run_cur_script="/mnt/code/profile/scripts/run_pong.sh"
cur_model="pong"

run_tar_script="/mnt/code/profile/scripts/run_atari.sh"
model_combination="${cur_model}_atari"
mkdir -p /mnt/code/profile/results/${model_combination}
echo $model_combination
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)&
(timeout 1h $run_tar_script $model_combination $tar_dup_arg)