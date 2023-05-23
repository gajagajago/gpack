#!/bin/bash

NUM_PROC=2

model_combination=$1
dup_arg=$2

outfilename=/mnt/code/profiler/results/$model_combination/dlrm${dup_arg}
touch $outfilename

dlrm_pt_bin="/mnt/code/profiler/models/recommendation/dlrm_modified/dlrm_s_pytorch_all_gpus.py"

# torch ddp configs
master_port=$(python /mnt/code/profiler/scripts/common/random_port_generator.py)

python3 -m torch.distributed.launch --nproc_per_node=$NUM_PROC --master_port=$master_port \
  $dlrm_pt_bin \
  --arch-sparse-feature-size=16 --arch-mlp-bot="13-512-256-64-16" --arch-mlp-top="512-256-1" \
  --data-generation=dataset --data-set=kaggle --raw-data-file=/mnt/data/dlrm_data/criteo_kaggle/train.txt \
  --processed-data-file=/mnt/data/dlrm_data/criteo_kaggle/kaggleAdDisplayChallenge_processed.npz \
  --loss-function=bce --round-targets=True --learning-rate=0.1 --mini-batch-size=128 \
  --print-freq=1024 --print-time --test-mini-batch-size=16384 --test-num-workers=16 \
  --nepochs=1 --use-gpu \
  --dist-backend=nccl \
  > $outfilename 2>&1