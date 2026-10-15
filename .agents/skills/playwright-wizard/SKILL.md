---
name: playwright-wizard
description: >-
  Create an initial playwright project structure that is scalable and follow well-known common practices
---

# Playwright Wizard

Create or improve playwright project structure

## Workflow

**Golden rule:** Inform each step that is being executed.

### 1. Install playwright and its dependencies

Run `scripts/install_playwright.sh` to setup playwright:
- **Playwright** installation (latest stable version)
- **Dependencies** (browsers)
- Initialize playwright
- Check initial playwright example
- Update playwright to latest version in case is already installed

Review the installation in `evals/evals.json` `install-request`.

### 2. Create project structure based on test type

Run `scripts/create_project_structure.sh`:
- Prompts for UI, REST API, or both.
- Creates the common `src/fixtures`, `src/tests`, and `src/utils` directories.
- Creates `src/pages` and `src/components` for UI testing, and `src/api` for REST API testing.
- Creates `playwright.config.ts`, `tsconfig.json`, `.env.example`, and `package.json` only when they do not already exist.
- Accepts an optional project-root path; defaults to the current directory.

Read `assets/project-structure-template.md` to confirm that the correct project structure based on test type was created.

**Golden rule:** Only create folders and files that were explicited mention in previous steps `assets/project-structure-template.md` AND do not update README and do not remove any file (only if explicit asked).

Review installation in `evals/evals.json` `create-structure-request`.

Update `playwright.config.ts` file to use "testDir: `.src/tests'` instead of `testDir: './tests'`,

### 3. Setup environment variables

Run `scripts/setup_env_variables.sh`:
- Install dotenv and @types/dotenv
- Create .env.example file

**Golden rule:** Only create file related to `assets/.env.example.template` AND do not update README AND do not remove any file (only if explicit asked).

Read `references/code.snippet.json` `dotenv` and update `playwright.config.ts` with dotenv code usage and do not remove any previous settings present in the file, ONLY integrate dotenv configuration.

Review installation in `eval/evals.json` `setup-env-var-request`.

<!-- ### 3. Check example test with project structure

Copy `example.spec.ts` file to `src/tests/` directory
Remove `tests/` directory.
Run `example.spec.ts` to check playwright project structure

### 4. Create scafolding files based on test type

Run `scripts/create_scafolding_files.sh`:
- Create scafolding base files with simple sintax.

 ### 4. Add badges

Read `assets/badges.json` for the full badge catalog organized by category (status, social, extras) with `{{PLACEHOLDER}}` markers for dynamic values. Use `style=for-the-badge` for all badges.

**Golden rule:** Only include badges for things that actually exist. A badge for a nonexistent CI workflow or a guessed npm package is worse than no badge at all.

### 5. Validate the output

Review the generated README against the assertions in `evals/evals.json`. Verify:
- No placeholder text remains (`{{PROJECT_NAME}}`, `TODO`, etc.)
- All badges point to real shields.io URLs for things that actually exist
- Sections are proportional to the project — a simple script doesn't need a 200-line README
- Social badges only appear if social links were found in the scan
- The tone is concise and direct, not marketing fluff

### 6. Optionally add a diagram

Only read `assets/diagrams.md` if the project has multiple components or a clear data flow (APIs, monorepos, content pipelines). Skip entirely for simple projects. Generate the diagram from the project's actual structure — the templates in the file are starting points to adapt, not copy. -->
