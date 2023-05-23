outfilename=$1
modelname=$2
batchsize=${3:-32}

echo $$

# (timeout 5m nvidia-smi -i 0,1 --query-gpu=utilization.gpu --format=csv >> gpu_util_$outfilename.csv -l 1;)&
# (timeout 5m dstat -tfvn --output cpu_memory_$outfilename.csv)&
# (timeout 5m /mnt/code/pcm/build/bin/pcm-memory 1 -csv=4_mem_bw_$outfilename.csv)&

timeout 1m bash /mnt/code/train_distributed.sh 3 /mnt/data/ \
 --epochs=1 --warmup-epochs=1 --lr=0.05 --warmup-lr=0.05 \
 --log-interval=1 \
 --batch-size=$batchsize --cooldown-epochs=0 > /mnt/code/$outfilename 2>&1

date >> /mnt/code/$outfilename
