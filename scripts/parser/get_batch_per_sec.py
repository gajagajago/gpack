import re 

with open('./transformer', 'r') as f:
    lines = f.readlines()

    sum = 0
    n = 0

    re_digits = "(\d+(?:\.\d+)?)"

    re_wps = "wps=" + re_digits
    re_wpb = "wpb=" + re_digits

    for line in lines:
        if re.search(re_wps, line) is not None:
            wps = float(re.search(re_digits, re.search(re_wps, line).group(0)).group(0))
            wpb = float(re.search(re_digits, re.search(re_wpb, line).group(0)).group(0))

            if wps != 0:
                sec_per_batch = wpb/wps

                sum = sum + sec_per_batch
                n = n+1
    
    print(sum/n)