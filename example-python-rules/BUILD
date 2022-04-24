load("@rules_python//python:defs.bzl", "py_binary")
load("@pip_install_package//:requirements.bzl", "requirement")

py_binary(
  name = "main",
  srcs = ["main.py"],
  deps = [requirement("requests")]
)