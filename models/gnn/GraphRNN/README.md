# GraphRNN: Generating Realistic Graphs with Deep Auto-regressive Model

## Installation
Install the requirements. 
```zsh
apt-get install --reinstall build-essential # for pyemd
pip install -r requirements.txt
```

## Set CUDA GPU
CUDA device is set to 0 as default. Change this field in `args.py` to match your desired GPU number.

## Test run
```zsh
python main.py  
```