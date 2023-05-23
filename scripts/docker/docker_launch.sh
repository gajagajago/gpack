container_name=$1
nvidia_visible_devices=$2
cpu_start=$3
cpu_end=$(($cpu_start+9))

entrypoint=$4

# hardware constraints
C=$(seq -s, $counter $cpu_start $cpu_end)
M=40g
W=20g

echo "GPUs: $nvidia_visible_devices CPUs: $C Memory: $M Bandwidth: $W"
echo "entrypoint: $entrypoint"

nvidia-docker run -d --ipc=host --network=host --name $container_name\
  --cpuset-cpus=$C \
  --memory=$M \
  --device-read-bps /dev/mem:$W \
  --device-write-bps /dev/mem:$W \
  -v $HOME/dlcm:/mnt/code \
  -v /usr/local/NVIDIA-Nsight-Compute:/usr/local/NVIDIA-Nsight-Compute \
  -v /cmsdata/ssd0/cmslab/dlcm_data:/mnt/data \
  -v /cmsdata/ssd0/cmslab/imagenet-data:/mnt/data/imagenet-data \
  -v /cmsdata/ssd0/cmslab/imagenet-pytorch:/mnt/data/imagenet-pytorch \
  --tmpfs /mnt/tmp \
  -e NVIDIA_VISIBLE_DEVICES=$nvidia_visible_devices \
  --entrypoint=$entrypoint \
  gajagajago/dlcm_profile:multi_gpu