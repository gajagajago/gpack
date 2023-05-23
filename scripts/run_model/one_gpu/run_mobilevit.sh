#!/bin/bash

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/mobilevit${dup_arg}
touch $outfilename

python /mnt/code/profiler/models/image_model/timm_code.py \
    /mnt/data/imagenet-pytorch/ \
    --model=mobilevit_s \
    --epochs=300 \
    --warmup-epochs=0 \
    --cooldown-epochs=0 \
    --lr=0.0002 \
    --batch-size=1024 \
    --weight-decay=0.01 \
    --log-interval=1 \
    --output /mnt/code/profiler/models/image_model/output \
    > $outfilename 2>&1

date >> $outfilename