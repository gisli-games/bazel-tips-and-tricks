Description of the status of this project is here:
https://stackoverflow.com/questions/71485389/unable-to-use-a-hermetic-python-in-a-bazel-workspace-as-an-external-dependency

# How to run
1) Clone the repo
2) Run .\bazel.exe build :all


# Outstanding issues:
The function that i can't figure out is the following.

    def _build_with_custom_python_impl(ctx):

        print("Got here")

        ctx.actions.run(
            executable = ctx.attr.python_compiler,
            inputs = [ctx.attr.python_file],
            arguments = [ctx.attr.data_to_write_to_file],
            )
