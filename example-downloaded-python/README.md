# Overview
The goal of this project was to setup a simple bazel build where I download an external "tool" and use that tool in the build step. The example downloads python from the official python website, adds a BUILD file for the downloaded python and uses it to write a string to a file.

# How to run
1) Clone the repo _git clone git@github.com:arctictheory/bazel-learning.git_
2) Run "_run_example.bat_"
3) Notice that a symlink got created into the folder called "bazel-out"
4) Notice that a new file got created under bazel-out/x64_windows_fastbuild/bin/ called my_out_file.txt


# How does it work
## WORKSPACE
The workspace file is where I define the external dependancy. I gave it the name "downloaded-python" and I tell it to use a build file from the root of the workspace 
    
    load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

    http_archive(
        name = "downloaded-python",
        urls = ["https://www.python.org/ftp/python/3.9.10/python-3.9.10-embed-amd64.zip"],
        sha256 = "67161cab713a52f6658b76274f8dbe0cd2f256aab1e84f94cd557d4a906fa5d2",
        build_file = "//:BUILD.downloaded-python"
      )
      
## BUILD.downloaded-python
The downloaded python is not setup as a bazel package so we need to add information into the BUILD file that allows us to use the stuff in the package. The only thing I  wanted was to be able to run the python.exe file from the downloaded python so all I had to do was to make this rule decleration. 

    package(default_visibility = ["//visibility:public"])

    sh_binary(
        name="python",
        srcs = ["python.exe"]
        )
 
 
## BUILD file
In the build file in the project itself I create a _build rule declaration_. The build rule itself is custom and is loaded into the build file from a the _custom_rules.bzl_ that is also included in the project.

The build rule gets a name (write_text_to_file) and has a few parameters that are passed into the implementation of the rule

    load("//:custom_rules.bzl","build_with_custom_python")

    build_with_custom_python(
        name = "write_text_to_file",
        string_to_write_to_file = "This will look great in a text file!",
        python_file = "//:main.py",
        output_file_name = "my_out_file.txt"
        )
        
## Custom Rules
The custom rule is called custom_rules.bzl and contains the definition and the implementation of the actual build rule

### Custom Rule Implementation
This is the code that is run

    def _build_with_custom_python_impl(ctx):

        out_file = ctx.actions.declare_file(ctx.attr.output_file_name)

        ctx.actions.run(
            outputs = [out_file],
            executable = ctx.executable._python_compiler,
            arguments = [ctx.file.python_file.path, out_file.path, ctx.attr.string_to_write_to_file],
        )

        return DefaultInfo(files=depset([out_file]))

### Custom Rule Definition
This is the definition of the rule. That is the stuff that can be passed into it

    build_with_custom_python = rule(
        implementation = _build_with_custom_python_impl,
        attrs = {
            "string_to_write_to_file": attr.string(),
            "python_file" : attr.label(allow_single_file = True),
            "output_file_name" : attr.string(),
            "_python_compiler": attr.label(
                executable = True,
                cfg = "exec",
                allow_files = True,
                default = "@downloaded-python//:python.exe",
            ),

        },
    )
    
