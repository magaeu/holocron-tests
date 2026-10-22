---
name: playwright-integrator
description: >-
  Create github action workflows to run smoke, sanity and regression tests with reports.
---

# Playwright Integrator

Create github action workflows. Main flow ci-setup. Smoke, sanity and regression use ci-setup due caching dependencies. Smoke, sanity and regression are not executed in one flow.

## Workflow

**Golden rule:** Inform each step that is being executed.

### 1. Create workflows and actions folders

Read `scripts/create_pipeline_folders.sh`:
- Create `.github/workflows` folder.
- Create `.github/actions` folder.

Check step according `evals/evals.json` `create-pipeline-folders-request`.

### 2. Create workflows and actions files

Read `scripts/create_pipeline_files.sh`:
- Create `.github/workflows/test-runner.yml` file.
- Create `.github/actions/setup-ci/action.yml` file.
- Create `.github/actions/smoke-tests/action.yml` file.
- Create `.github/actions/sanity-tests/action.yml` file.
- Create `.github/actions/regression-tests/action.yml` file.
- Create `.github/actions/report/action.yml` file.

Check step according `evals/evals.json` `create-pipeline-files-request`. DO NOT change templates.

### 3. Update package.json

Read `package.json` and update `scripts` section according to `references/code.snippet.json`.

Check if `package.json` was updated correctly. DO NOT update other sections OR add not mentioned scripts.
