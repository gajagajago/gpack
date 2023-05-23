import re 

with open('./bert', 'r') as f:
    lines = f.readlines()

    # sum = 0
    # n = 0

    re_digits = "(\d+(?:\.\d+)?)"
    re_it_per_s = re_digits + "it/s"
    # re_wps = "wps=" + re_digits
    # re_wpb = "wpb=" + re_digits
    n = 0
    it_per_s_sum = 0

    for line in lines:
        it_per_s = re.findall(re_it_per_s, line)

        if len(it_per_s) != 0:
            for e in it_per_s:
                it_per_s_sum = it_per_s_sum + float(e)
                n = n+1

    print(n / it_per_s_sum)

        # if re.search("it/s", line) is not None:
        #     print(line)
        #     wps = float(re.search(re_digits, re.search(re_wps, line).group(0)).group(0))
        #     wpb = float(re.search(re_digits, re.search(re_wpb, line).group(0)).group(0))

        #     if wps != 0:
        #         sec_per_batch = wpb/wps

        #         sum = sum + sec_per_batch
        #         n = n+1
    
    # print(sum/n)