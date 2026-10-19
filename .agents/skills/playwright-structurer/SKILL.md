---
name: playwright-structurer
description: >-
  Create a scaffolding folder structure based on well-known practices to promote maintainability and reliability.
---

# Playwright Structurer

Create scaffolding folder structure for UI and/or REST Api applications.

## Workflow

**Golden rule:** Inform each step that is being executed.

### 1. Create project structure based on test type

Run `scripts/create_project_structure.sh`:
- Prompts for UI, REST API, or both.
- Creates the common `src/fixtures`, `src/tests`, `src/types`, and `src/utils` directories.
- Creates `src/pages` and `src/components` for UI testing, and `src/api` for REST API testing.
- Creates `playwright.config.ts`, `tsconfig.json`, and `package.json` only when they do not already exist.

Read `references/project-structure-template.md` to confirm that correct project structure based on test type was created.

**Golden rule:** Only create folders and files that were explicited mention in previous steps `references/project-structure-template.md` AND do not update README and do not remove any file (only if explicit asked).

Review installation in `evals/evals.json` `create-structure-request`.

### 2. Update existing files

Update `playwright.config.ts` file to use "testDir: `.src/tests'` instead of `testDir: './tests'`.

Update `playwright.config.ts` file `use` with `playwright.config.ts.template`.

Update `playwright.config.ts` file `reporter` with `playwright.config.ts.template`.

Check if files were up-to-date correctly.