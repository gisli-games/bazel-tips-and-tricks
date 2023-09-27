load("@rules_pkg//pkg:zip.bzl", "pkg_zip")
load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "mytool", 
    srcs = ["mytool.py"]
    )

pkg_zip(
    name = "PackageMyTool",
    srcs = ["//:mytool"],
    out = "ReadyForDeployment.zip"
    )