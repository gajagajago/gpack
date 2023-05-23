#!/bin/bash

# This script launches Nvidia Nsight Compute(ncu) profiler from inside the Docker container.
# It is assumed that the 'profile target' is profiled on 1 GPU, with all its data already processed ready.
# 
# Command line arguments
# profile_target: Profile target train script (should start training loop immediately)
# tmp_report: Profile report. Parsed as utilization tag after ncu profiler terminates. (must be .csv format)
# util_tag: Path to write target utilization tag
#
# Metrics
# sm__throughput.avg.pct_of_peak_sustained_elapsed: SM utilization
# dram__throughput.avg.pct_of_peak_sustained_elapsed: Device memory utilization
# lts__t_sectors.avg.pct_of_peak_sustained_elapsed: Device L2 utilization 
# dram__bytes_read.sum.pct_of_peak_sustained_elapsed: Device memory bandwidth (read) utilization
# dram__bytes_write.sum.pct_of_peak_sustained_elapsed: Device memory bandwidth (write) utilization

# profile_target=$1
tmp_report=$1
shift 1

# Init ncu filesystem lock on tmpfs
export TMPDIR=/mnt/tmp/nsight-compute-lock && mkdir -p /mnt/tmp/nsight-compute-lock

timeout 5m /usr/local/NVIDIA-Nsight-Compute/ncu \
	--csv \
	--page raw \
	--log-file $tmp_report \
	--target-processes all \
	--kernel-id ::regex:'^(?!nccl)': \
	--metrics sm__throughput.avg.pct_of_peak_sustained_elapsed,dram__throughput.avg.pct_of_peak_sustained_elapsed,lts__t_sectors.avg.pct_of_peak_sustained_elapsed,dram__bytes_read.sum.pct_of_peak_sustained_elapsed,dram__bytes_write.sum.pct_of_peak_sustained_elapsed \
	--force \
	$*

# TODO: Deprecate below lines
# Below lines were added as a heuristic to give enough time for ncu process to write logs to tmp_report
# This was due to the finding that ncu launches 2 processes
# 	one for main profiling purpose
#	the other for logging to report purpose
# the latter remains for a while to write the report, even after the parent process terminates
# So, this runs an infinite loop until all process named exactly 'ncu' terminates
# But if there is a better method, substitute this heuristic
while [[ $(ps | grep "\bncu\b") ]]
do
	:
done

