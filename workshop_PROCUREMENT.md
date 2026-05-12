author: Arie M. Prasetyo
summary: GitHub Copilot Workshop - Procurement MVP
id: github-copilot-workshop-procurement-mvp
categories: AI, Development
environments: Web
status: Published
feedback link: 

# GitHub Copilot Workshop: Build a Procurement System MVP


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## About this workshop
Duration: 10

Welcome. In this workshop, participants build a real-world procurement system MVP using GitHub Copilot in VS Code and GitHub.

![Octocat](github-copilot-workshop-procurement-mvp/img-source/octocat-copilot.png)

We are going to work on an existing procurement system. This system already has two main modules/pages:
- Dashboard
- PR (Purchase Requisition)

The aim is to build the PO (Purchase Order) module. Another module GR (Goods Receipts) is open for exploration. The tables for PO and GR modules are already in the database (after migration).

Application scope:
- Baseline provided: *Home/Dashboard* & *PR module* (list/create/detail pages and backend APIs)
- Participant backlog: *PO module* (list/create/detail pages and backend APIs)
- Optional extension: *Bookmark feature* (for PR, PO, & GR modules) via GitHub Issue workflow
- Further exploration: *GR module* (self-paced)

Tech stack:
- Backend: Fastify + JavaScript
- Frontend: Vue 3 + Vite + JavaScript
- Database: PostgreSQL in Docker
- Testing: Jest + Playwright
- Design: Figma + Figma MCP

> aside positive
>
> You can access the slide deck at [text](link)


<!--
TO-DO = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
4. Reduce content on custom prompts to increase content on custom skills
5. Make sure Mermaid is in slide about documentation
-->
---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## The example app: Procurement system MVP
Duration: 10

In this workshop we are going to build a procurement system MVP (minimum viable product). A procurement system manages how a company buys things, with control and traceability from request to receiving.

In simple terms, it helps answer:

- Who requested what?
- Who approved it?
- What was ordered from which vendor?
- What quantity has been received so far?
- What is still open or pending?

In this app, the workflow chain would be:

1. Purchase Requisition (PR) → internal request for goods/items
2. Purchase Order (PO) → official order sent to supplier to buy goods/items
3. Goods Receipt (GR) → record that goods/items were received

![Flow](github-copilot-workshop-procurement-mvp/img-source/flow.png)

### Definitions and Functions

#### Purchase Requisition (PR)
An internal document created by a requester (employee/department) to ask for goods or services.

Main function:
- Capture business need (item, quantity, required date, budget context).
- Run internal approvals before spending commitment.
- Does not go to vendor directly.
- Typical statuses: `DRAFT` → `SUBMITTED` → `APPROVED`

#### Purchase Order (PO)
A commercial document issued to a vendor after PR approval.

Main function:
- Formally commit to buy specific items, quantities, and prices.
- Serve as the legal/operational ordering reference.
- Track what has been ordered and what remains open.
- In this workshop logic: PO lines are allocated from approved PR lines, and allocation cannot exceed PR remaining quantity.
- Typical statuses: `DRAFT` → `SUBMITTED`

#### Goods Receipt (GR)
A record that goods (or service delivery) were actually received against a PO.

Main function:
- Confirm physical receipt (or service completion).
- Update received quantities.
- Provide proof for downstream matching/invoicing/payment.
- In this workshop logic: received quantity cannot exceed PO open quantity.
- Typical statuses: `DRAFT` → `POSTED`

#### One practical example

1. PR: Maintenance team requests 10 safety helmets.
2. PO: Purchasing orders 10 helmets from Vendor A at agreed unit price.
3. GR: Warehouse receives 6 helmets today and records GR; later receives remaining 4 and records another GR.

Result: system shows requested = 10, ordered = 10, received = 10, open = 0.

So, a procurement app is essentially a controlled pipeline for spending:
```
request → approve → order → receive
```
with quantities and statuses enforced at each step.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## AI, LLM, and Context Basics
Duration: 5


![AI](github-copilot-workshop-procurement-mvp/img-source/ai.png)

How does LLM's, like GPT or Claude work? LLMs predict the next token based on the context provided to it. So, better context gives better output quality.

