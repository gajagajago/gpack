container="section_three"
model_combination=$1
dir=../results/$model_combination
gpu_util=$dir/${model_combination}_gpu_util.csv
cpu_util=$dir/${model_combination}_cpu_util.csv
mem_util=$dir/${model_combination}_mem_util.csv

echo $$

mkdir -p $dir

echo "Start writing logs to $dir"

# Check if file already exists
if [ -f "$gpu_util" ] || [ -f "$cpu_util" ] || [ -f "$mem_util" ]; then
    echo "Existing result file may be overrided. Try again after removing the existing result file."
    exit
fi

# Log system metrics
(timeout 1h nvidia-smi -i 2 --query-gpu=utilization.gpu --format=csv >> $gpu_util -l 1;)&
(timeout 1h docker stats $container --format "{{.CPUPerc}}" >> $cpu_util) &
(timeout 1h docker stats $container --format "{{.MemPerc}}" >> $mem_util)

# Format output
python trim_csv.py $cpu_util
python trim_csv.py $mem_util
