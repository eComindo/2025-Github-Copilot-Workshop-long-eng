author: Arie M. Prasetyo
summary: GitHub Copilot Workshop - Procurement MVP (Anteraja 2 x 4 Hours)
id: github-copilot-workshop-procurement-mvp
categories: AI, Development
environments: Web
status: Published
feedback link: https://example.com/feedback

# GitHub Copilot Workshop: Build a Procurement MVP


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## About this workshop
Duration: 10

Welcome. In this workshop, participants build a real-world procurement MVP using GitHub Copilot in VS Code and GitHub.

Application scope:
- Baseline provided: Home/Dashboard + PR module (list/create/detail + APIs)
- Participant backlog: PO module (list/create/detail + APIs)
- Optional extension: Bookmark feature (`PR | PO | GR`) via GitHub Issue workflow
- Further exploration: GR module (self-paced)

Tech stack:
- Backend: Fastify + JavaScript
- Frontend: Vue 3 + Vite + JavaScript
- Database: PostgreSQL in Docker
- Testing: Jest + Playwright
- Design: Figma + Figma MCP

> aside positive
>
> You can access the slide deck at [https://stghuniverse.z45.web.core.windows.net/#0](https://stghuniverse.z45.web.core.windows.net/#0) or [https://bit.ly/GitHubRecapJkt2025](https://bit.ly/GitHubRecapJkt2025)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## AI, LLM, and Context Basics
Duration: 15

Before hands-on coding, align on AI context:

- AI -> ML -> Deep Learning -> Transformer -> LLM
- LLMs predict the next token based on context
- Better context gives better output quality

Prompt anatomy in Copilot:
- System instructions: global behavior and constraints
- User message: immediate task objective
- Repository context: code, docs, config, commit history

Working rule for this workshop:
- Always attach relevant docs (`docs/plan.md`, runbook, schema notes)
- Ask for a plan first, then implement in small checkpoints
- Use validation prompts before merge

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Prerequisites
Duration: 5

- VS Code latest
- GitHub account + Copilot license
- Docker Desktop running
- Node.js 20+
- Git
- GitHub Copilot extension

Optional MCP tools:
- GitHub MCP Server
- Figma MCP integration available in Copilot/agent environment

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Fork the Repository
Duration: 5

Open the project URL: [https://github.com/eComindo/2026-github-copilot-workshop/issues](https://github.com/eComindo/2026-github-copilot-workshop/issues)

1. Open the project URL in your browser
2. Click **Fork** in the top right

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Setup the Project Locally
Duration: 20

### 1. Setup the repo

```bash
git clone https://github.com/<your-org-or-user>/<repo>.git
cd <repo>
git checkout -b feature/procurement-mvp
```

Ensure project references:
- `docs/plan.md`
- `.github/copilot-instructions.md`

### 2. Prepare the database

Bootstrap files used by all participants:
- `db/migrations/001_init_procurement_mvp.sql`
- `db/seeds/002_seed_procurement_mvp.sql`
- `docker/postgres/init/00-init-mvp-db.sh`

Cross-OS readiness note:
- Bootstrap supports Windows, macOS, Linux via LF line endings for `.sh` and `.sql` in `.gitattributes`

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 1)
Duration: 5

Facilitator prompts:
- What context gave Copilot the best responses so far?
- Where do participants usually lose time in project setup?
- Quick sharing: one AI-assisted workflow from your current team

Story prompt:
- DBS AI transformation headline and what changed in engineering culture

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Database Bootstrap using Docker
Duration: 10

Bootstrap workshop database (schema + sample data):

```bash
chmod +x docker/postgres/init/00-init-mvp-db.sh
docker compose down -v
docker compose up -d db
```

What this does:
- Creates PostgreSQL volume from scratch
- Applies baseline schema migration
- Inserts workshop sample data for Home/Dashboard + PR baseline

Verification:

```bash
docker compose exec -T db psql -U workshop -d procurement_mvp -c "SELECT COUNT(*) FROM purchase_requisitions;"
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Configure Local Credentials
Duration: 10

### TO-DO
- Run `npm install` in backend, frontend, and root (if monorepo scripts used)
- `npm run dev` can be run from root if preconfigured

Create backend `.env`:

```env
PORT=3000
DATABASE_URL=postgres://workshop:workshop@localhost:5433/procurement_mvp
```

Create frontend `.env`:

```env
VITE_API_BASE_URL=http://localhost:3000
```

Baseline expectation:
- Home/Dashboard works
- PR list/create/detail works
- PR APIs connected to DB

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Copilot Instructions Checklist
Duration: 15

Before implementation, update custom instructions to shape Copilot output quality.

Open `.github/copilot-instructions.md` and add rules such as:
- Always check `docs/plan.md` before large changes
- Add tests for new logic
- Use descriptive naming
- Update docs when introducing new flows

Prompt:

```text
Review this repository instruction file and improve it with a concise checklist for implementation quality, testing, and documentation discipline.
```

Expected outcome:
- Copilot responses become more consistent with project standards

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## SDD and Guardrail Documents
Duration: 15

Why this matters:
- Vibe-coded output is fast, but often inconsistent
- Product-grade output needs explicit software design documents (SDD)

Recommended pattern:
- Create and maintain spec docs before large features
- Keep guardrail docs for architecture, naming, and patterns
- Keep stack decisions and coding conventions in a dedicated docs folder

Copilot alignment:
- Point `.github/copilot-instructions.md` to these guardrail docs
- Ask Copilot to validate plan alignment before implementation

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## GitHub Spaces
Duration: 10

Use Copilot Spaces for onboarding and product brainstorming.

Create a space:
- Name: `Procurement MVP Onboarding`
- Attach: `README.md`, `docs/plan.md`

Prompt 1 (onboarding):

```text
Create a new team member onboarding summary for this repository.
Explain the business flow (PR -> PO -> GR), tech stack, and first 3 tasks.
```

Prompt 2 (brainstorming):

```text
For this procurement MVP, suggest 5 realistic enhancements for a future version.
Keep workshop scope unchanged and mark each as out-of-scope for today.
```

> aside positive
>
> Copilot Space is optional but useful for keeping planning context reusable across the team.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 2)
Duration: 5

Facilitator prompts:
- What info is best stored in Spaces vs in repository docs?
- Which onboarding summary output was most reusable?
- What enhancement ideas were realistic for your current team?

Story prompt:
- Forrester + DBS billion-dollar AI result and operating model changes

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Finalize Plan
Duration: 15

Use Copilot **Plan** mode with `docs/plan.md` attached.

Prompt:

```text
Validate this plan for an MVP.
Return a strict task sequence with checkpoints.
Focus implementation on PO backlog.
```

Then switch to **Agent** mode:

```text
Save the refined checklist to docs/runbook.md.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Agent Skills for Delivery
Duration: 15

Create a dedicated slide for agent skills in Copilot.

What to cover:
- How to add skills to the project
- Where to find available skills
- How to decide when to use a skill vs regular prompts

Examples:
- README/documentation skill
- Vue frontend implementation skill
- Backend API/service skill
- Figma implementation skill

Reference:
- Figma skill: https://github.com/openai/skills/blob/main/skills/.curated/figma-implement-design/SKILL.md

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## API Readiness Check
Duration: 15

Goal:
- Validate backend API before PO implementation
- Let participants practice generating API docs with Copilot

Participant task:
1. Ask Copilot to add Swagger/OpenAPI support
2. Start backend and open Swagger UI
3. Verify baseline PR endpoints are listed and callable

Prompt example:

```text
Add Swagger/OpenAPI support to this Fastify JavaScript backend.
Use @fastify/swagger and @fastify/swagger-ui.
Register plugins in the main bootstrap file and expose docs at /docs.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Figma MCP Setup
Duration: 15

Checklist:
- Confirm Figma MCP is available in current Copilot environment
- Add MCP config in `mcp.json` if needed
- Confirm user is logged in to Figma
- Confirm workshop file and node IDs are accessible

Expected result:
- Everyone can generate PO Create UI from the same source

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 3)
Duration: 5

Facilitator prompts:
- What should be generated from design vs handwritten in project style?
- How do skills change prompt quality for implementation?
- Where did participants get blocked in API and MCP setup?

Story prompt:
- Grab 2024 AI acceleration and impact on product iteration speed

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Generate Page using Figma MCP
Duration: 20

Participants start PO module by generating **PO Create page** from Figma using MCP.

Scope for generated page:
- Header section (vendor, PO date, notes)
- Line table section (approved PR open lines, allocate qty, unit price)
- Actions (save draft, submit)

Figma file:
- https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?m=auto&t=isYVX9I2o61eq0Vu-6.

Prompt:

```text
Using Figma MCP, generate Vue code for the PO Create page from this Figma file.
Include reusable components for header form and line allocation table.
Do not implement API calls yet. Keep structure simple.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## PO Testing with Copilot (Unit + Jest)
Duration: 20

Merged testing segment.

UI component test targets:
1. Header component renders required fields
2. Line table component adds/removes rows
3. Allocation input blocks invalid values

Service/Jest test targets:
1. Reject over-allocation in PO creation
2. Reject invalid PO status transition
3. Accept valid allocation and status transition path

Prompt:

```text
Create unit tests for Vue PO Create components and Jest tests for PO service validation.
Focus on rendering, line add/remove behavior, over-allocation validation, and status transition rules.
Keep tests readable.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Baseline Review + PO Backlog Start
Duration: 25

Task:
- Explore project structure
- Identify extension points for PO routes/services/pages
- Confirm API client and routing patterns

Prompt:

```text
Analyze this repository and summarize what is already implemented.
Propose a minimal implementation plan for PO list/create/detail pages and PO endpoints only.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 4)
Duration: 5

