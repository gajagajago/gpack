#!/bin/bash

model_combination=$1
dir=../results/$model_combination
mem_bw_util=$dir/${model_combination}_mem_bw_util.csv

mkdir -p $dir
sudo modprobe msr
sudo ../pcm/build/bin/pcm-memory 1 -csv=$mem_bw_util