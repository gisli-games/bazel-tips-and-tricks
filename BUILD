load("//:custom_rules.bzl", "my_custom_rule","my_custom_action")

my_custom_rule(
    name = "run_my_command",
    data_to_write_to_file = "This will look great in a text file!"
)

my_custom_action(
    name = "run_my_action",
    deps = [":python-run"],
)