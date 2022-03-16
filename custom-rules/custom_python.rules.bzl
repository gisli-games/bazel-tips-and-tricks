def _run_me_impl(ctx):
    pass

run_me = rule (
    implementation = _run_me_impl,
    attrs = {
        "python_files" : attr.label_list(allow_files=True),
    }
)