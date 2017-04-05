workspace(name = "org_pubref_rules_protobuf")

# ================================================================
# Go support requires rules_go
# ================================================================

git_repository(
    name = "io_bazel_rules_go",
    commit = "4c73b9cb84c1f8e32e7df3c26e237439699d5d8c",
    remote = "https://github.com/bazelbuild/rules_go.git",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

# ================================================================
# closure js_proto_library support requires rules_closure
# ================================================================

git_repository(
    name = "io_bazel_rules_closure",
    commit = "a6b65d5c5c9db8968fb8e03115d5e4f6976de8f7",
    remote = "https://github.com/bazelbuild/rules_closure.git",
)

load("@io_bazel_rules_closure//closure:defs.bzl", "closure_repositories")

closure_repositories()

# ================================================================
# csharp_proto_library support requires rules_dotnet (forked)
# ================================================================

git_repository(
    name = "io_bazel_rules_dotnet",
    commit = "ebc7c1cb61d45bd57042c60b6bfabdfff4979466",
    remote = "https://github.com/bazelbuild/rules_dotnet.git",
)

load("@io_bazel_rules_dotnet//dotnet:csharp.bzl", "csharp_repositories")

csharp_repositories(use_local_mono = False)

# ================================================================
# node_proto_library support requires rules_node
# ================================================================

git_repository(
    name = "org_pubref_rules_node",
    commit = "85b720f3d4299b0a1b9c7771c023352e9182045f",  # Oct 10, 2016
    remote = "https://github.com/pubref/rules_node.git",
)

load("@org_pubref_rules_node//node:rules.bzl", "node_repositories")

node_repositories()

# ================================================================
# Specific Languages Support
# ================================================================

load("//protobuf:rules.bzl", "proto_repositories")

proto_repositories()

load("//cpp:rules.bzl", "cpp_proto_repositories")

cpp_proto_repositories()

load("//java:rules.bzl", "java_proto_repositories")

java_proto_repositories()

load("//objc:rules.bzl", "objc_proto_repositories")

objc_proto_repositories()

load("//python:rules.bzl", "py_proto_repositories")

py_proto_repositories()

load("//ruby:rules.bzl", "ruby_proto_repositories")

ruby_proto_repositories()

# ================================================================
# This is for testing
# ================================================================

GOOGLEAPIS_BUILD_FILE = """
package(default_visibility = ["//visibility:public"])

load("@org_pubref_rules_protobuf//cpp:rules.bzl", "cc_proto_library")
load("@org_pubref_rules_protobuf//java:rules.bzl", "java_proto_library")

cc_proto_library(
    name = "cc_label_proto",
    protos = [
        "google/api/label.proto",
    ],
    verbose = 0,
)
java_proto_library(
    name = "java_label_proto",
    protos = [
        "google/api/label.proto",
    ],
    verbose = 0,
)
"""

new_git_repository(
    name = "com_github_googleapis_googleapis",
    build_file_content = GOOGLEAPIS_BUILD_FILE,
    commit = "13ac2436c5e3d568bd0e938f6ed58b77a48aba15",
    remote = "https://github.com/googleapis/googleapis.git",
)
