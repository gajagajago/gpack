'''
This script reads input report CSV file, extracts target metrics, and returns weighted average according to GPU time.
Target metrics are SM util, (device) Mem util, (device) L2 util, (device) Mem Bandwidth Read/Write util.
Output is saved in the CSV of these metrics in percentage(%).
'''
import pandas as pd
import sys
import numpy as np

from profiler.configs.metrics import ncu_metrics_dict

''' Parses ncu report and extract profile target metrics
Returns a dict of target metrics mapped to its profiled values
'''
def parse_ncu_report(report_path):
    # 1. Remove non-csv part of the report
    f_in = open(report_path, 'r', encoding='utf-8')
    lines = f_in.readlines()
    f_in.close()

    line = lines[0]

    f_out = open(report_path, 'w', encoding='utf-8')
    while not line.startswith('"ID"'):
        # print("Line: ", line)
        lines.pop(0)
        line = lines[0]

    for line in lines:
        line.replace('^@', '')
        f_out.write(line)
    f_out.close()

    # 2. Parse csv
    df = pd.read_csv(report_path)

    aggr_gpu_time = 0.0

    #[ weighted_aggr_sm_util_pct, weighted_aggr_mem_util_pct, weighted_aggr_l2_util_pct, weighted_aggr_mem_bw_read_pct, weighted_aggr_mem_bw_wrt_pct ]
    weighted_aggr_metrics = np.zeros(len(ncu_metrics_dict.keys())) 

    for idx, row in df.iterrows():
        # Report csv index 0 does not contain a kernel profile
        if idx == 0:
            continue

        gpu_time = float(row['gpu__time_duration.sum'])
        aggr_gpu_time += gpu_time

        kernel_metrics = np.array([row[m] for m in ncu_metrics_dict.keys()], dtype=float)
        kernel_metrics *= gpu_time

        weighted_aggr_metrics += kernel_metrics

    # 3. Weighted average the metrics
    avg_metrics = weighted_aggr_metrics / aggr_gpu_time

    return dict(zip(ncu_metrics_dict.values(), avg_metrics))