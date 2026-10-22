#!/usr/bin/env bash
# Description: Create the Playwright GitHub Actions workflow and action folders.
# Usage: bash scripts/create_pipeline_folders.sh [project_root]

set -euo pipefail

project_root="${1:-$PWD}"
github_dir="${project_root}/.github"
workflows_dir="${github_dir}/workflows"
actions_dir="${github_dir}/actions"

### -----------
### Create directory
### -----------
create_directory() {
  local directory="$1"
  mkdir -p -- "$directory"
  printf 'Directory ready: %s\n' "$directory"
}

### -----------
### Create actions directory from list
### -----------
create_action_directories() {
  local actions_directory="$1"
  shift
  local action_name

  for action_name in "$@"; do
    create_directory "${actions_directory}/${action_name}"
  done
}

main() {
  local -a action_names=(
    "setup-ci"
    "smoke-tests"
    "sanity-tests"
    "regression-tests"
    "report"
  )

  create_directory "$workflows_dir"
  create_directory "$actions_dir"
  create_action_directories "$actions_dir" "${action_names[@]}"
}

main