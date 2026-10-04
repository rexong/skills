#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
target_dir="${HOME}/.agents/skills"
mkdir -p -- "$target_dir"

for skill_dir in "$repo_dir"/*/; do
  [[ -f "${skill_dir}SKILL.md" ]] || continue
  skill_name="$(basename -- "$skill_dir")"
  target="${target_dir}/${skill_name}"
  if [[ -L "$target" && "$(readlink -f -- "$target")" == "$(readlink -f -- "$skill_dir")" ]]; then
    printf 'Already linked: %s\n' "$skill_name"
  elif [[ -e "$target" || -L "$target" ]]; then
    printf 'Skipped %s: %s already exists. Move it aside before rerunning.\n' "$skill_name" "$target" >&2
  else
    ln -s -- "${skill_dir%/}" "$target"
    printf 'Linked %s -> %s\n' "$target" "${skill_dir%/}"
  fi
done
