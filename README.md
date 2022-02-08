# Goal
I want the two custom rules that are in the project to use a python interpreter that is downloaded from an http_archive (as defined in the WORKSPACE file). The current build actions use the system python.

## Code
The custom rules are defined in the custom_rules.bzl file that are then loaded and used in the BUILD file at the root of the project. The WORKSPACE has an http_archive pointing to a standalone python interpreter that should be used instead of the system python when the build steps are run   
```
.\custom_rules.bzl
---
my_custom_write_to_file_rule = rule(...)
my_custom_run_executable_rule = rule (...)
```
The .\BUILD file then uses these rules to define two build steps that are triggerable by name
```
.\BUILD 
---
my_custom_write_to_file_rule(
    name = "write-to-file",
)

my_custom_run_executable_rule(
    name = "print-system-python-version",
)
```
## How to run (and check the output)
Since the Bazel executable is located inside of the project, all you need to run this is are the following commands in terminal
```
.\bazel.exe build write-to-file
```
Makes a new a file in .\bazel-bin\write-to-file.output and write some text into it.
```
.\bazel.exe run print-system-python-version
```
Runs an executable (the system) python and print the version of it into the terminal