Prompt anatomy in GitHub Copilot:
- System instructions: global behavior and constraints
- User message: immediate task objective, the prompt written by the user
- Repository context: code, docs, config, the information available in the repo/workspace

Working rule for this workshop:
1. If possible, attach relevant docs (markdown plans, actual code files, screenshots, etc.) with every prompt
2. When working on something new, ask for a plan first. Afterwards, implement in small checkpoints
3. Always validate the agent's work. You can outsource your code, but you must not outsource your understanding.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Why context matters - Part 1
Duration: 5

Open your favorite online LLM application (eg. ChatGPT, Claude, Gemini, etc.) and write a  prompt to recreate this image:

![target picture](github-copilot-workshop-procurement-mvp/img-source/target-picture.jpeg)

Be as specific as you can.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Why context matters - Part 2
Duration: 10

When working with an AI model, the problem (almost always) is not the AI. It is the brief you gave the AI.
The gap is not technical—it is communicative. Prompting—communicating with an AI model—is a skill that we need to master so we can provide AI models with the best direction for it to complete its task. You have to make your intention as clear as possible.

- Lead with WHAT you need and WHY it matters. Let the agent work out the HOW.
- In human communication, brevity is a virtue; with AI agents, it is a liability. Be as comprehensive as you can.
- The devil is in the details. Leave nothing to chance. Let the model know every last tiny bit of information that you can provide.


> aside positive
>
> Share your result with everyone. What do you think you can improve in your prompt to make your picture looks as similar as the target picture? Do you think you share the responsibility if the result looks nothing like the target picture?


---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Prerequisites
Duration: 10

- VS Code latest
- GitHub account + Copilot license
- Docker Desktop running
- Node.js 20+
- Git
- GitHub Copilot extension

![vscode](github-copilot-workshop-procurement-mvp/img-source/vscode.png)

Optional MCP tools:
- GitHub MCP Server
- Figma MCP integration available in Copilot/agent environment

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#1)
Duration: 5

- What context gave Copilot the best responses so far?
- Where do participants usually lose time in project setup?
- Quick sharing: one AI-assisted workflow from your current team

