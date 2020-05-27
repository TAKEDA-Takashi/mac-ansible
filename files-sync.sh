#!/usr/bin/env bash
#
# Required: $BASH_VERSION >= 4
#

set -eu

declare -A files=(
  ["roles/homebrew_cask/files/vscode/settings.json"]="${HOME}/Library/Application Support/Code/User/settings.json"
  ["roles/_private/files/aurl/profiles"]="${HOME}/.aurl/profiles"
  ["roles/_private/files/aws/config"]="${HOME}/.aws/config"
  ["roles/_private/files/aws/credentials"]="${HOME}/.aws/credentials"
  ["roles/_private/files/config/karabiner/karabiner.json"]="${HOME}/.config/karabiner/karabiner.json"
  ["roles/_private/files/config/com.googlecode.iterm2.plist"]="${HOME}/.config/com.googlecode.iterm2.plist"
  ["roles/_private/files/config/hub"]="${HOME}/.config/hub"
  ["roles/_private/files/ssh/config"]="${HOME}/.ssh/config"
)

function usage() {
  echo "Usage: $0 <command>"
  echo "command: diff cp"
  exit 1
}

declare mode=${1:-}

if [[ -z "$mode" ]]; then
  usage
fi

if [[ "$mode" = "diff" ]]; then
  # diffは差分があるとnot 0を返すためoffにする
  set +e

  for key in ${!files[@]}; do
    diff -u "$key" "${files[$key]}"
  done

  set -e
elif [[ "$mode" = "cp" ]]; then
  for key in ${!files[@]}; do
    cp "${files[$key]}" "$key"
  done
else
  usage
fi
