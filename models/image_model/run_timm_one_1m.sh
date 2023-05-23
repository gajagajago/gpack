outfilename=$1
modelname=$2
batchsize=${3:-32}

echo $$

# (timeout 1m nvidia-smi -i 0 --query-gpu=utilization.gpu --format=csv >> gpu_util_$outfilename.csv -l 1;)&
# (timeout 1m dstat -tfvn --output cpu_memory_$outfilename.csv)&
# (timeout 1m /mnt/code/pcm/build/bin/pcm-memory 1 -csv=4_mem_bw_$outfilename.csv)&

timeout 1m python /mnt/code/timm_code.py /mnt/data/ \
 --epochs=1 --warmup-epochs=1 --lr=0.05 --warmup-lr=0.05 \
 --log-interval=1 \
 --model=$modelname \
 --batch-size=$batchsize --cooldown-epochs=0 > /mnt/code/$outfilename 2>&1

date >> /mnt/code/$outfilename
