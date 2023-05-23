#!/bin/bash

# This is the entrypoint shell script when docker run scripts are run. 

python -m atari_py.import_roms /mnt/data/atari_data/ &> /dev/null # For RL profiling, import ROMs