DEPS = {

    # Protobuf required for multiple reasons, including the cc_binary
    # 'protoc' and the cc_library 'protobuf_clib'
    "com_github_google_protobuf": {
        "rule": "git_repository",
        "remote": "https://github.com/google/protobuf.git",
        "commit": "b4b0e304be5a68de3d0ee1af9b286f958750f5e4",
    },

    # This binds the cc_binary "protoc" into
    # //external:protoc. Required by grpc++.
    "protoc": {
        "rule": "bind",
        "actual": "@com_github_google_protobuf//:protoc",
    },

}
