#!/usr/bin/env python3

# From http://www.quuxlabs.com/tutorials/writing-an-hadoop-mapreduce-program-in-python/
# Updated for Python 3+ 

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
   
    # remove leading and trailing whitespace
    line = line.strip()

    # split the line into words
    words = line.split()
    
    # increase counters
    for word in words:
        print('{0}\t{1}'.format(word, 1))