#!/usr/bin/env bash
# install_playwright.sh — Install Playwright when it is not already available.
# Usage: bash install_playwright.sh

set -euo pipefail

playwright_bin="./node_modules/.bin/playwright"
install_command=(npm init playwright@latest)
install_answers=$'\n\nn\ny\nn\n'
install_dependencies_command=(npx playwright install --with-deps)
run_test_command=(npx playwright test)
check_installed_version_command=(npx playwright --version)

### -----------
### Install playwright
### -----------

install_playwright() {
  if ! printf '%s' "$install_answers" | "${install_command[@]}"; then
    printf 'Playwright initialization failed.\n' >&2
    return 1
  fi
}

if [[ -x "$playwright_bin" ]]; then
  "$playwright_bin" --version
else
  install_playwright
fi

### -----------
### Install playwright dependencies
### -----------

if ! "${install_dependencies_command[@]}"; then
  printf 'Playwright dependency installation failed. Please verify the Playwright installation.\n' >&2
  exit 1
fi

### -----------
### Run playwright test example
### -----------

if ! "${run_test_command[@]}"; then
  printf 'Playwright example test failed. Please verify the Playwright installation.\n' >&2
  exit 1
fi

### -----------
### Check installed version
### -----------
if playwright_version=$("${check_installed_version_command[@]}"); then
  printf 'Playwright was successfully installed (%s).\n' "$playwright_version"
else
  printf 'Could not verify the Playwright installation.\n' >&2
  exit 1
fi
