load("@rules_python//python:defs.bzl", "py_binary")
load("@rules_pkg//pkg:zip.bzl", "pkg_zip")

py_binary(
    name = "mytool", 
    srcs = ["mytool.py"]
    )

pkg_zip(
    name = "PackageMyTool",
    srcs = ["//:mytool"],
    out = "ReadyForDeployment.zip"
    )