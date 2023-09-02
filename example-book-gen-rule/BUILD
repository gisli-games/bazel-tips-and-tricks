genrule(
    name = "copy_contents",
    srcs = ["//:contents_to_copy.txt"],
    outs = ["combined.txt"],
    cmd = "cat $(rootpath //:contents_to_copy.txt) > $(execpath combined.txt)",
)

genrule(
    name = "combine_two_files",
    srcs = [
        "//:files/first.txt",
        "//:files/second.txt"],
    outs = ["two_combined.txt"],
    cmd = "cat $(rootpath //:files/first.txt) $(rootpath //:files/second.txt) > $(execpath two_combined.txt)",
)

filegroup(
    name = "all_files",
    srcs = glob(["files/*.txt"])
    )

genrule(
    name = "combine_all_files",
    srcs = ["//:all_files"],
    outs = ["all_combined.txt"],
    cmd = "cat $(rootpaths //:all_files) > $(execpath all_combined.txt)",
)

genrule(
    name = "next_one",
    srcs = ["//:combine_all_files"],
    outs = ["//:next.txt"],
    cmd = "cat $(locations //:combine_all_files) > $(location //:next.txt)",
)