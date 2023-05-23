container_name="section_one"
nvidia_visible_devices=0
cpu_start=0
cpu_end=$((0+9))

# hardware constraints
C=$(seq -s, $counter $cpu_start $cpu_end)
M=40g
W=20g

echo "GPUs: $nvidia_visible_devices CPUs: $C Memory: $M Bandwidth: $W"

nvidia-docker run -ti --rm --ipc=host --network=host --name $container_name\
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
  --entrypoint="/mnt/code/profiler/scripts/docker/entrypoints/interactive-entrypoint.sh" \
  gajagajago/dlcm_profile:multi_gpu