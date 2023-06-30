import re
import sys
import os

# Take a single argument filename for a text file and conver it to CSV
# by replacing all blocks of whitespace characters with commas

filename = sys.argv[-1]

input_file = open(filename, "r")
output_file = open(f'{os.path.splitext(filename)[0]}.csv', "w")

for line in input_file:
    line = re.sub(r'[ \t]+',',', line) #Replaces space and tab
    output_file.write(line)