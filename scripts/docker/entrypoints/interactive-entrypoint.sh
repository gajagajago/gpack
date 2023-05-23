#!/bin/bash

# This is the entrypoint shell script when docker run scripts are run. 

nvidia-cuda-mps-control -d # Enable MPS
python -m atari_py.import_roms /mnt/data/atari_data/ &> /dev/null # For RL profiling, import ROMs
/bin/bash # Open bash shell