Facilitator prompts:
- Which tests caught real defects before integration?
- What was hardest in PO backlog decomposition?
- Which prompts generated the most maintainable code?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Implement PO Module
Duration: 45

PO endpoints (participant scope):
- `POST /api/purchase-orders`
- `POST /api/purchase-orders/:id/submit`
- `GET /api/purchase-orders/:id`
- `GET /api/purchase-orders/:id/open-lines`

Required rule:
- PO allocation qty <= PR line remaining qty

Prompt:

```text
Implement Purchase Order module.
Create PO service + routes for create, submit, detail, and open-lines.
Enforce over-allocation validation against PR remaining quantities.
Return 422 for rule violations with clear messages.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 5)
Duration: 5

Facilitator prompts:
- Which PO validation rule should always be server-side?
- Where should business-rule tests live: route or service?
- How do we keep generated code aligned with API contracts?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Build PO Pages
Duration: 35

Build and connect:
- PO List page
- PO Create page (generated from Figma MCP, now wired to APIs)
- PO Detail page

Prompt:

```text
Implement PO list/detail pages in Vue using existing patterns.
For PO Create page, keep generated Figma components and wire them to purchase order APIs.
Keep UI simple for clarity.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Git Hooks Mini Demo
Duration: 10

Small demo before GitHub Actions discussion.

