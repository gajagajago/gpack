outfilename=$1
modelname=$2
batchsize=${3:-32}

echo $$

# (timeout 5m nvidia-smi -i 0 --query-gpu=utilization.gpu --format=csv >> gpu_util_$outfilename.csv -l 1;)&
# (timeout 5m dstat -tfvn --output cpu_memory_$outfilename.csv)&
# (timeout 5m /mnt/code/pcm/build/bin/pcm-memory 1 -csv=4_mem_bw_$outfilename.csv)&
touch $outfilename

python /mnt/code/profiler/models/image_model/timm_code.py /mnt/data/imagenet-pytorch/ \
 --epochs=1 --warmup-epochs=0 --lr=0.05 --warmup-lr=0.05 \
 --log-interval=1 \
 --model=$modelname \
 --batch-size=$batchsize \
 --output /mnt/code/profiler/models/image_model/output \
 --cooldown-epochs=0 \
 > $outfilename 2>&1

date >> $outfilename
