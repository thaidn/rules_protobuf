# C++ Rules

| Rule | Description |
| ---: | :--- |
| [cpp_proto_repositories](#cpp_proto_repositories) | Load WORKSPACE dependencies. |
| [cc_proto_compile](#cc_proto_compile) | Generate protobuf source files. |
| [cc_proto_library](#cc_proto_library) | Generate and compiles protobuf source files. |

## cpp\_proto\_repositories

Enable C++ support by loading the dependencies in your workspace.

```python
load("@org_pubref_rules_protobuf//cpp:rules.bzl", "cpp_proto_repositories")
cpp_proto_repositories()
```

## cc\_proto\_compile

This is a thin wrapper over the
[proto_compile](../protobuf#proto_compile) rule having language
`@org_pubref_rules_protobuf//cpp`.

```python
load("@org_pubref_rules_protobuf//cpp:rules.bzl", "cc_proto_compile")

cc_proto_compile(
  name = "protos",
  protos = ["message.proto"],
)
```

```sh
$ bazel build :protos
Target //:protos up-to-date:
  bazel-genfiles/message.pb.h
  bazel-genfiles/message.pb.cc
```

## cc\_proto\_library

Pass the set of protobuf source files to the `protos` attribute.

```python
load("@org_pubref_rules_protobuf//cpp:rules.bzl", "cc_proto_library")

cc_proto_library(
  name = "protolib",
  protos = ["message.proto"],
)
```

```sh
$ bazel build :protolib
$ bazel build --spawn_strategy=standalone :protolib
Target //:protolib up-to-date:
  bazel-bin/libprotolib.a
  bazel-bin/libprotolib.so
```

When using the compiled library in other rules, `#include` the
generated files relative to the `WORKSPACE` root.  For example, the
`//examples/helloworld/proto/helloworld.proto` functions can be loaded
via:


```cpp
#include "examples/helloworld/proto/helloworld.pb.h"
```

Consult source files in the
[examples/helloworld/cpp](../examples/helloworld/cpp) directory for
additional information.