Objective:
- Show local pre-push checks can block low-quality pushes quickly

Demo flow:
1. Show `.githooks/pre-push`
2. Push with failing tests to show block
3. Fix tests and push again

Key message:
- Combining local hooks and GitHub Actions gives stronger quality gates

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Code Quality Primer
Duration: 10

What to explain before CodeQL demo:
- Code quality checks in GitHub
- Code scanning concepts
- Why semantic analysis (CodeQL) catches deeper problems

Also cover:
- Where participants read action logs
- How to interpret security severity and remediation guidance

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Code Quality, Code Scanning, CodeQL
Duration: 20

Enable and run checks:
- Enable Code quality and Code scanning features in GitHub
- Ensure CodeQL analysis is available in your environment

Very important demo:
1. Attempt to commit or push a hardcoded API key (demo branch only)
2. Show secret scanning push protection block
3. Run CodeQL on intentionally vulnerable code
4. Open Security tab and review findings
5. Show how findings flow into PR remediation conversation

Actions walkthrough:
- Open `Actions` tab and inspect scan jobs
- Explain server-side enforcement and audit trail

Branch note:
- Make sure `.github/workflows/codeql.yml` is not pre-existing on `main` before the demo if your scenario requires generating it during workshop.

Prompt to generate workflow (if not present):

