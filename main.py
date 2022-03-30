import sys

output_path = sys.argv[1]
custom_message = sys.argv[2]

f = open(output_path, "w")
print(f"Writing {custom_message} into file {output_path}")
f.write(custom_message)
f.close()