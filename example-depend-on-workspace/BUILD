genrule(
    name = "produce-my-file",
    srcs = ["@external-raw-data//:convert-to-csv"],
    outs = ["out.txt"],
    cmd = "cat $(location @external-raw-data//:convert-to-csv) > $(location out.txt)"
)