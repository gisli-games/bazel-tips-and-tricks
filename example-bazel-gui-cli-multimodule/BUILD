load("@my_deps//:requirements.bzl", "requirement")

py_binary(
    name = "cli",
    srcs = ["cli.py"],
    deps = [requirement("Typer"),
            "//compressor:compressor"]
)

py_binary(
    name = "gui",
    srcs = ["gui.py"],
    deps = [requirement("nicegui"),
            requirement("websockets"),
            "//compressor:compressor"
    ]
)