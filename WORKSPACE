workspace(name = "Gisli")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "custom_python",
    urls = ["https://www.python.org/ftp/python/3.9.10/python-3.9.10-embed-amd64.zip"],
    build_file = "@//:custom_python.BUILD",
  )