#!/bin/bash

DATA_DIR=/mnt/data/roberta_data/wikitext-103
CONFIG_DIR=/mnt/code/profiler/models/language/roberta/config/pretraining

outfilename=/mnt/code/profiler/results/$model_combination/roberta${dup_arg}
touch $outfilename

fairseq-hydra-train \
    +common.log_file=$outfilename \
    common.log_interval=1 \
    common.log_format=simple \
    dataset.validate_interval=0 \
    +task.data=$DATA_DIR \
    --config-dir $CONFIG_DIR \
    --config-name base \
