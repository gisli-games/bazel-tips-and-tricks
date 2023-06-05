import subprocess

action = "//:cli"

build_command = [
    "bazelisk",
    "build",
    "--build_python_zip=false",
    "--enable_runfiles",
    action]

query_command = [
    "bazelisk",
    "cquery",
    "--output_filter=DONT_MATCH_ANYTHING",
    action,
    "--output=files"
    ]

# Run the build action
subprocess.run(" ".join(build_command))

#run the query
res = subprocess.run(" ".join(query_command), stdout=subprocess.PIPE)

output_artifacts = res.stdout.decode("utf-8").split("\n")

print ("------------------")
for each_output_artifact in output_artifacts:
    print(each_output_artifact)