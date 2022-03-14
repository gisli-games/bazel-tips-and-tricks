def _build_with_custom_python_impl(ctx):
    pass

build_with_custom_python = rule(
    implementation = _build_with_custom_python_impl,
    attrs = {
        "data_to_write_to_file": attr.string()
    }
)
