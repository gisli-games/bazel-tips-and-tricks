genrule(
    name = "use-external-file",
    srcs = ["@external-file//:copy-csv-file-to-out"],
    outs = ["out.txt"],
    cmd = "cat $(location @external-file//:copy-csv-file-to-out) > $(location out.txt)"
)