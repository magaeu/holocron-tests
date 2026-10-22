#!/usr/bin/env bash
# Description: Create the Playwright workflow and composite action files from assets templates.
# Usage: bash scripts/create_pipeline_files.sh [project_root]

set -euo pipefail

project_root="${1:-$PWD}"
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
assets_dir="${script_dir}/../assets"
workflows_dir="${project_root}/.github/workflows"
actions_dir="${project_root}/.github/actions"

### -----------
### Copy template file as action file
### -----------
copy_template() {
  local template_path="$1"
  local destination_path="$2"

  if [[ ! -f "$template_path" ]]; then
    printf 'Error: template not found: %s\n' "$template_path" >&2
    return 1
  fi

  if [[ -e "$destination_path" ]]; then
    printf 'Keeping existing file: %s\n' "$destination_path"
    return 0
  fi

  mkdir -p -- "$(dirname -- "$destination_path")"
  cp -- "$template_path" "$destination_path"
  printf 'Created file: %s\n' "$destination_path"
}

### -----------
### Create action file
### -----------
create_action_files() {
  local actions_directory="$1"
  shift
  local action_name

  for action_name in "$@"; do
    copy_template \
      "${assets_dir}/${action_name}.template" \
      "${actions_directory}/${action_name}/action.yml"
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

  copy_template \
    "${assets_dir}/test-runner.template" \
    "${workflows_dir}/test-runner.yml"

  create_action_files "$actions_dir" "${action_names[@]}"
}

main