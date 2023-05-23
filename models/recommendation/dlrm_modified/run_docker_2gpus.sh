sudo nvidia-docker run -ti --ipc=host --network=host \
  -v /cmsdata/hdd0/cmslab/stetstet/criteo_kaggle/:/mnt/input \
  -v /home/jaewoo/dlrm:/mnt/code -v /home/jaewoo/tensorboard_logs:/mnt/log --rm \
  -e NVIDIA_VISIBLE_DEVICES=0,1 \
  dlrm:0.0.0 bash
