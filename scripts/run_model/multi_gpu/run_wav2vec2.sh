#!/bin/bash

NUM_PROC=2

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/wav2vec2${dup_arg}
touch $outfilename

# The default values are overwritten by values found in YAML files
# and then further overwritten by values provided through command line arguments.
fairseq-hydra-train \
    +task.data=/mnt/data/wav2vec2_data/data \
    +common.log_file=$outfilename \
    distributed_training.distributed_world_size=$NUM_PROC \
    --config-dir /mnt/code/profiler/models/speech/wav2vec2/config/pretraining \
    --config-name wav2vec2_base_librispeech \