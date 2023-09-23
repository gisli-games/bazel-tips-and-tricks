genrule(
    name = "compose_book",
    srcs = ["//:chap_1.txt",  "//:chap_2.txt", "@book_cover//file"],
    outs = ["book.txt", "cover.png"],
    cmd = "cat $(location //:chap_1.txt) $(location //:chap_2.txt) > $(location book.txt) && cp $(location @book_cover//file) $(location cover.png)"
)

genrule(
    name = "do-action",
    srcs = ["//:input-file.txt"],
    outs = ["output-file.txt"],
    cmd = "my-custom-tool.exe $(location //:input-file.txt) > $(location output-file.txt)"
)