# Host logger profiled result parse commands
# (IMPORTANT) Following commands must be formatted
# The first parenthesis behind 'cat' should be formatted with the target file path
# For the use case, refer to profiler/run_profile/run_profile.py
gpu_util_parse_cmd = "cat {} | tail -n +2| sed 's/.\{{2\}}$//' | awk '{{ sum += $0; n++ }} END {{ if (n > 0) print sum / n; }}'"
cpu_util_parse_cmd = "cat {} | sed 's/.\{{2\}}$//' | awk '{{ sum += $0; n++ }} END {{ if (n > 0) print sum / n; }}'"
mem_util_parse_cmd = "cat {} | sed 's/.\{{2\}}$//' | awk '{{ sum += $0; n++ }} END {{ if (n > 0) print sum / n; }}'"