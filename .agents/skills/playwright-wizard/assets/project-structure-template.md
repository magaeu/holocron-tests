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
├── Jenkinsfile                   # Jenkins pipeline
│
├── src/
│   ├── pages/                    # Layer 2: Locators & basic actions
│   │   ├── base.page.ts           # Abstract base page
│   │   ├── login.page.ts
│   │
│   ├── components/                  # Layer 3: Business logic
│   │   ├── login.component.ts
│   │
│   ├── tests/                    # Test specifications
│   │   ├── log.in.spec.ts
│   │
│   ├── types/                      # Layer 5: API testing
│   │   ├── user.ts
│   │
│   ├── api/                      # Layer 5: API testing
│   │   ├── auth.api.ts
│   │
│   ├── utils/                    # Layer 4: Utilities
│   │   ├── logger.ts
│   │   ├── wait.helper.ts
│   │   ├── data.generator.ts
│   │   ├── api.helper.ts
│   │   ├── custom.reporter.ts
│   │
│   ├── fixtures/                 # Layer 6: Custom fixtures
│   │   ├── auth.fixture.ts
│   │
│   ├── config/                   # Layer 1: Configuration
│   │   ├── index.ts
│   │   ├── authors.ts
│   │   └── test.groups.ts
│   │
│   └── test-data/                 # Test data files
│       ├── users.json
│       ├── products.json
│       └── types.ts
│
├── custom-reports/                   # Custom HTML reports
└── test-results/                 # JSON results & artifacts
```