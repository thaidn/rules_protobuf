package(default_visibility = ["//visibility:public"])

load("//java:rules.bzl", "java_proto_library", "java_lite_proto_library")

java_lite_proto_library(
    name = "lite",
    protos = ["lite.proto"],
    verbose = 0,
)

java_proto_library(
    name = "full",
    protos = ["full.proto"],
    verbose = 0,
)

java_test(
    name = "javalite_test",
    srcs = [
        "src/test/java/JavaLiteTest.java",
    ],
    test_class = "JavaLiteTest",
    deps = [
        ":full",
        ":lite",
        "@junit_junit_4//jar",
        "@com_google_protobuf_protobuf_javalite//jar",
    ],
)
