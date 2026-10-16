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

Run `scripts/install_playwright.sh` to setup playwright:
- **Playwright** installation (latest stable version) - local
- **Dependencies** (browsers) - local
- Install Typescript - local
- Initialize playwright
- Check initial playwright example
- Update playwright to latest version in case is already installed

Review the installation in `evals/evals.json` `install-request`.

### 2. Create project structure based on test type

Run `scripts/create_project_structure.sh`:
- Prompts for UI, REST API, or both.
- Creates the common `src/fixtures`, `src/tests`, `src/types`, and `src/utils` directories.
- Creates `src/pages` and `src/components` for UI testing, and `src/api` for REST API testing.
- Creates `playwright.config.ts`, `tsconfig.json`, and `package.json` only when they do not already exist.

Read `assets/project-structure-template.md` to confirm that correct project structure based on test type was created.

**Golden rule:** Only create folders and files that were explicited mention in previous steps `assets/project-structure-template.md` AND do not update README and do not remove any file (only if explicit asked).

Review installation in `evals/evals.json` `create-structure-request`.

Update `playwright.config.ts` file to use "testDir: `.src/tests'` instead of `testDir: './tests'`.

### 3. Setup environment variables

Run `scripts/setup_env_variables.sh`:
- Install dotenv and @types/dotenv
- Create .env.example file

**Golden rule:** Only create file related to `assets/.env.example.template` AND do not update README AND do not remove any file (only if explicit asked).

Read `references/code.snippet.json` `dotenv` and update `playwright.config.ts` with dotenv code usage and do not remove any previous settings present in the file, ONLY integrate dotenv configuration.

Review installation in `eval/evals.json` `setup-env-var-request`.
