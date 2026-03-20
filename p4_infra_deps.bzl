"""Third party dependencies.

Please read carefully before adding new dependencies:
- Any dependency can break all of P4 Infra. Please be mindful of that before
  adding new dependencies. Try to stick to stable versions of widely used libraries.
  Do not depend on private repositories and forks.
- Fix dependencies to a specific version or commit, so upstream changes cannot break
  p4-infra. Prefer releases over arbitrary commits when both are available.
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def p4_infra_deps():
    """Sets up 3rd party workspaces needed to build P4 infrastructure."""

    # -- Direct dependencies ---------------------------------------------------

    if not native.existing_rule("com_google_absl"):
        http_archive(
            name = "com_google_absl",
            url = "https://github.com/abseil/abseil-cpp/archive/20240116.2.tar.gz",
            strip_prefix = "abseil-cpp-20240116.2",
            sha256 = "733726b8c3a6d39a4120d7e45ea8b41a434cdacde401cba500f14236c49b39dc",
        )
    if not native.existing_rule("com_google_googletest"):
        http_archive(
            name = "com_google_googletest",
            urls = ["https://github.com/google/googletest/archive/release-1.11.0.tar.gz"],
            strip_prefix = "googletest-release-1.11.0",
            sha256 = "b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5",
        )
    if not native.existing_rule("com_google_protobuf"):
        http_archive(
            name = "com_google_protobuf",
            url = "https://github.com/protocolbuffers/protobuf/releases/download/v28.2/protobuf-28.2.tar.gz",
            strip_prefix = "protobuf-28.2",
            sha256 = "b2340aa47faf7ef10a0328190319d3f3bee1b24f426d4ce8f4253b6f27ce16db",
        )
    if not native.existing_rule("com_github_grpc_grpc"):
        http_archive(
            name = "com_github_grpc_grpc",
            url = "https://github.com/grpc/grpc/archive/v1.63.0.zip",
            strip_prefix = "grpc-1.63.0",
            sha256 = "daa1b06a19b5f7e4603e1f8980eeab43cf69b6e89bee3b2547f275fa5af7f480",
        )
    if not native.existing_rule("com_google_googleapis"):
        http_archive(
            name = "com_google_googleapis",
            url = "https://github.com/googleapis/googleapis/archive/f405c718d60484124808adb7fb5963974d654bb4.zip",
            strip_prefix = "googleapis-f405c718d60484124808adb7fb5963974d654bb4",
            sha256 = "406b64643eede84ce3e0821a1d01f66eaf6254e79cb9c4f53be9054551935e79",
        )
    if not native.existing_rule("com_google_gutil"):
        git_repository(
            name = "com_google_gutil",
            remote = "https://github.com/google/gutil",
            branch = "bazel-workspace-support-no-strip",
        )
    if not native.existing_rule("com_github_p4lang_p4c"):
        git_repository(
            name = "com_github_p4lang_p4c",
            remote = "https://github.com/p4lang/p4c",
            branch = "bazel-workspace-support-no-strip",
        )
    if not native.existing_rule("com_github_p4lang_p4runtime"):
        http_archive(
            name = "com_github_p4lang_p4runtime",
            url = "https://github.com/p4lang/p4runtime/archive/bd2a626484e125da30422326d27fad0ddebdd645.tar.gz",
            strip_prefix = "p4runtime-bd2a626484e125da30422326d27fad0ddebdd645/proto",
            sha256 = "5cad9290fce6748ef3e76a857f9d2cb6747ec3540423a325eff61a718d464cfd",
        )

    if not native.existing_rule("rules_cc"):
        http_archive(
            name = "rules_cc",
            sha256 = "b8b918a85f9144c01f6cfe0f45e4f2838c7413961a8ff23bc0c6cdf8bb07a3b6",
            strip_prefix = "rules_cc-0.1.5",
            url = "https://github.com/bazelbuild/rules_cc/releases/download/0.1.5/rules_cc-0.1.5.tar.gz",
        )

    # -- Dependencies needed by WORKSPACE.bazel --------------------------------
    # These are loaded directly in the WORKSPACE file before transitive dep
    # macros (like p4c_deps, protobuf_deps) get a chance to define them.

    if not native.existing_rule("rules_foreign_cc"):
        http_archive(
            name = "rules_foreign_cc",
            sha256 = "d54742ffbdc6924f222d2179f0e10e911c5c659c4ae74158e9fe827aad862ac6",
            strip_prefix = "rules_foreign_cc-0.2.0",
            url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.2.0.tar.gz",
        )
    if not native.existing_rule("com_github_nelhage_rules_boost"):
        http_archive(
            name = "com_github_nelhage_rules_boost",
            url = "https://github.com/nelhage/rules_boost/archive/5160325dbdc8c9e499f9d9917d913f35f1785d52.zip",
            strip_prefix = "rules_boost-5160325dbdc8c9e499f9d9917d913f35f1785d52",
            sha256 = "feb4b1294684c79df7c1e08f1aec5da0da52021e33db59c88edbe86b4d1a017a",
        )
    if not native.existing_rule("rules_proto"):
        http_archive(
            name = "rules_proto",
            urls = [
                "https://github.com/bazelbuild/rules_proto/archive/5.3.0-21.7.tar.gz",
            ],
            strip_prefix = "rules_proto-5.3.0-21.7",
            sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",
        )
    if not native.existing_rule("rules_pkg"):
        http_archive(
            name = "rules_pkg",
            urls = [
                "https://github.com/bazelbuild/rules_pkg/releases/download/0.7.0/rules_pkg-0.7.0.tar.gz",
            ],
            sha256 = "8a298e832762eda1830597d64fe7db58178aa84cd5926d76d5b744d6558941c2",
        )
