load("//java:deps.bzl", "DEPS")

load("//protobuf:rules.bzl",
     "proto_compile",
     "proto_language",
     "proto_language_deps",
     "proto_repositories")

def java_proto_repositories(
    lang_deps = DEPS,
    lang_requires = [
    "com_google_protobuf_protobuf_java",
    "com_google_protobuf_protobuf_java_util",
    "com_google_code_gson_gson",
    "com_google_guava_guava",
    "junit_junit_4", # TODO: separate test requirements
    "com_google_code_findbugs_jsr305",
  ], **kwargs):

  proto_repositories(lang_deps = lang_deps,
                     lang_requires = lang_requires,
                     **kwargs)


def nano_proto_repositories(
    lang_requires = [
      "com_google_protobuf_nano_protobuf_javanano",
    ], **kwargs):
  proto_repositories(lang_requires = lang_requires,
                     lang_deps = DEPS,
                     **kwargs)


def java_proto_compile(langs = [str(Label("//java"))], **kwargs):
  proto_compile(langs = langs, **kwargs)

def java_proto_library(
    name,
    langs = [str(Label("//java"))],
    protos = [],
    imports = [],
    inputs = [],
    output_to_workspace = False,
    proto_deps = [],
    protoc = None,

    pb_plugin = None,
    pb_options = [],

    proto_compile_args = {},
    srcs = [],
    deps = [],
    verbose = 0,
    **kwargs):

  proto_compile_args += {
    "name": name + ".pb",
    "protos": protos,
    "deps": [dep + ".pb" for dep in proto_deps],
    "langs": langs,
    "imports": imports,
    "inputs": inputs,
    "pb_options": pb_options,
    "output_to_workspace": output_to_workspace,
    "verbose": verbose,
  }

  if protoc:
    proto_compile_args["protoc"] = protoc
  if pb_plugin:
    proto_compile_args["pb_plugin"] = pb_plugin

  proto_compile(**proto_compile_args)

  proto_language_deps(
    name = name + "_compile_deps",
    langs = langs,
    file_extensions = [".jar"],
  )

  native.java_import(
    name = name + "_compile_imports",
    jars = [name + "_compile_deps"],
  )

  java_exports = []

  native.java_library(
    name = name,
    srcs = srcs + [name + ".pb"],
    exports = java_exports,
    deps = list(set(deps + proto_deps + [name + "_compile_imports"])),
    **kwargs)


def java_proto_language_import(name,
                               langs = [str(Label("//java"))],
                               **kwargs):
  proto_language_deps(
    name = name + ".deps",
    langs = langs,
    file_extensions = [".jar"],
    **kwargs
  )

  native.java_import(
    name = name,
    jars = [name + ".deps"],
  )
