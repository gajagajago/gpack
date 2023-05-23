import os
import subprocess
import argparse
import time
import pandas as pd 

from profiler.scripts.parser.parse_ncu_report import parse_ncu_report
from profiler.scripts.parser.parse_logger import parse_logger, cleanup_logger
from profiler.configs.path import DOCKER_CODE_MOUNT_DIR

assert os.getenv('DLCM_PATH'), 'Set DLCM_PATH'

HOST_ENTRYPOINT_DIR = os.path.join(os.getenv('DLCM_PATH'), 'profiler/scripts/docker/entrypoints')
HOST_DEFAULT_ENTRYPOINT_PATH = os.path.join(HOST_ENTRYPOINT_DIR, 'entrypoint.sh')

CONTAINER_ENTRYPOINT_DIR = os.path.join(DOCKER_CODE_MOUNT_DIR, 'profiler/scripts/docker/entrypoints')

parser = argparse.ArgumentParser(description='Profile a job')

parser.add_argument('--name', help='name of the job')
parser.add_argument('--code', nargs='+', help='host entry path to the job\'s train script, with its command line arguments')
parser.add_argument('--nvidia_visible_devices', help='indices of dedicated gpus to be profiled at')
parser.add_argument('--cpus_start', help='starting index of dedicated cpus to be profiled at')
parser.add_argument('--util_tag', help='host path to store profiled util tag.') # must be csv extenstion

# TODO: deprecate parser arguments below.
#       logger_dir should be aligned to container name on deploy version. Modify logger/log_gpu_cpu_mem.sh too
parser.add_argument('--logger_dir', help='host directory to profile utilization outputs from logger')

args = parser.parse_args()

''' Launch a docker container with the job attached with ncu profiler 
Blocks until the container is successfully launched in a detached mode 
'''
def launch_job_and_ncu_in_docker_container(args):

    # Create new entrypoint for the job
    entrypoint = args.container_name+'.sh'
    host_entrypoint_path = os.path.join(HOST_ENTRYPOINT_DIR, entrypoint)
    container_ncu_tmp_report_path = os.path.join(DOCKER_CODE_MOUNT_DIR, args.ncu_tmp_report_path)

    # Create tmp_report in advance, for permission issues
    host_ncu_tmp_report_path = os.path.join(os.getenv('DLCM_PATH'), ncu_tmp_report_path)
    open(host_ncu_tmp_report_path, 'w+').close()

    ncu_cmd_args = [
        os.path.join(DOCKER_CODE_MOUNT_DIR, 'profiler/scripts/ncu/ncu_profile.sh'),
        container_ncu_tmp_report_path,
        os.path.join(DOCKER_CODE_MOUNT_DIR, args.code[0]),
        ' '.join(args.code[1:])
    ]

    os.system('cat %s > %s' % (HOST_DEFAULT_ENTRYPOINT_PATH, host_entrypoint_path))
    os.system('echo %s >> %s' % ('', host_entrypoint_path)) # for new line
    os.system('echo %s >> %s' % (' '.join(ncu_cmd_args), host_entrypoint_path))

    os.chmod(host_entrypoint_path, 777) # TODO: Add more security

    container_entrypoint_path = os.path.join(CONTAINER_ENTRYPOINT_DIR, entrypoint)

    args = [
        'bash',
        os.path.join(os.getenv('DLCM_PATH'), 'profiler/scripts/docker/docker_launch.sh'),
        args.container_name, 
        args.nvidia_visible_devices, 
        args.cpus_start, 
        container_entrypoint_path]

    p = subprocess.Popen(
        args,
        # stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        # stderr=subprocess.PIPE,
    )

    return_code = p.wait()

    if return_code == 0:
        print("\n\n[Exit] Successfully launched job and ncu inside docker container (Return code: %d)" % return_code)
    else:
        print("\n\n[Error] launch_job_and_ncu_in_docker_container (Return code: %d)" % return_code)
    
    # cleanup
    os.remove(host_entrypoint_path)

''' Launch a logger for a launched docker container '''
def launch_logger(args):
    args = [
        'bash',
        os.path.join(os.getenv('DLCM_PATH'), 'profiler/scripts/logger/log_gpu_cpu_mem.sh'),
        args.container_name,
        args.nvidia_visible_devices,
        args.logger_dir, # TODO: deprecate this argument
    ]

    p = subprocess.Popen(
        args,
        # stdin=subprocess.PIPE,
        # stdout=subprocess.PIPE,
        # stderr=subprocess.PIPE,
    )

    p.wait()

    print("\n\n[Exit] launch_logger")
    
if __name__ == '__main__':
    container_name = args.name + "_" + str(int(time.time()))
    ncu_tmp_report_path = '{}/{}.csv'.format(args.logger_dir, container_name)

    args.container_name = container_name
    args.ncu_tmp_report_path = ncu_tmp_report_path

    host_logger_subdir_path = os.path.join(os.getenv('DLCM_PATH'), args.logger_dir)
    host_ncu_tmp_report_path = os.path.join(os.getenv('DLCM_PATH'), ncu_tmp_report_path)

    os.makedirs(host_logger_subdir_path, exist_ok=True)

    print("\n\nStart profiling container: %s" % container_name)

    launch_job_and_ncu_in_docker_container(args)
    launch_logger(args)

    # TODO: Add error handler which waits for the designated profiling time, even if failure occurs on any process

    # Check if container has terminated successfully
    while True:
        try:
            subprocess.check_output('docker ps | grep {}'.format(container_name), shell=True)
        except subprocess.CalledProcessError as e:
            print('\n\nProfiling has ended. Begin parsing')
            break

    # Parse the collected files
    profiled_ncu_metrics_dict = parse_ncu_report(host_ncu_tmp_report_path)
    profiled_logger_metrics_dict = parse_logger(host_logger_subdir_path, container_name)

    # Save to util tag
    metrics_dict = {**profiled_logger_metrics_dict, **profiled_ncu_metrics_dict}
    host_util_tag_path = os.path.join(os.getenv('DLCM_PATH'), args.util_tag)

    df_out = pd.DataFrame([metrics_dict.values()], columns=metrics_dict.keys())
    df_out.to_csv(host_util_tag_path, index=False)

    # cleanup
    os.remove(host_ncu_tmp_report_path)
    cleanup_logger(host_logger_subdir_path, container_name)

    print('\n\nParsing ended. util_tag saved at: %s' % host_util_tag_path)

