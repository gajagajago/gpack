# Dict of ncu report target metrics(raw) mapped to our profiler's metric name
ncu_metrics_dict = {
    'sm__throughput.avg.pct_of_peak_sustained_elapsed': 'device_sm_util',
    'dram__throughput.avg.pct_of_peak_sustained_elapsed': 'device_mem_util',
    'lts__t_sectors.avg.pct_of_peak_sustained_elapsed': 'device_l2_util',
    'dram__bytes_read.sum.pct_of_peak_sustained_elapsed': 'device_mem_bw_read_util',
    'dram__bytes_write.sum.pct_of_peak_sustained_elapsed': 'device_mem_bw_wrt_util',
}