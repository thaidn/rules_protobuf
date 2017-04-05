package(default_visibility = ["//visibility:public"])

load("//closure:rules.bzl", "closure_proto_library")
load("//cpp:rules.bzl", "cc_proto_library")
load("//java:rules.bzl", "java_proto_library")
load("//objc:rules.bzl", "objc_proto_compile")
load("//python:rules.bzl", "py_proto_compile")
load("//protobuf:rules.bzl", "proto_compile")
load("//ruby:rules.bzl", "ruby_proto_compile")

filegroup(
    name = "protos",
    srcs = [
        "common.proto",
    ],
)

cc_proto_library(
    name = "cpp",
    protos = [":protos"],
)

java_proto_library(
    name = "java",
    protos = [":protos"],
)

objc_proto_compile(
    name = "objc",
    protos = [":protos"],
    verbose = 0,
)

py_proto_compile(
    name = "py",
    protos = [":protos"],
    verbose = 0,
)

ruby_proto_compile(
    name = "ruby",
    protos = [":protos"],
    verbose = 0,
)

# This conflicts with outputs from other rules here but demonstrates
# how to generate multiple language outputs simultaneously.
#
# proto_compile(
#     name = "pluriproto",
#     protos = [":protos"],
#     langs = [
#         "//ruby",
#         "//java",
#         "//java:nano",
#         "//python",
#         "//cpp",
#         "//objc",
#         "//closure",
#         "//go",
#     ],
#     verbose = 2,
# )
