import sys

source_file = sys.argv[1]
target_file = sys.argv[2]

source = open(source_file, "r")
in_data = source.read()
source.close()

out_string = in_data.upper()

target = open(target_file, "w")
target.write(out_string)
target.close()