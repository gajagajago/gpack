#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/wav2vec2${dup_arg}
touch $outfilename

fairseq-hydra-train \
    +task.data=/mnt/data/wav2vec2_data/data \
    +common.log_file=$outfilename \
    --config-dir /mnt/code/profiler/models/speech/wav2vec2/config/pretraining \
    --config-name wav2vec2_base_librispeech