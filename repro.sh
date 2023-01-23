#!/bin/bash

echo "building on gazelle v.0.28.0 (should pass)"
cat <<EOF > gazelle_version.bzl
VERSION = "v0.28.0"
SHA256 = "448e37e0dbf61d6fa8f00aaa12d191745e14f07c31cabfa731f0c8e8a4f41b97"
EOF

bazel clean
bazel build //:workspace

echo "building on gazelle v.0.29.0 (fails with 'Cannot find file to patch')"
cat <<EOF > gazelle_version.bzl
VERSION = "v0.29.0"
SHA256 = "ecba0f04f96b4960a5b250c8e8eeec42281035970aa8852dda73098274d14a1d"
EOF

bazel clean
bazel build //:workspace
