#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/resnet50${dup_arg}
touch $outfilename

python /mnt/code/profiler/models/image_model/timm_code.py \
    /mnt/data/imagenet-pytorch/ \
    --model=resnet50 \
    --epochs=1 \
    --warmup-epochs=0 \
    --cooldown-epochs=0 \
    --lr=0.1 \
    --batch-size=256 \
    --weight-decay=0.0001 \
    --momentum=0.9 \
    --log-interval=1 \
    --output /mnt/code/profiler/models/image_model/output \
    > $outfilename 2>&1

date >> $outfilename