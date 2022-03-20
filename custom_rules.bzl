def _build_with_custom_python_impl(ctx):
    

    obj = ctx.attr.python_compiler[0]
    print(dir(obj))
    for f in obj.files.to_list():
        print(f)
        if "python.exe" in f.basename:
            python_executable = f


build_with_custom_python = rule(
    implementation = _build_with_custom_python_impl,
    attrs = {
        "data_to_write_to_file": attr.string(),
        "python_compiler": attr.label_list(allow_files=True),
    },
)
