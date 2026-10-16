## Project Structure

```
{{PROJECT_ROOT}}/
├── playwright.config.ts          # Playwright configuration
├── tsconfig.json                 # TypeScript config with path aliases
├── .env                          # Environment variables
├── .env.example                  # Environment template
├── package.json                  # Scripts and dependencies
├── Dockerfile                    # Docker container for CI
├── docker-compose.yml            # Parallel shard execution
│
├── src/
│   ├── pages/                    # Page Object Model (POM)
│   │   ├── base.page.ts          # Abstract base page
│   │   ├── login.page.ts
│   │
│   ├── components/               # Shared components
│   │   └── login.component.ts
│   │
│   ├── tests/                    # Test specifications
│   │   └── log.in.spec.ts
│   │
│   ├── types/                    # Type safe files
│   │   └── user.ts
│   │
│   ├── api/                      # REST API
│   │   └── auth.api.ts
│   │
│   ├── utils/                    # Utilities
│   │   ├── logger.ts
│   │   ├── wait.helper.ts
│   │   ├── data.generator.ts
│   │   ├── api.helper.ts
│   │   └── custom.reporter.ts
│   │
│   ├── fixtures/                 # Custom fixtures
│   │   └── auth.fixture.ts
│   │
│   ├── config/                   # Configuration
│   │   ├── authors.ts
│   │   └── test.groups.ts
│   │
│   └── test-data/                # Test data files
│       ├── users.json
│       └── products.json
│
├── custom-reports/               # Custom HTML reports
└── test-results/                 # JSON results & artifacts
```