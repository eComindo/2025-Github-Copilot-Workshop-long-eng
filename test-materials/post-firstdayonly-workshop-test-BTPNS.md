# Post-FirstDayOnly Workshop Test - BTPNS

This post-workshop test contains 10 MCQs based on workshop content up to:
- Break and Discussion (#4)

Scope note:
- Included: all topics from workshop start through Break and Discussion (#4)
- Excluded: everything from "Implement Create PO page" and after

Each question has 5 options (A-E), with 1 correct answer and 4 distractors.

---

## Question 1 (Context and Prompting)
In the workshop, what is presented as the biggest reason AI-generated output misses expectations?

A. AI models are too slow for software teams.
B. The model cannot read repository files.
C. The main issue is usually the brief, not the AI itself.
D. The editor plugin is unstable for long prompts.
E. LLMs cannot handle domain-specific terms.

**Correct answer:** C

**Explanation:** The workshop emphasizes that most failures come from unclear or incomplete instructions, not from the model itself.

---

## Question 2 (Prompt Strategy)
Which prompting rule is explicitly recommended for this workshop when starting a new task?

A. Start coding immediately and document later.
B. Ask for a plan first, then implement in small checkpoints.
C. Avoid attaching files to reduce token usage.
D. Always ask for full implementation in one prompt.
E. Use only one-sentence prompts for consistency.

**Correct answer:** B

**Explanation:** The workshop guidance says to request a plan first and execute iteratively with validation checkpoints.

---

## Question 3 (Repository Setup)
Before implementation, participants are instructed to ensure key references are present. Which pair is explicitly called out?

A. docs/progress.md and docs/runbook.md
B. README.md and package-lock.json
C. docs/plan.md and .github/copilot-instructions.md
D. .github/agents and .github/prompts
E. tests/e2e and playwright.config.js

**Correct answer:** C

**Explanation:** The setup slide explicitly asks participants to ensure these two references are available.

---

## Question 4 (Database Bootstrap)
What is the intended outcome of running the Docker database bootstrap steps in the workshop?

A. Build frontend assets and run lint checks.
B. Recreate PostgreSQL volume, apply schema migration, and seed baseline data.
C. Generate Swagger specs from Fastify routes automatically.
D. Initialize Spec-Kit folders and constitution templates.
E. Install Node dependencies for backend and frontend.

**Correct answer:** B

**Explanation:** The database bootstrap section describes creating a fresh DB volume, applying migration, and inserting baseline sample data.

---

## Question 5 (Copilot Instructions)
Why does the workshop ask participants to improve .github/copilot-instructions.md before major implementation work?

A. To store environment variables for faster onboarding.
B. To force a specific VS Code theme for all participants.
C. To shape Copilot output with project context, testing, and documentation discipline.
D. To disable agent mode and keep only chat mode.
E. To replace all project documentation with one file.

**Correct answer:** C

**Explanation:** The instruction file is used as a quality and behavior guide so Copilot output aligns with project standards.

---

## Question 6 (Plan Mode and Agent Mode)
In the "Finalize Plan" flow, which sequence is correct?

A. Agent mode to code first, then Plan mode for summary.
B. Plan mode to validate task sequence, then Agent mode to save refined checklist.
C. Plan mode to run migrations, then Agent mode to commit changes.
D. Agent mode for branch creation, then Plan mode for API tests.
E. Plan mode and Agent mode are interchangeable with no intended order.

**Correct answer:** B

**Explanation:** The workshop explicitly shows Plan mode for refinement and Agent mode for saving docs/runbook.md.

---

## Question 7 (Agent Skills)
Which statement best reflects the workshop guidance on Agent Skills?

A. Skill files can have any filename as long as markdown is used.
B. Skills are optional comments inside copilot-instructions.md.
C. Skill files must be named SKILL.md and are loaded as specialized context.
D. Skills are only for backend frameworks and not frontend work.
E. Skills can only be used with Plan mode.

**Correct answer:** C

**Explanation:** The workshop notes that skill files must be named SKILL.md and provide structured, reusable task behavior.

---

## Question 8 (API Readiness)
Before PO implementation, participants are asked to add Swagger/OpenAPI support. What is the main practical reason?

A. To replace backend unit tests with UI checks.
B. To make endpoint contracts discoverable and verifiable at /api-docs.
C. To auto-generate production deployment scripts.
D. To enforce frontend coding style rules.
E. To initialize database seed data.

**Correct answer:** B

**Explanation:** API docs improve readiness by making baseline endpoints visible and testable before deeper integration.

---

## Question 9 (Figma MCP Setup)
According to the workshop, what must be confirmed before asking Copilot to use a Figma file through MCP?

A. Browser dark mode is enabled.
B. Local PostgreSQL is stopped and Docker is paused.
C. Figma login state, file/node accessibility, and access permissions.
D. Jest coverage is above 80%.
E. The frontend build is deployed to production.

**Correct answer:** C

**Explanation:** The setup notes explicitly call out login, accessibility of file/node IDs, and assigned access.

---

## Question 10 (Progress Review)
What is the workshop purpose of creating docs/progress.md before Break and Discussion (#4)?

A. To archive old branches and remove unresolved tasks.
B. To summarize implemented state and avoid redundant work.
C. To replace API documentation generated by Swagger.
D. To act as a substitute for test cases.
E. To store credentials for local development.

**Correct answer:** B

**Explanation:** The progress document provides shared current-state context for both team members and Copilot, reducing duplication.
