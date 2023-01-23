workspace(
    name = "bazel_gazelle_gh_1381_workspace",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("//:gazelle_version.bzl", "SHA256", "VERSION")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "56d8c5a5c91e1af73eca71a6fab2ced959b67c86d12ba37feedb0a2dfea441a6",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.37.0/rules_go-v0.37.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.37.0/rules_go-v0.37.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = SHA256,
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/%s/bazel-gazelle-%s.tar.gz" % (VERSION, VERSION),
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/%s/bazel-gazelle-%s.tar.gz" % (VERSION, VERSION),
    ],
)

# C / C++ rules
rules_foreign_cc = "2c6262f8f487cd3481db27e2c509d9e6d30bfe53"

http_archive(
    name = "rules_foreign_cc",
    sha256 = "076b8217296ca25d5b2167a832c8703cc51cbf8d980f00d6c71e9691876f6b08",
    strip_prefix = "rules_foreign_cc-%s" % rules_foreign_cc,
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/%s.tar.gz" % rules_foreign_cc,
)

http_archive(
    name = "libpcap",
    build_file = "//third_party/libpcap:BUILD",
    sha256 = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4",
    strip_prefix = "libpcap-1.10.1",
    urls = ["https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz"],
)

load("//:go_dependencies.bzl", "go_dependencies")

# gazelle:repository_macro go_dependencies.bzl%go_dependencies
go_dependencies()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.3")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies(register_built_tools = False)
