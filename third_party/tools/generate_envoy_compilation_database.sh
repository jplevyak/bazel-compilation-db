#!/bin/bash

# Generates a compile_commands.json file at $(bazel info execution_root) for
# your Clang tooling needs.

set -e

bazel build \
  --experimental_action_listener=//third_party/tools/generate_compile_commands:extract_json \
  --noshow_progress \
  --noshow_loading_progress \
  //source/exe:envoy-static //test/... > /dev/null

pushd $(bazel info execution_root) > /dev/null
echo "[" > compile_commands.json
find . -name '*.compile_command.json' -exec bash -c 'cat {} && echo ,' \; >> compile_commands.json
sed -i '$s/,$//' compile_commands.json
echo "]" >> compile_commands.json
popd > /dev/null
cp $(bazel info execution_root)/compile_commands.json .
