# Container utilization logger
# This script will be called from the profiler launcher and log gpu, cpu, memory utilization of the container

# For the experiment, we differentiate subdirectory path to store the results from container name
# Ex. subdirectory path: single_run/resnet50
#     container name: resnet50_1661228615
# However, it should be aligned in the actual deployment version. 
# TODO: Align directory configurations to actual version when deploying the service

# Experiment version
# HOST_RESULT_PATH=$DLCM_PATH/profiler/results

container_name=$1
gpu_indices=$2 # ex. 1,2
subdirectory_path=$3 # ex. profiler/results/single_run/resnet50

dir=$DLCM_PATH/$subdirectory_path
gpu_util=$dir/${container_name}_gpu_util.csv
cpu_util=$dir/${container_name}_cpu_util.csv
mem_util=$dir/${container_name}_mem_util.csv

# Actual version
# HOST_RESULT_PATH=
# 
# container_name=$1
# gpu_indices=$2 # ex. 1,2

# dir=$HOST_RESULT_PATH/$container_name
# gpu_util=$dir/gpu_util.csv
# cpu_util=$dir/cpu_util.csv
# mem_util=$dir/mem_util.csv

echo $$

mkdir -p $dir

echo "Start writing logs to $dir"

# Check if file already exists
if [ -f "$gpu_util" ] || [ -f "$cpu_util" ] || [ -f "$mem_util" ]; then
    echo "Existing result file may be overrided. Try again after removing the existing result file."
    exit
fi

# Log system metrics
(timeout 5m nvidia-smi -i $gpu_indices --query-gpu=utilization.gpu --format=csv >> $gpu_util -l 1;)&
(timeout 5m docker stats $container_name --format "{{.CPUPerc}}" >> $cpu_util) &
(timeout 5m docker stats $container_name --format "{{.MemPerc}}" >> $mem_util)

# Format output
HOST_PARSER_DIRECTORY=$DLCM_PATH/profiler/scripts/parser
python $HOST_PARSER_DIRECTORY/trim_csv.py $cpu_util
python $HOST_PARSER_DIRECTORY/trim_csv.py $mem_util
