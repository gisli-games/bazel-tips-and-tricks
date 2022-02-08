def _my_custom_run_executable_rule_impl(ctx):

    # Declare the file that will be executed
    executable = ctx.actions.declare_file("run.bat")
    # Write data into the file
    ctx.actions.write(
        output=executable,
        content="python --version",
        is_executable = True,
        )

    # Returns in a way that is executable
    return DefaultInfo(executable  = executable)

def _my_custom_write_to_file_rule_impl(ctx):
    # Declaring an output file to write into
    output_file = ctx.actions.declare_file(ctx.label.name + ".output")

    # Writing the actual data into the file
    ctx.actions.write(
        output=output_file,
        content=ctx.attr.data_to_write_to_file
        )

    # Creating the DefaultInfo instance that we return out of the build rule
    output_default_info = DefaultInfo(files = depset([output_file]))
    
    return output_default_info

my_custom_write_to_file_rule = rule(
    implementation = _my_custom_write_to_file_rule_impl,
    attrs = {
        "data_to_write_to_file": attr.string()
    }
)

my_custom_run_executable_rule = rule (
    implementation = _my_custom_run_executable_rule_impl,
    executable = True,
)