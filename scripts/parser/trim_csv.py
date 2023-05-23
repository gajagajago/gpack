import sys
import csv 
import re

regex = re.compile("\d*\.\d+%?")
lines = []

with open(sys.argv[1], 'r') as f:
    rdr = csv.reader(f)
    wtr = csv.writer(f)

    for idx, line in enumerate(rdr):
        perc = regex.search(str(line))
        if perc is not None:
            lines.append([perc.group()])

with open(sys.argv[1], 'w+') as csv_file:
    wtr = csv.writer(csv_file)
    wtr.writerows(lines)