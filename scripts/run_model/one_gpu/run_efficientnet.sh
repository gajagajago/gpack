#!/bin/bash

model_combination=$1
dup_arg=$2

/mnt/code/profiler/image_model/run_timm_one.sh /mnt/code/profiler/results/$model_combination/efficientnet${dup_arg} efficientnet_b3 8 