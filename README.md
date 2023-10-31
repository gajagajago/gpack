# GPack

We investigate the resource usage characteristics of DL jobs through fine-grained profiling and analyze contention sensitivity of each job.

## 1. How to build
Register current user to the docker group. This will enable use of `docker` command without `sudo`.  
```zsh
sudo groupadd docker # This will create docker group if not exist.
sudo gpasswd -a $USER docker
newgrp docker
```
This would have added your user to the docker group. Check it with the following command. 
```zsh
id -Gn
```

## 2. How to run
Run docker container image. The attached container will be allocated limited hardware resources. `$nth` is the index of the target GPU. 
```zsh
./docker_launch_${nth}.sh 

# e.g) ./docker_launch.sh $GPACK_PATH/profiler/gnn/ClusterGCN $GPACK_PATH/profiler/gnn/GraphRNN 0 clustergcn_graphrnn 0
```
(Optional) To enable MPS for co-location profiling, run the following command inside the docker container. This command is included in `entrypoint.sh`, so the containers run by `docker_launch_*.sh` have MPS enabled as default.
```zsh
nvidia-cuda-mps-control -d
```

In the docker container, run jobs in the background. 
```zsh
timeout 1h run_${job1}.sh &
timeout 1h run_${job2}.sh &
```

From the host terminal, profile the container for resource usage. Run the following command inside `/scripts`. The following command will profile the container for 1 hour while logging every second to `/results/$container/`. 
```zsh 
./log_gpu_cpu_mem.sh $container $gpu_idx
```

## Citation
```
@article{ryu2022우수논문,
  title={[우수논문] Investigating Contention Sensitivity of DL Training Workloads in Shared GPU Cluster},
  author={Ryu, Junyeol and Chun, Byung-Gon},
  journal={한국정보과학회 학술발표논문집},
  pages={1184--1186},
  year={2022}
}
```
