def _build_with_custom_python_impl(ctx):
    
    out_file = ctx.actions.declare_file("python.exe")
    obj = ctx.attr.python_compiler[0]

    for f in obj.files.to_list():
        if "python.exe" in f.basename:
            python_executable = f

    ctx.actions.run(outputs=[out_file],
     executable = python_executable,
     arguments=["--version"],
     progress_message = "Will this run!"
     )

build_with_custom_python = rule(
    implementation = _build_with_custom_python_impl,
    attrs = {
        "data_to_write_to_file": attr.string(),
        "python_compiler": attr.label_list(allow_files=True),
    },
)
