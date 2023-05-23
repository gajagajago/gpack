#!/bin/bash
NUM_PROC=$1
shift
<<<<<<< HEAD
python3 -m torch.distributed.launch --nproc_per_node=$NUM_PROC --master_port 1 timm_code.py "$@"
=======
python3 -m torch.distributed.launch --nproc_per_node=$NUM_PROC timm_code.py "$@"
>>>>>>> 75548025760d987026817e1cb63120d7e11212e6
