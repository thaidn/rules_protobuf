# MAINTAINERS
#
# Every external rule must have a SHA checksum or tag.
#
# To update http_file(s) from maven servers, point your browser to
# https://repo1.maven.org/maven2/com/google/protobuf/protoc, find the
# file, copy it down to your workstation (with curl perhaps), and
# compute the sha256:
#
# $ curl -O -J -L https://repo1.maven.org/maven2/com/google/protobuf/protoc/3.0.0/protoc-3.0.0-linux-x86_64.exe
# $ sha256sum protoc-3.0.0-linux-x86_64.exe #linux
# $ shasum -a256 protoc-3.0.0-osx-x86_64.exe # macosx
#

DEPS = {
    
    # See https://search.maven.org/#search%7Cga%7C1%7Cg%3A%22com.google.protobuf%22.
    "com_google_protobuf_protobuf_java": {
        "rule": "maven_jar",
        "artifact": "com.google.protobuf:protobuf-java:jar:3.2.0",
        "sha1": "62ccf171a106ff6791507f2d5364c275f9a3131d",
    },

    "com_google_protobuf_protobuf_javalite": {
        "rule": "maven_jar",
        "artifact": "com.google.protobuf:protobuf-lite:jar:3.0.1",
        "sha1": "59b5b9c6e1a3054696d23492f888c1f8b583f5fc",
    },

    "protoc_gen_javalite_linux_x86_64": {
        "rule": "http_file",
        "url" : "http://repo1.maven.org/maven2/com/google/protobuf/protoc-gen-javalite/3.0.0/protoc-gen-javalite-3.0.0-linux-x86_64.exe",
        "sha256": "83eb6ee8391cbd26ebf48f6636c089e530fd3fea454dc66e5a7e36a648795c7b",
    },

    "protoc_gen_javalite__macosx": {
        "rule": "http_file",
        "url" : "http://repo1.maven.org/maven2/com/google/protobuf/protoc-gen-javalite/3.0.0/protoc-gen-javalite-3.0.0-osx-x86_64.exe",
        "sha256": "fe6f2ba6c6550f20cfa4d07e481a19ce108981009fdd7e6819fed9caa70af074",
    },
}
