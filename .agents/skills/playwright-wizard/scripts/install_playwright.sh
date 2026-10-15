#!/usr/bin/env bash
# install_playwright.sh — Install Playwright when it is not already available.
# Usage: bash install_playwright.sh

set -euo pipefail

readonly playwright_bin="./node_modules/.bin/playwright"
readonly -a install_command=(npm init playwright@latest -- --quiet --lang TypeScript)
readonly -a update_command=(npm install -D @playwright/test@latest)
readonly -a install_dependencies_command=(npx playwright install --with-deps)
readonly -a install_typescript_command=(npm install --save-dev typescript)
readonly -a run_test_command=(npx playwright test)
readonly -a check_installed_version_command=(npx playwright --version)

### -----------
### Print step status
### -----------
run_step() {
  local description=$1
  shift

  printf 'Starting: %s\n' "$description" >&2

  if "$@"; then
    printf 'Finished: %s\n' "$description" >&2
  else
    local status=$?
    printf 'Failed: %s (exit status %d).\n' "$description" "$status" >&2
    return "$status"
  fi
}

### -----------
### Update Playwright to the latest version.
### -----------
update_playwright() {
  run_step 'Updating Playwright' "${update_command[@]}"
}

### -----------
### Initialize a new Playwright project.
### -----------
install_playwright() {
  printf '%s\n' \
    'Initializing Playwright with quiet defaults:' \
    '  Language: TypeScript' \
    '  Test directory: tests' \
    '  GitHub Actions workflow: not enabled'

  run_step 'Initializing Playwright' "${install_command[@]}"
}

### -----------
### Install Playwright's browser dependencies.
### -----------
install_playwright_dependencies() {
  run_step 'Installing Playwright browser dependencies' \
    "${install_dependencies_command[@]}"
}

### -----------
### Install typescript
### -----------
install_typescript() {
  run_step 'Installing Typescript' \
    "${install_typescript_command[@]}"
}

### -----------
### Run the generated example test.
### -----------
run_playwright_example() {
  run_step 'Running the Playwright example test' "${run_test_command[@]}"
}

### -----------
### Print the installed Playwright version.
### -----------
check_installed_version() {
  local playwright_version

  if ! playwright_version=$(
    run_step 'Checking the Playwright version' \
      "${check_installed_version_command[@]}"
  ); then
    printf 'Could not verify the Playwright installation.\n' >&2
    return 1
  fi

  printf 'Playwright is ready (%s).\n' "$playwright_version"
}

main() {
  if [[ -x "$playwright_bin" ]]; then
    update_playwright || return 1
  else
    install_playwright || return 1
    install_playwright_dependencies || return 1
    install_typescript || return 1
    run_playwright_example || return 1
  fi

  check_installed_version
}

main
