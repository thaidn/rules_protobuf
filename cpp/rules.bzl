load("//protobuf:rules.bzl", "proto_compile", "proto_repositories")
load("//cpp:deps.bzl", "DEPS")

def cpp_proto_repositories(
    lang_deps = DEPS,
    lang_requires = [
      "protobuf_clib",
    ], **kwargs):

  proto_repositories(lang_deps = lang_deps,
                     lang_requires = lang_requires,
                     **kwargs)

PB_COMPILE_DEPS = [
    "//external:protobuf_clib",
]

def cpp_proto_compile(langs = [str(Label("//cpp"))], **kwargs):
  proto_compile(langs = langs, **kwargs)

cc_proto_compile = cpp_proto_compile

def cpp_proto_library(
    name,
    langs = [str(Label("//cpp"))],
    protos = [],
    imports = [],
    inputs = [],
    proto_deps = [],
    output_to_workspace = False,
    protoc = None,

    pb_plugin = None,
    pb_options = [],

    proto_compile_args = {},
    srcs = [],
    deps = [],
    verbose = 0,
    **kwargs):

  compile_deps = PB_COMPILE_DEPS

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

  native.cc_library(
    name = name,
    srcs = srcs + [name + ".pb"],
    deps = list(set(deps + proto_deps + compile_deps)),
    **kwargs)

# Alias for cpp_proto_library
cc_proto_library = cpp_proto_library
