def _run_me_impl(ctx):
    
    return DefaultInfo(files=ctx.attr.python_files)

run_me = rule (
    implementation = _run_me_impl,
    attrs = {
        "python_files" : attr.label_list(allow_files=True),
    }
)