#!/bin/bash

model_combination=$1
dup_arg=$2

{ python /mnt/code/profiler/language/bert/main.py; } 2> /mnt/code/profiler/results/$model_combination/bert${dup_arg}