```text
Create a GitHub Actions workflow for JavaScript CodeQL analysis.
Run on push and pull_request for main and feature branches.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 6)
Duration: 5

Facilitator prompts:
- What belongs in local hooks vs cloud checks?
- What scan result would you fix first in MVP context?
- How do you avoid demo-only vulnerabilities leaking to mainline?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Copilot PR summary, review, and commit message
Duration: 15

Use GitHub Copilot for:
- VS Code commit message generation
- PR summary generation
- PR review comments

Suggested flow:
1. Stage changes in VS Code Source Control
2. Generate commit message with Copilot button
3. Push branch and open PR
4. Generate PR summary with Copilot
5. Request Copilot as reviewer
6. Triage comments and apply follow-up commit

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## GitHub Issue (Security Hardening)
Duration: 15

Create issue example:
- Title: `Security Hardening: Remove hardcoded secrets and tighten validation`

Include in issue description:
- Problem statement
- Current risk
- Proposed remediation
- Acceptance criteria

Then:
- Assign to Copilot
- Review generated branch/PR
- Link issue to remediation PR and security findings

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (Hour 7)
Duration: 5

Facilitator prompts:
- What PR review comments from Copilot were most useful?
- How should teams triage security findings into issue backlog?
- Which guardrails gave the highest confidence today?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Creating E2E test with Copilot
Duration: 15

Create dedicated Playwright spec:
- `tests/e2e/po-module.spec.js`

Required scenarios:
1. Happy path: create + submit PO from approved PR data
2. Negative path: reject over-allocation qty

Prompt:

```text
Create tests/e2e/po-module.spec.js using @playwright/test.
Add happy path and negative over-allocation path with stable selectors and clear assertions.
```

Artifacts:
- HTML report: `playwright-report/index.html`
- Screenshots/traces/videos: `test-results/`

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Product Documentation
Duration: 10

In Agent mode, ask Copilot to generate implementation docs with diagrams.

Prompt:

```text
Create documentation for how the current application works.
Add a user flow chart and sequence diagram in Mermaid.
Save as markdown.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Prompt Files and Custom Agents (Optional)
Duration: 10

Optional extension:
- Create prompt files for reusable tasks
- Create custom agents for repeated work patterns

Example prompt file:
- `.github/prompts/explain-code.prompt.md`

Example custom agent:
- `.github/agents/readme-creator-agent.md`

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Further Exploration: GR Module
Duration: 10

Not part of mandatory workshop backlog.

Self-paced challenge:
- Implement GR create/detail/post endpoints
- Build GR list/create/detail pages
- Add validation: received qty <= PO open qty

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Wrap-up, Retrospective, and Next Steps
Duration: 10

What participants accomplished:
- Started from a working baseline with JavaScript stack
- Delivered PO backlog module end-to-end
- Used Copilot Spaces for onboarding and brainstorming
- Added PO-focused unit/Jest/Playwright tests
- Practiced PR review and CodeQL security workflow

Suggested next iteration:
- Add role-based authorization
- Add pagination and filtering
- Add better error boundary handling
- Add CI for Jest + Playwright in GitHub Actions

Resources:
- GitHub Copilot docs: https://docs.github.com/copilot
- Copilot Spaces: https://github.com/copilot/spaces
- CodeQL docs: https://docs.github.com/code-security/code-scanning/introduction-to-code-scanning/about-codeql
- Playwright docs: https://playwright.dev

Great work!