### Success story
**"The trust: How Singapore’s largest bank builds AI with confidence"**
(March 12, 2026)
[Link](https://cloud.google.com/transform/how-dbs-singapores-largest-bank-builds-ai-with-confidence)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Clone the Repository
Duration: 5

Open the project URL: [https://github.com/eComindo/2026-github-copilot-workshop](https://github.com/eComindo/2026-github-copilot-workshop)

![github repo](github-copilot-workshop-procurement-mvp/img-source/github-repo.png)

1. Open the project URL in your browser
2. Clone the repo. You can click **Code** button, the green button on the top right

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
## Database Bootstrap using Docker
Duration: 20

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
Duration: 15

### 1. Start the backend server

Create backend `.env`:
```env
PORT=3000
DATABASE_URL=postgres://workshop:workshop@localhost:5433/procurement_mvp
```

- Run `npm install` in backend, frontend, and root (if monorepo scripts used)
- `npm run dev` can be run from root if preconfigured


### 2. Start the frontend server
Create frontend `.env`:

```env
VITE_API_BASE_URL=http://localhost:3000
```

### 3. Baseline expectation:
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

> aside positive
>
> What makes a good copilot-instructions.md? You have to, at least, make sure it contains the product context & tech stack. You can also add code convention, unit testing strategy, or tell the agent to never add the `.env` file. This file should contain all the conventions, rules, and exceptions that you want the agent to follow.
> 
> And it is an evolving file. So you can always improve this file alongside the project.

Example of the `copilot-instructions.md` file we are using for this project:

![instruction](github-copilot-workshop-procurement-mvp/img-source/copilot-instructions.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Concept: Spec-Driven Development (SDD)
Duration: 15

Spec-driven development (SDD) is a software engineering approach where **structured, human-readable specifications** are the primary artifact and "source of truth".

Why SDD matters:
- Vibe-coded output is fast, but often inconsistent and unmaintainable
- Product-grade output needs explicit design documents ("specs")

There are various libraries and frameworks that help you create an SDD pattern. But you can always setup your own favorable pattern.
What you need to make sure your development follows spec-driven development guidelines are:

- Create and maintain spec docs before large features. You can store it in a specific folder called `plans/` or `docs/` in your repo/workspace.
- Keep guardrail docs for architecture, naming, and patterns, eg. in a `guidelines/` folder.
- If required, you can create a dedicated document that explains the tech-stack decisions and coding conventions.

> aside positive
> Make sure `.github/copilot-instructions.md` are aware of the locations of these spec documents. This will ensure that the documents can be invoked as relatable context.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#2)
Duration: 5

- What is your ideal `copilot-instructions.md` file?
- What documents do you want to store in your repo/workspace?
- What enhancement ideas were realistic for your current team?

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
## Finalize Plan
Duration: 15

To start this project, we use an already created plan document, the spec for the MVP. Use Copilot **Plan** mode with `docs/plan.md` attached and enter the following prompt.

![plan](github-copilot-workshop-procurement-mvp/img-source/mode-plan.png)

```text
Validate this plan for an MVP.
Return a strict task sequence with checkpoints.
Focus implementation on PO backlog.
```

Once you are satisfied with the plan, switch to **Agent** mode:

![agent](github-copilot-workshop-procurement-mvp/img-source/mode-agent.png)

```text
Save the refined checklist to docs/runbook.md.
```

Here we are creating another "spec" document, a document that contains all the items the agent needs to implement in order to create the MVP.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Agent Skills
Duration: 20

Agent skills are folders of instructions, scripts, and resources that Copilot can load when relevant to improve its performance in specialized tasks. The Agent Skills specification is an open standard, used by a range of different AI systems.

You can create your own skills to teach Copilot to perform tasks in a specific, repeatable way—or use skills shared online, for example in the [anthropics/skills](https://github.com/anthropics/skills) repository or GitHub's community-created [github/awesome-copilot](https://github.com/github/awesome-copilot) collection.

> aside positive
> Skill files **must** be named SKILL.md

### 1. Adding "skills" support
Create a new folder `.github/skills`

This will be the location for all the skill configurations.

### 2. Add a Vue.js best practices skill
- Create a new folder `.github/skills/vue-best-practices`
- In that folder, create a new file `SKILL.md`
- Copy the raw content of the markdown document in [this link](https://github.com/vuejs-ai/skills/blob/main/skills/vue-best-practices/SKILL.md?plain=1) to that file you have just created.

### 3. Add a Figma design implementation skill
Sometimes skill include other configuration files, not just the `SKILL.md` file.

- Create a new folder `.github/skills/figma-implement-design`
- As usual, in that folder, create a new file `SKILL.md`
- Copy the raw content of the markdown document in [this link](https://github.com/openai/skills/blob/main/skills/.curated/figma-implement-design/SKILL.md?plain=1) to that file you have just created.
- Download or recreate the rest of the files in the [https://github.com/openai/skills/tree/main/skills/.curated/figma-implement-design](https://github.com/openai/skills/tree/main/skills/.curated/figma-implement-design) folder.

> aside positive
> You can learn more about adding skills in this [official Github page](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## API Documentation & Readiness Check
Duration: 15

Before we start with with the PO module implementation in our procurement system MVP, let's validate the backend API first.
Use the **Agent** mode and enter this prompt:

```text
Add Swagger/OpenAPI support to this Fastify JavaScript backend.
Use @fastify/swagger and @fastify/swagger-ui.
Register plugins in the main bootstrap file and expose docs at /docs.
```

The goal is:
1. Add Swagger/OpenAPI support
2. Start backend and open Swagger UI
3. Verify baseline PR endpoints are listed and callable

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Figma MCP Setup
Duration: 15

Figma is the default tool in designing frontend pages and user interfaces. Adding Figma MCP allows the AI model to access Figma file directly.

### Modify the MCP config
1. Use the Command Palette, open the MCP configuration file `mcp.json`.

![mcp-config](github-copilot-workshop-procurement-mvp/img-source/mcp-config.png)

2. Add Figma configuration in the `mcp.json` file.

![mcp-figma](github-copilot-workshop-procurement-mvp/img-source/mcp-figma.png)


### Important Note

Before you ask Copilot to access a Figma file, make sure that:
- you are logged in to Figma
- confirm workshop file and node IDs are accessible
- confirm that the Figma file owner already assign access to you

> aside positive
> To make sure the frontend codes implement the Figma design as accurate as possible, we need at least two things:
> - Figma implementation skill
> - Figma file that implements best practices
>
> Check [this article](https://arie-m-prasetyo.medium.com/figma-recommended-practices-in-the-age-of-ai-e766b098ef9f) to learn about the best practices in designing UI's in Figma for AI interpretation.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#3)
Duration: 5

- What should be generated from design vs handwritten in project style?
- How do skills change prompt quality for implementation?
- Did you get blocked in API and MCP setup?

### Success story
**"How AI accelerated product innovation at Grab in 2024"**, (December 19, 2024) [Link](https://www.grab.com/inside-grab/stories/how-ai-accelerated-product-innovation-at-grab-in-2024/)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = DAY 2 = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Using Figma MCP
Duration: 20

Let's start creating the development of PO module by generating **Create PO** page for the PO module.
We will be using a design in Figma to create the frontend codes.

Enter the prompt below:
```text
Using Figma MCP, generate Vue code for the PO Create page from this Figma file https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?m=auto&t=isYVX9I2o61eq0Vu-6.
Include reusable components for header form and line allocation table.
Do not implement API calls yet. Keep structure simple.
```

> aside positive
>
> The Figma file:
> https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?m=auto&t=isYVX9I2o61eq0Vu-6

Scope for generated page:
- Header section (vendor, PO date, notes)
- Line table section (approved PR open lines, allocate qty, unit price)
- Actions (save draft, submit)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Add Tests with Copilot
Duration: 15

Ask Copilot to help us create unit tests for the pages we have just created.
Enter this prompt:

```text
Create unit tests for Vue PO Create components and Jest tests for PO service validation.
Focus on rendering, line add/remove behavior, over-allocation validation, and status transition rules.
Keep tests readable.
```

UI component test targets:
1. Header component renders required fields
2. Line table component adds/removes rows
3. Allocation input blocks invalid values

Service/Jest test targets:
1. Reject over-allocation in PO creation
2. Reject invalid PO status transition
3. Accept valid allocation and status transition path

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Project progress review
Duration: 10

It is best practice to have a document that track the status of the project. This can help Copilot get a context of the overall status of the system we are building.
Use the **Agent** and enter this prompt:

```text
Analyze this repository and summarize what is already implemented.
Identify the available API endpoints for PO module.
Document the latest state of the project in `docs/progress.md`.
```

The goal here is to make Copilot aware of what has been done and avoid redundancy.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#4)
Duration: 5

- Which tests caught real defects before integration?
- Have you added other documentation that you think can improve Copilot's result?
- Have you recognize what kind of prompt generates the most maintainable code?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Implement "Create PO" page
Duration: 30

Enter this prompt to start the integration of the Create PO page. Don't forget to attach the related documents to provide context to Copilot.

```text
Integrate the available PO endpoints with the "Create PO" page.
Leep generated Figma components and wire them to purchase order APIs.
Special request for the module functionality:
- enforce over-allocation validation against PR remaining quantities
- return 422 for rule violations with clear messages
```

The end result should be a working PO Create page.

![create po](github-copilot-workshop-procurement-mvp/img-source/create-po-page.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Complete the PO Module
Duration: 30

Create the rest of the PO module pages and connect them to the PO module API endpoints. We don't have Figma file for these pages, so ask Copilot to follow the existing design rules (using available codes as context).

```text
Finish the PO module.
Implement PO list and detail pages in Vue using existing patterns.
Keep UI simple for clarity and follow the existing design system.
Use existing components when possible. Only create components that aren't already available.
Connect the new pages with the existing backend API endpoints for PO module.
```

The end result should be
- PO List page
- PO Detail page

![po detail](github-copilot-workshop-procurement-mvp/img-source/po-detail.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#5)
Duration: 5

- Did Copilot add validation rules? If yes, here did it put it: on the back-end or front-end?
- Where should business-rule tests live: route or service? What did Copilot decide? Did it ask for your input?
- What do yout think the best way to keep generated code aligned with API contracts?

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
