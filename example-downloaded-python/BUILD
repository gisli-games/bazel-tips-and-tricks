load("//:custom_rules.bzl", "build_with_custom_python")

filegroup(
    name = "abc",
    srcs = glob(["**/*"]),
    # data = glob(["**/*"])
)

build_with_custom_python(
    name = "write_text_to_file",
    my_files = "@downloaded-python//:python_files",
    output_file_name = "my_out_file.txt",
    python_file = "//:main.py",
    string_to_write_to_file = "This will look great in a text file!",
)
