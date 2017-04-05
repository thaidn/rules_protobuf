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

    # ######################
    # Compile Dependencies #
    # ######################

    "com_google_guava_guava": {
        "rule": "maven_jar",
        "artifact": "com.google.guava:guava:jar:19.0",
        "sha1": "6ce200f6b23222af3d8abb6b6459e6c44f4bb0e9",
    },

    "com_google_protobuf_protobuf_java": {
        "rule": "maven_jar",
        "artifact": "com.google.protobuf:protobuf-java:jar:3.1.0",
        "sha1": "e13484d9da178399d32d2d27ee21a77cfb4b7873",
    },

    "com_google_protobuf_protobuf_java_util": {
        "rule": "maven_jar",
        "artifact": "com.google.protobuf:protobuf-java-util:jar:3.1.0",
        "sha1": "5085a47f398f229ef2f07fb496099461e8f4c56c",
    },

    "junit_junit_4": {
        "rule": "maven_jar",
        "artifact": "junit:junit:jar:4.12",
        "sha1": "2973d150c0dc1fefe998f834810d68f278ea58ec",
    },

}
