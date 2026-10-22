#!/usr/bin/env bash
# Description: Install dotenv and create a project-root .env.example file.
# Usage: bash setup_env_variables.sh [project_root]

set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly TEMPLATE_FILE="${SCRIPT_DIR}/../assets/.env.example.template"
project_root="${1:-$PWD}"
readonly EXAMPLE_FILE="${project_root}/.env.example"

### -----------
### Install dotenv library
### -----------
install_dotenv_dependencies() {
  printf 'Installing dotenv dependencies in %s\n' "$project_root"
  npm --prefix "$project_root" install --save-dev dotenv @types/dotenv
}

### -----------
### Copy .env.example template
### -----------
copy_environment_example() {
  if [[ ! -f "$TEMPLATE_FILE" ]]; then
    printf 'Error: template file not found: %s\n' "$TEMPLATE_FILE" >&2
    return 1
  fi

  if [[ -e "$EXAMPLE_FILE" ]]; then
    printf 'Keeping existing file: %s\n' "$EXAMPLE_FILE"
    return 0
  fi

  cp -- "$TEMPLATE_FILE" "$EXAMPLE_FILE"
  printf 'Created file: %s\n' "$EXAMPLE_FILE"
}

main() {
  install_dotenv_dependencies
  copy_environment_example
}

main "$@"