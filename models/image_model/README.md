# Profiling Image Models

- supports GPU util, CPU util, memory util

- Intended to be run at elsa-08 (data is at elsa-08:/cmsdata/hdd2/imagenet-pytorch/)

```bash
1. navigate to ~/dlcm/profiling/
2. launch docker container
./docker_launch.sh
3. profile
3-a. profile single model
./run_timm_one.sh $(outputfile_name) $(model_name) $(batch_size)
3-b. profile all
./profile_all.sh

# if this is your first time running the scripts
# chmod 700 docker_launch.sh
# or
# bash docker_launch.sh
...

```
