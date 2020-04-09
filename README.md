# bazel-compilation-db
Generate `compile_commands.json` and run clang-tidy with [Bazel][bazel].
This is an adaptation of [Kythe][kythe]'s approach with a small patch to support the latest version of Bazel.

This is specialied for envoy: github.com/envoyproxy/envoy

1. Copy `third_party` to your repository directory.
2. From the repository base run `third_party/tools/generate_compilation_database.sh`.

[bazel]: https://bazel.build/
[kythe]: https://github.com/google/kythe
