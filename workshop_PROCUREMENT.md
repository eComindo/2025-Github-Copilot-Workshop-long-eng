author: Arie M. Prasetyo
summary: GitHub Copilot Workshop - 5 Hours Procurement MVP (VS Code + GitHub)
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

Welcome! In this workshop, participants build a real-world procurement MVP using GitHub Copilot in both VS Code and GitHub.

Application scope:
- Baseline provided: Home/Dashboard + PR module (list/create/detail + APIs)
- Participant backlog: PO module (list/create/detail + APIs)
- Optional extension: Bookmark feature (`PR | PO | GR`) via GitHub Issue workflow
- Further exploration: GR module (self-paced after workshop)

Tech stack:
- Backend: Fastify + JavaScript
- Frontend: Vue 3 + Vite + JavaScript
- Database: PostgreSQL in Docker
- Testing: Jest + Playwright
- Design: Figma + Figma MCP

> aside positive
>
> You can access this slides at [https://stghuniverse.z45.web.core.windows.net/#0](https://stghuniverse.z45.web.core.windows.net/#0) or [https://bit.ly/GitHubRecapJkt2025](https://bit.ly/GitHubRecapJkt2025)

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

First, open the project URL: [https://github.com/eComindo/2026-github-copilot-workshop/issues](https://github.com/eComindo/2026-github-copilot-workshop/issues) in your browser and fork the repository:

1. Open the project URL in your browser
2. Click the **Fork** button in the top right

---

## Setup the Project Locally
Duration: 20


### 1. Setup the repo

After the project's repo is forked, clone it to your local machine.

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
- Workshop bootstrap supports Windows, macOS, and Linux participants by enforcing LF line endings for `.sh` and `.sql` via `.gitattributes`.
- If the DB init script cannot execute on a participant machine, run:

> aside positive
>
> We pre-provide baseline migration + seed and run them automatically via Docker init so everyone starts with the same working dataset.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Database Bootstrap using Docker
Duration: 10

### **TO-DO**
- Optional: use DBeaver to see the result
- Pastikan Postgre service tidak running, hanya yang di docker

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
- Runs via container init script (`/docker-entrypoint-initdb.d/00-init-mvp-db.sh`) to keep bootstrap behavior consistent across OS hosts

Verification command:

```bash
docker compose exec -T db psql -U workshop -d procurement_mvp -c "SELECT COUNT(*) FROM purchase_requisitions;"
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Configure Local Credentials
Duration: 10

### **TO-DO**
- jalankan npm install di tiga tempat: be, fe, root
- npm run dev can be run from root

Create backend `.env`:

```env
PORT=3000
DATABASE_URL=postgres://workshop:workshop@localhost:5433/procurement_mvp
```

Create frontend `.env`:

```env
VITE_API_BASE_URL=http://localhost:3000
```

Run baseline apps and verify prebuilt modules:

```bash
# backend
npm run dev

# frontend (new terminal)
npm run dev
```

Baseline expectation:
- Home/Dashboard works
- PR list/create/detail pages work
- PR APIs already connected to provided database


---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Copilot Instructions
Duration: 10

Duration: 5

Before we start implementing the plan using Copilot, let's update the [custom instruction](https://docs.github.com/en/copilot/tutorials/customization-library/custom-instructions/your-first-custom-instructions) file.

Open the file `.github/copilot-instructions` and add these lines:

```
Before making any big changes to the project, always check the documentation in `docs/plan.md` to ensure alignment with the overall design and goals.
```

> aside positive
>
> You can add inline suggestions or your own instruction to make Copilot works better in your project.

You can add other things in that file that you want Copilot to do with each request, for example: "Always add documentation to all new functions.".

Here are some great examples of prompts that you can use, modify, and adjust for your custom instructions: [Godlike Prompts](https://copilot-instructions.md/prompts.html)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## API Readiness Check
Duration: 15

### **TO-DO**
- Langsung agent mode
- remove swagger entries in package.json (BE)

Goal:
- Validate backend API is running before PO implementation starts
- Let participants practice asking Copilot to generate API docs view
- Make available endpoints visible in one place

Participant task:
1. Ask Copilot to add Swagger/OpenAPI to the Fastify backend.
2. Run backend and open Swagger UI in browser.
3. Confirm baseline PR endpoints are listed and callable.

Prompt example for Copilot:

```text
Add Swagger/OpenAPI support to this Fastify JavaScript backend.
Use @fastify/swagger and @fastify/swagger-ui.
Register plugins in the main server/bootstrap file, expose docs at /docs, and include all existing routes in the generated OpenAPI spec.
Keep implementation simple.
```

Verification steps:

```bash
# backend terminal
npm install @fastify/swagger @fastify/swagger-ui
npm run dev
```

Open in browser:
- `http://localhost:3000/docs`

Ready criteria:
- Swagger page loads successfully
- Existing baseline PR endpoints are visible
- At least one endpoint can be tried successfully from Swagger UI

> aside positive
>
> This gives participants a fast confidence check that API contracts are live before building PO features.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## GitHub Spaces
Duration: 20

Let's use GitHub Spaces for onboarding + brainstorming

Open [Copilot Spaces](https://github.com/copilot/spaces) on GitHub and create a space named:
`Procurement MVP Onboarding`

Attach these files:
- `README.md`
- `docs/plan.md`

Prompt 1 (new team member onboarding):

```text
Create a new team member onboarding summary for this repository.
Explain the business flow (PR -> PO -> GR), tech stack, and first 3 tasks to start contributing.
```

Prompt 2 (product brainstorming):

```text
For this procurement MVP, suggest 5 realistic enhancements for a future version.
Keep current workshop scope unchanged and clearly mark each enhancement as out-of-scope for today.
```

You can keep any resulting markdown documents in the `docs/` directory in the repo, eg.:
- `docs/onboarding.md` (optional)
- `docs/brainstorm.md` (optional)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Finalize Plan
Duration: 15

Use Copilot's **Plan** mode with `docs/plan.md` attached.

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
## Figma MCP Setup
Duration: 15

### **TO-DO**
- Screenshot Figma MCP
- manually add MCP config in mcp.json
- Add Figma MCP config in mcp.json
  - optional https://github.com/mcp/com.figma.mcp/mcp
- User must logged in to Figma


Before implementing PO module pages, make sure Figma MCP is available in Copilot.

Checklist:
- Confirm Figma MCP is installed/available in current Copilot environment
- Confirm access to workshop Figma file and node/page IDs
- Confirm participants can call MCP from Copilot chat

Expected result:
- Everyone is ready to generate PO Create UI from the same Figma source

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Generate Page using Figma MCP
Duration: 20

### **TO-DO**
- Talk about best practices
- User will need to be approved or file made public
- add the Figma link in the slide (not just on prompt)

Participants start the PO module by generating **PO Create page** from Figma using MCP.

Scope for generated page:
- Header section (vendor, PO date, notes)
- Line table section (approved PR open lines, allocate qty, unit price)
- Actions (save draft, submit)

[Figma file](https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?m=auto&t=isYVX9I2o61eq0Vu-6.)

Prompt example:

```text
Using Figma MCP, generate Vue code for the PO Create page from this Figma file https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?m=auto&t=isYVX9I2o61eq0Vu-6.
Include reusable components for header form and line allocation table.
Do not implement API calls yet. Keep structure simple.
```

Expected result:
- PO Create page and base UI components are generated from Figma

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Add Unit Tests
Duration: 15

Once PO Create page/components are generated, ask participants to add component-level unit tests.

Minimum test targets:
1. Header component renders required fields
2. Line table component adds/removes line rows
3. Allocation input blocks invalid values at UI validation layer

Prompt example:

```text
Create unit tests for the generated Vue PO Create components.
Focus on rendering, line add/remove behavior, and basic allocation input validation.
Keep tests simple and readable.
```

Expected result:
- Participants see how Copilot generates tests for UI components before API integration

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Baseline Review + PO Backlog Start
Duration: 25

### **TO-DO**
- Copilot must be in PLAN mode

Tasks:
- Explore existing project structure.
- Identify extension points for PO routes/services/pages.
- Confirm existing API client and page routing patterns.

Prompt example:

```text
Analyze this repository and summarize what is already implemented.
Propose a minimal implementation plan for PO list/create/detail pages and PO endpoints only.
```

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

Required PO rule:
1. PO allocation qty <= PR line remaining qty

Prompt example:

```text
Implement Purchase Order module.
Create PO service + routes for create, submit, detail, and open-lines.
Enforce over-allocation validation against PR remaining quantities.
Return 422 for business rule violations with clear messages.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Build PO Pages
Duration: 35

Let's build the pages and connect them to the API.

PO pages (participant scope):
- PO List page
- PO Create page (already generated from Figma MCP, now wire to API)
- PO Detail page

Prompt example:

```text
Implement PO list/detail pages in Vue using existing patterns.
For PO Create page, keep the generated Figma components and wire them to purchase order APIs.
Keep UI simple for clarity.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Jest tests with Copilot
Duration: 10

Let's add PO-focused Jest tests

Minimum tests:
1. Reject over-allocation in PO creation
2. Reject invalid PO status transition
3. Accept valid allocation and transition path

Prompt example:

```text
Create Jest tests focused on PO service validation and status transition rules.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Copilot PR summary & review
Duration: 10

### **TO-DO**
- Add Copilot commit message feature in VSCode

We can use GitHub Copilot for:

- creating PR summary
- reviewing PR

Steps:
1. Push branch and open Pull Request
2. Use Copilot to generate PR summary
3. Request Copilot code review as reviewer
4. Triage comments and apply fixes in a small follow-up commit

### 1. Create PR description
We can ask Copilot to add Pull Request description.

1. Commit the changes from the previous slide.
2. Push to your repo.
3. Open your Github repo page, create a new Pull Request.
4. Click on the Copilot icon on the PR page, then select the "Generate > Summary" button.
5. This will create a comprehensive PR description based on the commits in the branch that we wanted to merge.

![Request PR summary](github-copilot-workshop-id/img/__aa-pr-desc.png)

### 2. Add Copilot as PR Reviewer

We can also add Copilot as a reviewer to a Pull Request. Very handy if you're working solo on a project.

After pushing, let's create a Pull Request on GitHub.com and utilize Copilot's code review functionality.

1. Access your repository on GitHub
2. Click **Open a pull request**
3. On the Pull Request creation screen, click **Copilot icon** >> **Summary**

![CopilotPR review](github-copilot-workshop-id/img/__aa-pr.png)

In the **Reviewers** section, you can assign **Copilot** as a reviewer to request code review from Copilot.

Copilot would check all the files in the PR and make appropriate comments.

> aside positive
>
> **Auto-assign Setting**: By checking Settings >> Branches >> Rulesets >> Require a pull request before merging >> Automatically request Copilot code review, Copilot will be automatically assigned when opening Pull Requests.

After the Pull Request is opened, you can view Copilot Code Review results:

- **Pull Request Overview**: Summary of code changes
- **Issues Identified**: Pointing out potential problems
- **Improvement Suggestions**: Specific suggestions for improving code quality

> aside negative
>
> **Note**: Depending on the PR size, you might need to wait for Copilot to finish creating a summary or adding PR reviews.

> aside positive
>
> **Pro Tip**: not confidence about your PR? Anxious that the senior devs are going to roast your PR? Let Copilot review your PR first, before you add other reviewers.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## GitHub Issue
Duration: 10

### **TO-DO**
- Add steps to enable Issue tab

Let's create a new Bookmark feature using GitHub Issue.

### Create issue

Create an issue: "Bookmark feature for PR/PO/GR".

Enter this in the description text input:
```text

Create a Bookmark feature in this procurement app.

**Scope**
User can bookmark PR/PO/GR entity from detail page.

**Goal**
A fully functional feature development including the necessary backend APIs, frontend UIs, and migration SQL script.
```

Finally, assign to Copilot by clicking the "Assign to Copilot" button.

### Implement changes
After assigning the issues to an agent, Copilot will automatically create a branch, a pull request, complete with a detailed description of changes it makes to address the issue.

You can check the progress of Copilot in addressing the issues in Pull requests page. After a few minutes, depending on the task size, we can see the changes completed as a Pull Request.

![Issue PR Result](github-copilot-workshop-id/img/__new-feature-result.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Creating E2E test with Copilot
Duration: 10

### 1. Create new E2E test
Let's create dedicated Playwright spec for the PO module.

Before running Playwright, participants create one dedicated E2E spec file for the PO module built in previous slides.

Target file:
- `tests/e2e/po-module.spec.js`

Required scenarios:
1. Happy path: create + submit PO from baseline approved PR data
2. Negative path: reject over-allocation qty

Prompt example:

```text
Create tests/e2e/po-module.spec.js using @playwright/test.
Add:
1) happy path: create + submit PO from approved PR and verify PO detail
2) negative path: reject allocation qty that exceeds PR remaining qty
Use stable selectors and clear assertions.
```

### 2. E2E Test Outcome

Expected outcome:
- Participants understand test intent before execution
- One dedicated PO module spec is ready to run

Artifact locations:
- HTML report: `playwright-report/index.html`
- Screenshots, traces, videos: `test-results/`

How to open artifacts:
- VS Code Explorer: open `playwright-report/` and `test-results/`
- Terminal (macOS):

```bash
open playwright-report/index.html
open test-results
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Product Documentation
Duration: 5

Make sure Copilot Chat is in **Agent** mode. Let's ask Copilot to add more documentations:

```text
Create a documentation on how the current application works. Add a user flow chart and sequence diagram, using Mermaid format. Save it as a markdown file.
```

We can use your favorite markdown viewer plugin to check the result, including the charts.
Because the charts are created using Mermaid, you can also copy-paste the Mermaid code into Mermaid's tool.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Prompt Files and Custom Agents (Optional)
Duration: 15

### Prompt Files

Prompt files define reusable prompts for specific tasks that you can invoke when needed.

#### Create a "code explainer" agent

1. Create a file: `.github/prompts/explain-code.prompt.md`
2. Add this into the file:

```text
---
agent: 'agent'
description: 'Generate a clear code explanation with examples'
---

Explain the following code in a clear, beginner-friendly way:

Code to explain: ${input:code:Paste your code here}
Target audience: ${input:audience:Who is this explanation for? (e.g., beginners, intermediate developers, etc.)}

Please provide:

* A brief overview of what the code does
* A step-by-step breakdown of the main parts
* Explanation of any key concepts or terminology
* A simple example showing how it works
* Common use cases or when you might use this approach

Use clear, simple language and avoid unnecessary jargon.
```

![Explainer](github-copilot-workshop-id/img/__explainer.png)

### Custom Agents

Other than the default agent provided by Copilot, you can create your own custom agent for specific use case.

#### Create a "readme creator" agent

1. Create a file: `.github/agents/readme-creator-agent.md`
2. Add this into the file:

```text
---
name: readme-creator
description: Agent specializing in creating and improving README files
---

You are a documentation specialist focused on README files. Your scope is limited to README files or other related documentation files only - DO NOT modify or analyze code files.

Focus on the following instructions:
- Create and update README.md files with clear project descriptions
- Structure README sections logically: overview, installation, usage, contributing
- Write scannable content with proper headings and formatting
- Add appropriate badges, links, and navigation elements
- Use relative links (e.g., `docs/CONTRIBUTING.md`) instead of absolute URLs for files within the repository
- Make links descriptive and add alt text to images
```

> aside positive
>
> You can create as many specific agents as you want.

You will be able to access your custom agent in Copilot Chat.

![Copilot VSCode](github-copilot-workshop-id/img/__agent-vsc.png)

And once you've committed the agent definition to `main` branch, you can also access the agent in Copilot Online.

![Copilot Online](github-copilot-workshop-id/img/__agent-cpo.png)

> aside positive
>
> Be creative, try creating some custom prompts and agents.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Further Exploration: GR Module
Duration: 20

Not part of mandatory workshop backlog.

Self-paced challenge:
- Implement GR create/detail/post endpoints
- Build GR list/create/detail pages
- Add validation: received qty <= PO open qty

Use `docs/plan.md` as implementation reference.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Code Quality, Code Scanning, CodeQL
Duration: 10

### Enable and run checks
- Enable GitHub Advanced Security features available in your environment
- Enable Code Scanning
- Enable CodeQL analysis

### Enable CodeQL and Code Quality

Merge all of our changes to the `main` branch.
Then in your repo, go to `Settings` → `Code quality`. Click on `Enable code quality` button.
If you've already merged your codes to `main` branch, it will automatically execute a scan.

![Code Quality](github-copilot-workshop-id/img/__cq.png)

You can check the result of the action executed by Code quality in the `Actions` tab.

![Actions](github-copilot-workshop-id/img/__cq-actions.png)

### Add workflow (if not present)
Create `.github/workflows/codeql.yml` using Copilot.

Prompt example:

```text
Create a GitHub Actions workflow for JavaScript CodeQL analysis.
Run on push and pull_request for main and feature branches.
```

### Teach participants to read results
- Security tab -> Code scanning alerts
- Understand severity, affected file, and remediation guidance
- Differentiate true positives vs acceptable risk for MVP

> aside positive
>
> For workshop speed, fix 1 meaningful alert together rather than trying to clear everything.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Wrap-up, Retrospective, and Next Steps
Duration: 10

What participants accomplished:
- Started from a working baseline with JavaScript stack
- Delivered PO backlog module end-to-end
- Used Copilot Spaces for onboarding + brainstorming
- Added PO-focused unit tests and Playwright e2e
- Used GitHub Copilot review + CodeQL/code scanning

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
