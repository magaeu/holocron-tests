#!/usr/bin/env bash
# setup_env_variables.sh — Install dotenv and dotenv types.
# Usage: bash setup_env_variables.sh

set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly TEMPLATE_FILE="${SCRIPT_DIR}/.env.example.template"
readonly EXAMPLE_FILE="${SCRIPT_DIR}/.env.example"

### -----------
### Install dotenv library
### -----------
install_dotenv_dependencies() {
  printf 'Installing dotenv library on local...'
  npm install --save-dev dotenv
  npm install --save-dev @types/dotenv
}

### -----------
### Copy .env.example template
### -----------
copy_environment_example() {
  if [[ ! -f "$TEMPLATE_FILE" ]]; then
    printf 'Error: template file not found: %s\n' "$TEMPLATE_FILE" >&2
    return 1
  fi

  cp -- "$TEMPLATE_FILE" "$EXAMPLE_FILE"
}

main() {
  install_dotenv_dependencies
  copy_environment_example
}

main "$@"