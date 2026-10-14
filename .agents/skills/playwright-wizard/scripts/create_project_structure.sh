#!/usr/bin/env bash
# create_project_structure.sh — Create project folders and files.
# Usage: bash create_project_structure.sh

set -euo pipefail

src="src"
project_root="${1:-$PWD}"
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
assets="$script_dir/../assets"

### -----------
### Prompt for project type
### -----------
prompt_project_type() {
  printf 'What type of project are you testing?\n'
  printf '  1) UI\n'
  printf '  2) REST API\n'
  printf '  3) Both\n'

  while true; do
    read -r -p 'Choose 1, 2, or 3: ' choice || {
      printf '\nNo project type selected.\n' >&2
      return 1
    }

    case "$choice" in
      1) project_type="ui"; return 0 ;;
      2) project_type="api"; return 0 ;;
      3) project_type="both"; return 0 ;;
      *) printf 'Invalid choice. Enter 1, 2, or 3.\n' ;;
    esac
  done
}

### -----------
### Create directories
### -----------
create_directories() {
  local directory

  for directory in "$@"; do
    mkdir -p -- "$directory"
    printf 'Directory ready: %s\n' "$directory"
  done
}

### -----------
### Create common directories for any type of project
### -----------
create_common_directories() {
  local directories=(
    "$src"
    "$src/fixtures"
    "$src/tests"
    "$src/types"
    "$src/utils"
  )

  create_directories "${directories[@]}"
}

### -----------
### Create directories for UI project
### -----------
create_ui_directories() {
  local directories=(
    "$src/pages"
    "$src/components"
  )

  create_directories "${directories[@]}"
}

### -----------
### Create directories for Rest API project
### -----------
create_api_directories() {
  local directories=(
    "$src/api"
  )

  create_directories "${directories[@]}"
}

### -----------
### Create project directories
### -----------
create_project_directories() {
  local project_type="$1"

  create_common_directories

  case "$project_type" in
    ui)
      create_ui_directories
      ;;
    api)
      create_api_directories
      ;;
    both)
      create_ui_directories
      create_api_directories
      ;;
  esac
}

### -----------
### Copy templates to its destination
### -----------
copy_template() {
  local template="$1"
  local destination="$2"

  cp -- "$assets/$template" "$destination"
  printf 'Created file: %s\n' "$destination"
}

### -----------
### Keep file in case already exists
### -----------
keep_existing_file() {
  printf 'Keeping existing file: %s\n' "$1"
}

### -----------
### Copy template to its destination in case is missing
### -----------
copy_template_if_missing() {
  local template="$1"
  local destination="$2"

  if [[ -e "$destination" ]]; then
    keep_existing_file "$destination"
  else
    copy_template "$template" "$destination"
  fi
}

### -----------
### Create project files: playwright config, tsconfig, .env, package.json
### -----------
create_project_files() {
  local -a templates=(
    "playwright.config.ts.template"
    "tsconfig.json.template"
    ".env.example.template"
    "package.json.template"
  )
  local -a destinations=(
    "playwright.config.ts"
    "tsconfig.json"
    ".env.example"
    "package.json"
  )
  local index

  for index in "${!templates[@]}"; do
    copy_template_if_missing "${templates[$index]}" "${destinations[$index]}"
  done
}

### -----------
### Main function
### -----------
main() {
  cd -- "$project_root"

  prompt_project_type
  create_project_directories "$project_type"
  create_project_files

  printf 'Project structure is ready for %s testing.\n' "$project_type"
}

main "$@"