import re 

with open('./data2vec', 'r') as f:
    lines = f.readlines()

    sum = 0
    n = 0
    prev_batch_no = 0

    re_digits = "(\d+(?:\.\d+)?)"

    re_wps = "wps=" + re_digits
    re_wpb = "wpb=" + re_digits

    for line in lines:
        if re.search(re_wps, line) is not None:
            batch_no = int(re.search(re_digits, re.search(re_digits+" /", line).group(0)).group(0))
            wps = float(re.search(re_digits, re.search(re_wps, line).group(0)).group(0))
            wpb = float(re.search(re_digits, re.search(re_wpb, line).group(0)).group(0))
            
            if batch_no != prev_batch_no and wps != 0:
                sec_per_batch = wpb/wps
                sum = sum + sec_per_batch
                n = n+1
                prev_batch_no = batch_no

    print(sum/n)