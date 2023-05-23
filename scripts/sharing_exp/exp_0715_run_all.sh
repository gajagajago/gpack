cur_dup_arg="erase"

cur_model="mobilenet"
model_combination="single_run/$cur_model"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="vgg"
model_combination="single_run/$cur_model"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="efficientnet"
model_combination="single_run/$cur_model"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="graph_wavenet"
model_combination="single_run/$cur_model"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="atari"
model_combination="single_run/$cur_model"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="pong"
model_combination="single_run/$cur_model"
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="wav2vec2"
model_combination="single_run/$cur_model"
model_combination=$cur_model
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)

cur_model="data2vec"
model_combination="single_run/$cur_model"
model_combination=$cur_model
run_cur_script="/mnt/code/profile/scripts/run_${cur_model}.sh"
(timeout 1h $run_cur_script $model_combination $cur_dup_arg)