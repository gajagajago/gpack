# ClusterGCN

## Installation
```zsh
pip install -r requirements.txt
```

## Options
<p align="justify">
The training of a ClusterGCN model is handled by the `src/main.py` script which provides the following command line arguments.</p>

#### Model options
```
  --seed                INT     Random seed.                   Default is 42.
  --epochs              INT     Number of training epochs.     Default is 200.
  --learning-rate       FLOAT   Adam learning rate.            Default is 0.01.
```
### Test run
```zsh
python src/main.py
```
