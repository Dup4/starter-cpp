load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "bazel_build_files",
    remote = "https://github.com/Dup4/bazel-build-files.git",
    tag = "v0.0.1",
)

git_repository(
    name = "google_benchmark",
    branch = "main",
    build_file = "@bazel_build_files//google-benchmark:BUILD.bazel",
    remote = "https://github.com/google/benchmark.git",
)

git_repository(
    name = "gtest",
    branch = "main",
    build_file = "@bazel_build_files//gtest:BUILD.bazel",
    remote = "https://github.com/google/googletest.git",
)

git_repository(
    name = "bazel_compile_commands_extractor",
    branch = "main",
    remote = "https://github.com/hedronvision/bazel-compile-commands-extractor.git",
)

load("@bazel_compile_commands_extractor//:workspace_setup.bzl", "hedron_compile_commands_setup")

hedron_compile_commands_setup()
