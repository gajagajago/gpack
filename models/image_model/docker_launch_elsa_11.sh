sudo nvidia-docker run --privileged -ti --rm --ipc=host --network=host \
        -v $(pwd):/mnt/code \
  -v /cmsdata/ssd0/cmslab/imagenet-pytorch/:/mnt/data \
  -e NVIDIA_VISIBLE_DEVICES=0 \
  maeng9584/timm_docker:dstat bash
