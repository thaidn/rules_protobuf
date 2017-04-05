DEPS = {
    # Hooray! The boringssl team provides a "master-with-bazel" branch
    # with all BUILD files ready to go.  To update, pick the
    # newest-ish commit-id off that branch.
    "boringssl": {
        "rule": "git_repository",
        "remote":  "https://boringssl.googlesource.com/boringssl",
        "commit": "14443198abcfc48f0420011a636b220e58e18610", # Nov 11 2016
    },

    # GTest is for our own internal cc tests.
    "gtest": {
        "rule": "new_git_repository",
        "remote": "https://github.com/google/googletest.git",
        "commit": "ed9d1e1ff92ce199de5ca2667a667cd0a368482a",
        "build_file": str(Label("//protobuf:build_file/gtest.BUILD")),
    },

    "protobuf_clib": {
        "rule": "bind",
        "actual": "@com_github_google_protobuf//:protobuf",
    },
}
