import subprocess
import os

from profiler.configs.commands import gpu_util_parse_cmd, cpu_util_parse_cmd, mem_util_parse_cmd

def parse_logger(host_logger_subdir_path, container_name):
    gpu_log_path = os.path.join(host_logger_subdir_path, '{}_gpu_util.csv'.format(container_name))
    cpu_log_path = os.path.join(host_logger_subdir_path, '{}_cpu_util.csv'.format(container_name))
    host_mem_log_path = os.path.join(host_logger_subdir_path, '{}_mem_util.csv'.format(container_name))

    gpu_util = float(subprocess.check_output(gpu_util_parse_cmd.format(gpu_log_path), shell=True))
    cpu_util = float(subprocess.check_output(gpu_util_parse_cmd.format(cpu_log_path), shell=True))
    host_mem_util = float(subprocess.check_output(gpu_util_parse_cmd.format(host_mem_log_path), shell=True))

    return { 
        'gpu_util': gpu_util,
        'cpu_util': cpu_util,
        'host_mem_util': host_mem_util,
    }

def cleanup_logger(host_logger_subdir_path, container_name):
    gpu_log_path = os.path.join(host_logger_subdir_path, '{}_gpu_util.csv'.format(container_name))
    cpu_log_path = os.path.join(host_logger_subdir_path, '{}_cpu_util.csv'.format(container_name))
    host_mem_log_path = os.path.join(host_logger_subdir_path, '{}_mem_util.csv'.format(container_name))

    os.remove(gpu_log_path)
    os.remove(cpu_log_path)
    os.remove(host_mem_log_path)