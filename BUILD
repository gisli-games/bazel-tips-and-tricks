package(default_visibility = ["//visibility:public"])

load("//:custom_rules.bzl","build_with_custom_python")
load("//custom-rules:custom-python-rules.bzl", "execute_my_shell_script")

build_with_custom_python(
    name = "write-to-file",
    data_to_write_to_file = "This will look great in a text file!",
    python_compiler = "@hermetic_python//:FunOnABun"
    )


execute_my_shell_script(
    name = "gisli-test",
    my_output = "my_out_file.txt",
    my_input = "//:main.py"
    
    
)