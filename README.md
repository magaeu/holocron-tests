<div align="center">

# holocron-tests

Reusable agent skills for setting up and building Playwright test projects.

[![GitHub stars](https://img.shields.io/github/stars/magaeu/holocron-tests?style=for-the-badge)](https://github.com/magaeu/holocron-tests/stargazers)

</div>

## What is this?

This repository contains agent skills for Playwright-based UI and API test automation. The skills cover installing Playwright, scaffolding a test project, designing an advanced E2E framework, and setting up GitHub Actions workflows.

## Quick Start

Clone the repository and open it in VS Code with GitHub Copilot:

```bash
git clone https://github.com/magaeu/holocron-tests.git
cd holocron-tests
```

Ask Copilot for the task you want to do, such as installing Playwright or creating a UI and API project structure. Skill instructions and supporting files are under `.agents/skills/`.

## Skills

| Skill | Purpose |
|-------|---------|
| [playwright-installer](.agents/skills/playwright-installer/SKILL.md) | Install Playwright, browsers, TypeScript, and environment-variable support. |
| [playwright-structurer](.agents/skills/playwright-structurer/SKILL.md) | Scaffold folders and configuration for UI, REST API, or combined test projects. |
| [playwright-wizard](.agents/skills/playwright-wizard/SKILL.md) | Route Playwright automation requests to the appropriate skill and workflow. |
| [readme-wizard](.agents/skills/readme-wizard/SKILL.md) | Generate or improve a project README using repository details. |

## Repository Structure

```text
.
├── .agents/
│   └── skills/
│       ├── playwright-installer/
│       ├── playwright-structurer/
│       ├── playwright-wizard/
│       └── readme-wizard/
├── .devcontainer/
├── .github/
├── .gitignore
├── README.md
└── skills-lock.json
```

Each skill directory contains a `SKILL.md` with its instructions. Installer and scaffolder skills also include scripts, templates, and references.

#### Disclaimer

This project is an ongoing project and is being updated constantly.


<p align="center">
  Made with ❤
</p>
