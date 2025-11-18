#!/bin/sh
printf '\033c\033]0;%s\a' Astral
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Astral.x86_64" "$@"
