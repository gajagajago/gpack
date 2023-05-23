log_cur_script="./log_mem_bandwidth.sh"

cur_model="mobilenet"
timeout 1h $log_cur_script $cur_model

cur_model="vgg"
timeout 1h $log_cur_script $cur_model

cur_model="efficientnet"
timeout 1h $log_cur_script $cur_model

cur_model="graph_wavenet"
timeout 1h $log_cur_script $cur_model

cur_model="atari"
timeout 1h $log_cur_script $cur_model

cur_model="pong"
timeout 1h $log_cur_script $cur_model

cur_model="wav2vec2"
timeout 1h $log_cur_script $cur_model

cur_model="data2vec"
timeout 1h $log_cur_script $cur_model