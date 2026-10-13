---
name: playwright-wizard
description: >-
  Create an initial playwright project structure that is scalable and follow well-known common practices
---

# Playwright Wizard

Create or improve playwright project structure

## Workflow

### 1. Install playwright and its dependencies

Run `scripts/install_playwright.sh` to setup playwright:
- **Playwright** installation (latest stable version)
- **Dependencies** (browsers)
- Initialize playwright
- Check initial playwright example
- Update playwright to latest version in case is already installed

<!-- ### 2. Read the best practices guide

Read `references/readme-best-practices.md` before writing. It covers structure, tone, project-type adaptation, and common pitfalls. This context makes a real difference in output quality — the guide explains the reasoning behind each section so you produce READMEs that feel intentional rather than formulaic.

### 3. Build the README

Use `assets/readme-template.md` as the base structure. Replace `{{PLACEHOLDER}}` markers with actual project data from the scan.

When rendering the project tree, keep it close to how people browse repos: list directories before files, alphabetize within each group, and add trailing `/` markers for directories.

**Adapt — don't copy blindly.** The template is a starting point. Drop sections that don't apply (e.g., no Contributing section for a personal notes repo) and adjust the tone to match the project:
- **Libraries/frameworks**: Focus on installation, API, and examples
- **Applications**: Focus on setup, configuration, and screenshots
- **Docs/learning repos**: Focus on structure and navigation
- **Small utilities/scripts**: Keep it short — hero + what it does + usage is enough

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
