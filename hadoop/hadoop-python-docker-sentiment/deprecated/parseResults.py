#!/usr/bin/env python

'''
parseResults.py
Author: Min Chen <mc43@iu.edu>
Date: 2018-04-026
Last change: 2018-04-26

'''
import sys, re
from statistics import mean, stdev

time=[]

for line in sys.stdin:
    z = re.match(".*?([0-9]+)m([0-9]+)\..*",line)
    if z:
        time.append(int(z.group(1))*60 + int(z.group(2)))

print("mean; ", "%.2f" % mean(time))
print("mean; ",  int(mean(time))//60, "min",
      "%.0f" % (mean(time)%60), "sec")
print("std; ",  "%.0f" % (stdev(time)))
print("cv; ",   "%.5f" % (stdev(time)/mean(time)))