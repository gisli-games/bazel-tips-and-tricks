def write_new_file_impl(ctx):

    output_file = ctx.actions.declare_file(ctx.attr.out_file_name + ".txt")

    ctx.actions.run(
        outputs = [output_file],
        inputs = [ctx.file.my_input_file],
        executable = "cmd.exe",
        arguments = ["/c", "type", ctx.file.my_input_file.path, ">>", output_file.path]
    )

    return DefaultInfo(files = depset([output_file]))


def write_new_file_with_custom_tool_impl(ctx):

    output_file = ctx.actions.declare_file(ctx.attr.out_file_name + ".txt")

    ctx.actions.run(
        outputs = [output_file],
        inputs = [ctx.file.my_input_file],
        executable = ctx.executable.my_custom_build_tool,
        arguments = [ctx.file.my_input_file.path, output_file.path]
    )

    return DefaultInfo(files = depset([output_file]))

write_new_file = rule(
    implementation = write_new_file_impl,
    attrs = {
        "my_input_file" : attr.label(allow_single_file = True),
        "out_file_name" : attr.string() 
    }
)

write_new_file_with_custom_tool = rule(
    implementation = write_new_file_with_custom_tool_impl,
    attrs = {
        "my_input_file" : attr.label(allow_single_file = True),
        "out_file_name" : attr.string(),
        "my_custom_build_tool" : attr.label(executable = True, cfg = "exec")
    }
)
