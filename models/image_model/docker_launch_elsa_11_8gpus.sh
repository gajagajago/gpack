sudo nvidia-docker run --privileged -ti --rm --ipc=host --network=host \
        -v $(pwd):/mnt/code \
  -v /cmsdata/ssd0/cmslab/imagenet-pytorch/:/mnt/data \
  maeng9584/timm_docker:dstat bash
