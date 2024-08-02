#!/bin/sh
echo -ne '\033c\033]0;icb-godot\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/zero-kelvin.arm32" "$@"
