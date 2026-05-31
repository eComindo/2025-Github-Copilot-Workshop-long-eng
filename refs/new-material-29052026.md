based on the following url https://simplydemo.secure.simplybook.me/v2/dashboard/new, create a comprehensive specification of the full website with the following structure template

```
specs/
└── features/
    ├── README.md                          # Feature catalog / index
    ├── _template/                         # Boilerplate for new features
    │   └── feature-template.md
    │
    └── F-001-online-booking/              # One folder per feature
        ├── overview.md                    # Summary, goals, value prop
        ├── user-stories.md                # Stories + acceptance criteria
        ├── screens.md                     # Screens involved + states
        ├── wireframes/                    # Visual mockups
        │   ├── 01-service-select.png
        │   ├── 02-time-pick.png
        │   └── 03-confirmation.png
        ├── business-rules.md              # Logic, validations, policies
        ├── data-model.md                  # Entities, fields, relationships
        ├── edge-cases.md                  # Error states, empty, conflicts
        ├── permissions.md                 # Who can do what (RBAC)
        ├── notifications.md               # Emails, SMS, in-app triggers
        ├── analytics.md                   # Events tracked, KPIs
        ├── dependencies.md                # Other features, 3rd parties
        ├── test-scenarios.md              # Gherkin / acceptance tests
        └── open-questions.md
```

using chrome devtools mcp and the following credentials login: admin, password: demo