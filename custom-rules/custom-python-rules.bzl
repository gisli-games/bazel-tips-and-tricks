def _execute_python_file_impl(ctx):
    print (ctx.attr.srcs)
    
    # return DefaultInfo(files = ctx.attr.srcs)

execute_python_file = rule(
    implementation = _execute_python_file_impl,
    attrs = {
       "srcs" : attr.label_list(allow_files=True),
    },
)
