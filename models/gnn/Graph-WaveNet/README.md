# Graph WaveNet for Deep Spatial-Temporal Graph Modeling

This is the original pytorch implementation of Graph WaveNet in the following paper: 
[Graph WaveNet for Deep Spatial-Temporal Graph Modeling, IJCAI 2019] (https://arxiv.org/abs/1906.00121).  A nice improvement over GraphWavenet is presented by Shleifer et al. [paper](https://arxiv.org/abs/1912.07390) [code](https://github.com/sshleifer/Graph-WaveNet).



<p align="center">
  <img width="350" height="400" src=./fig/model.png>
</p>

## Requirements
- python 3
- see `requirements.txt`


## Data Preparation

### Step1: Download METR-LA and PEMS-BAY data from [Google Drive](https://drive.google.com/open?id=10FOTa6HXPqX8Pf5WRoRwcFnW9BrNZEIX) or [Baidu Yun](https://pan.baidu.com/s/14Yy9isAIZYdU__OYEQGa_g) links provided by [DCRNN](https://github.com/liyaguang/DCRNN).

### Step2: Process raw data 

```
# Create data directories
mkdir -p data/{METR-LA,PEMS-BAY}

# METR-LA
python generate_training_data.py --output_dir=data/METR-LA --traffic_df_filename=data/metr-la.h5

ex
```
python generate_training_data.py --output_dir=/mnt/data/graph_wavenet_data/METR-LA --traffic_df_filename=/mnt/data/graph_wavenet_data/metr-la.h5
```

# PEMS-BAY
python generate_training_data.py --output_dir=data/PEMS-BAY --traffic_df_filename=data/pems-bay.h5

ex
```
python generate_training_data.py --output_dir=/mnt/data/graph_wavenet_data/PEMS-BAY --traffic_df_filename=/mnt/data/graph_wavenet_data/pems-bay.h5
```

```
## Train Commands

- $epochs: Gave a large epochs to keep running. 
- $batch_time_output_file: File to log batch time (s/it)

```
python train.py \
  --gcn_bool \
  --adjtype doubletransition \
  --addaptadj \
  --randomadj \
  --epochs $epochs \
  --batch-time-output-file $batch-time-output-file
```


