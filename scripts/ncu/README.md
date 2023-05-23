# NCU Profiler

The only script, ncu_profile.sh launches the ncu profiler attached job on a docker container.  

## How to run
- name: Name of the job. Will be used to create the docker container name.
- code: Relative path to the code from `$DLCM_PATH`, with its command line arguments.
- nvidia_visible_devices: GPU indices to allocate to the container.
- cpus_start: Starting indexs of the CPUs to allocate. 10 CPUs will be allocated per GPU.
- util_tag: Relative path from `$DLCM_PATH` to the final util_tag.csv.
- logger_dir: Relative path from `$DLCM_PATH` to the logger directory. Will soon be deprecated and replaced by the container name.
```
python profiler/scripts/run_profile/run_profile.py \
--name resnet50 \
--code profiler/scripts/run_model/one_gpu/run_resnet.sh tmp/resnet50 \
--nvidia_visible_devices 0 \
--cpus_start 0 \
--util_tag profiler/results/tmp/resnet50/util_tag.csv \
--logger_dir profiler/results/tmp/resnet50
```