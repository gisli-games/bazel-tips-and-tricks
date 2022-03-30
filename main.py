import sys
input_path = sys.argv[1]

print(input_path)

f = open(input_path, "w")
f.write("thisthists")
f.close()