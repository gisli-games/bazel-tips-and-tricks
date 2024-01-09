py_library(
    name = "chaptermanager",
    srcs = [
        "//chaptermanager:db.py",
        "//chaptermanager:exceptions.py", 
    ],
)

py_binary(
    name = "main-exe",
    main = "db.py",
    srcs = [
        "//chaptermanager:db.py",
        "//chaptermanager:exceptions.py", 
    ],
)

py_test(
    name = "test_db",
    srcs = ["//chaptermanager:tests/test_db.py"],
    deps = ["//chaptermanager:chaptermanager"],
    data = ["//chaptermanager:tests/data/test_chapter.txt"]
)
