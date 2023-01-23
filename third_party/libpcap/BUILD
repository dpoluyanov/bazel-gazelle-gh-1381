load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(
        include = ["**"],
        exclude = ["BUILD"],
    ),
)

cmake(
    name = "libpcap",
    build_args = [
        "--parallel=4",
    ],
    copts = select({
        "@bazel_tools//src/conditions:darwin_arm64": [
            "-arch",
            "arm64",
        ],
        "//conditions:default": [],
    }),
    lib_source = "@libpcap//:all_srcs",
    out_static_libs = ["libpcap.a"],
)
