package(default_visibility = ["//visibility:public"])

load("//protobuf:rules.bzl", "proto_language", "proto_language_deps")
load("//java:rules.bzl", "java_proto_language_import")

proto_language(
    name = "java",
    output_to_jar = True,
    pb_compile_deps = [
        "@com_google_guava_guava//jar",
        "@com_google_protobuf_protobuf_java//jar",
    ],
    pb_file_extensions = [],
    pb_runtime_deps = [],
)

config_setting(
    name = "darwin",
    values = {"cpu": "darwin"},
    visibility = ["//visibility:private"],
)
