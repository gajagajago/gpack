#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/data2vec${dup_arg}
touch $outfilename

python /mnt/code/profiler/models/speech/fairseq/fairseq_cli/hydra_train.py -m \
    --config-dir /mnt/code/profiler/models/speech/data2vec/config/audio/pretraining \
    --config-name base_librispeech \
    task.data=/mnt/data/wav2vec2_data/data \
    common.log_file=$outfilename \
    common.user_dir=/mnt/code/profiler/models/speech/fairseq/examples/data2vec