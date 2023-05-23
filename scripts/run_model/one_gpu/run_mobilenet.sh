#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/mobilenet${dup_arg}
touch $outfilename

python /mnt/code/profiler/models/image_model/timm_code.py \
    /mnt/data/imagenet-pytorch/ \
    --model=mobilenetv3_small_075 \
    --epochs=1 \
    --warmup-epochs=0 \
    --cooldown-epochs=0 \
    --lr=0.1 \
    --decay-epochs=3 \
    --decay-rate=0.01 \
    --batch-size=4096 \
    --weight-decay=1e-5 \
    --momentum=0.9 \
    --drop=0.8 \
    --model-ema \
    --model-ema-decay=0.9999 \
    --log-interval=1 \
    --output /mnt/code/profiler/models/image_model/output \
    > $outfilename 2>&1

date >> $outfilename