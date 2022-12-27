load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "bazel_build_files",
    branch = "main",
    remote = "https://github.com/Dup4/bazel-build-files.git",
)

git_repository(
    name = "google_benchmark",
    branch = "main",
    remote = "https://github.com/google/benchmark.git",
)

git_repository(
    name = "gtest",
    branch = "main",
    build_file = "@bazel_build_files//gtest:BUILD.bazel",
    remote = "https://github.com/google/googletest.git",
)
