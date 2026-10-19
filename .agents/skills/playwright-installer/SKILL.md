---
name: playwright-installer
description: >-
  Create an initial playwright project with necessary dependencies and environment setup
---

# Playwright Installer

Create or update playwright with dependencies

## Workflow

**Golden rule:** Inform each step that is being executed.

### 1. Install playwright and its dependencies

Run `scripts/install_playwright.sh` to setup playwright localy:
- **Playwright** installation (latest stable version)
- **Playwright cli** installation (latest stable version)
- **Dependencies** (browsers) - local
- Install Typescript - local
- Initialize playwright
- Check initial playwright example
- Update playwright to latest version in case is already installed

Review the installation in `evals/evals.json` `install-request`.

### 2. Setup environment variables

Run `scripts/setup_env_variables.sh`:
- Install dotenv and @types/dotenv
- Create .env.example file

**Golden rule:** Only create file related to `assets/.env.example.template` AND do not update README AND do not remove any file (only if explicit asked).

Read `references/code.snippet.json` `dotenv` and update `playwright.config.ts` with dotenv code usage and do not remove any previous settings present in the file, ONLY integrate dotenv configuration.

Review installation in `eval/evals.json` `setup-env-var-request`.
