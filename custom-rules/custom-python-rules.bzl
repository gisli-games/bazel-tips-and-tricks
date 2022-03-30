def _execute_python_file_impl(ctx):
    
    print(ctx.attr.python_source_file)

    

def _execute_my_shell_script_impl(ctx):

    out = ctx.actions.declare_file(ctx.attr.my_output)

    ctx.actions.run(
        outputs = [out],
        executable = "python.exe",
        arguments = [ctx.file.my_input.path, out.path]
    )

    return DefaultInfo(files = depset([out]))

execute_python_file = rule(
    implementation = _execute_python_file_impl,
    attrs = {
        python_exe_file : attr.label(allow_single_file = True,executable = True, cfg = "exec")
    },
)

execute_my_shell_script = rule (
    implementation=  _execute_my_shell_script_impl,
    attrs = {
        "my_output" : attr.string(),
        "my_input" : attr.label(allow_single_file = True),
        }
        
)
