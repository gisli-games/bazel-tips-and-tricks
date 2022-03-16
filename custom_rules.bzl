def _build_with_custom_python_impl(ctx):
    
    print("Got here")
    '''
    ctx.actions.run(
        executable = ctx.attr.python_compiler,
        inputs = [ctx.attr.python_file],
        arguments = [ctx.attr.data_to_write_to_file],
        )
    '''
build_with_custom_python = rule(
    implementation = _build_with_custom_python_impl,
    attrs = {
        "data_to_write_to_file": attr.string(),
        "python_file": attr.label(allow_single_file=True),
        "python_compiler": attr.label_list(allow_files=True)
    }
)
