#!/bin/bash

NUM_PROC=2

DATA_DIR=/mnt/data/roberta_data/wikitext-103
CONFIG_DIR=/mnt/code/profiler/models/language/roberta/config/pretraining

outfilename=/mnt/code/profiler/results/$model_combination/roberta${dup_arg}
touch $outfilename

# The default values are overwritten by values found in YAML files
# and then further overwritten by values provided through command line arguments.
fairseq-hydra-train \
    +common.log_file=$outfilename \
    common.log_interval=1 \
    common.log_format=simple \
    dataset.validate_interval=0 \
    +task.data=$DATA_DIR \
    distributed_training.distributed_world_size=$NUM_PROC \
    distributed_training.ddp_backend=no_c10d \
    --config-dir $CONFIG_DIR \
    --config-name base \