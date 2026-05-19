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
- **PR (Purchase Requisition)** module

The aim is to build the **PO (Purchase Order)** module. Another module **GR (Goods Receipts)** is open for exploration. The tables for PO and GR modules are already in the database (after migration).

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
- Support: Python

<!-- > aside positive
>
> You can access the slide deck at [text](link) -->


<!--
TO-DO = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
4. Reduce content on custom prompts to increase content on custom skills
5. Make sure Mermaid is in slide about documentation
-->
---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## The project: Procurement system MVP
Duration: 15

In this workshop we are going to build a procurement system MVP (minimum viable product). A procurement system manages how a company buys things, with control and traceability from request to receiving.

In simple terms, it helps answer:

- *Who requested what?*
- *Who approved it?*
- *What was ordered from which vendor?*
- *What quantity has been received so far?*
- *What is still open or pending?*

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
Duration: 10


![AI](github-copilot-workshop-procurement-mvp/img-source/ai.png)

How do LLMs like GPT or Claude work? LLMs predict the next token based on the context provided to them. So, better context gives better output quality.

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
Duration: 10

Open your favorite online LLM application (e.g., ChatGPT, Claude, Gemini, etc.) and write a prompt to recreate this image:

![target picture](github-copilot-workshop-procurement-mvp/img-source/target-picture.jpeg)

> aside positive
> 
> Be as specific as you can.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Why context matters - Part 2
Duration: 20

When working with an AI model, the problem (almost always) is not the AI. It is the brief you gave the AI.
The gap is not technical—it is communicative. Prompting—communicating with an AI model—is a skill that we need to master so we can provide AI models with the best direction for it to complete its task. You have to make your intention as clear as possible.

- Lead with WHAT you need and WHY it matters. Let the agent work out the HOW.
- In human communication, brevity is a virtue; with AI agents, it is a liability. Be as comprehensive as you can.
- The devil is in the details. Leave nothing to chance. Let the model know every last tiny bit of information that you can provide.


> aside positive
>
> Share your result with everyone. What do you think you can improve in your prompt to make your picture look as similar as the target picture? Do you think you share the responsibility if the result looks nothing like the target picture?


---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Prerequisites
Duration: 10

- Latest VS Code
- GitHub Copilot extension
- GitHub account + Copilot license
- Docker Desktop running
- Node.js 20+
- Git
- Figma account (recommended)
- Python
- [uv Python package and project manager](https://github.com/astral-sh/uv) (recommended)

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
Duration: 10

Open the project URL: [https://github.com/eComindo/2026-github-copilot-workshop](https://github.com/eComindo/2026-github-copilot-workshop)

![github repo](github-copilot-workshop-procurement-mvp/img-source/github-repo.png)

1. Open the project URL in your browser
2. Clone the repo. You can click the **Code** button, the green button on the top right

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Setup the Project Locally
Duration: 20

### 1. Set up the repo

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
## The Problem with Vibe-Driven Development
Duration: 10

![vcdead](github-copilot-workshop-procurement-mvp/img-source/vcdead.webp)
*Image source: [Vibe Coding Is Dead. Here’s What Replaced It.](https://ai.plainenglish.io/vibe-coding-is-dead-heres-what-replaced-it-aa7d2889b05a)*


You probably have experienced this pattern:
- You write a prompt describing roughly what you want
- Copilot generates something plausible
- You iterate — adjusting, correcting, re-running
- Eventually it looks right

This works for fast prototyping. It does not work for production-grade, maintainable, auditable software — especially in a regulated banking environment. The output is only as precise as your prompt, and prompts are inherently imprecise.

### What is a Spec?

A spec is a structured, human-readable document that defines:

| Section | What it captures |
|---|---|
| **Intent** | What this feature is meant to accomplish — in one sentence |
| **Behavior** | Inputs, expected outputs, state changes |
| **Constraints** | Performance requirements, security boundaries, architecture rules |
| **Edge cases** | Boundary conditions, failure scenarios, unexpected inputs |
| **Acceptance criteria** | Testable, unambiguous, one per line |
| **Data** | What data is touched, its classification, handling requirements |

A spec is not code. It is not a design document. It is the *contract* between intent and implementation.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Concept: Spec-Driven Development (SDD)
Duration: 15

### 1. What is SDD
Spec-driven development (SDD) is a software engineering approach where **structured, human-readable specifications** are the primary artifact and "source of truth".

Why SDD matters:
- Vibe-coded output is fast, but often inconsistent and unmaintainable
- Product-grade output needs explicit design documents ("specs")
- Reduces ambiguous prompts and rework
- Makes requirements and edge-cases visible before coding
- Produces artifacts that are easier to review by dev, QA, and product

### 2. How to start using SDD
There are various libraries and frameworks that help you create an SDD pattern (we will discuss them at the end of the workshop). We can start by setting up your own preferred pattern.
To make sure your development follows spec-driven development guidelines:

- Create and maintain spec docs before large features. You can store it in a specific folder called `plans/` or `docs/` in your repo/workspace.
- Keep guardrail docs for architecture, naming, and patterns, e.g., in a `guidelines/` folder.
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
Duration: 10

Agent skills are folders of instructions, scripts, and resources that Copilot can load when relevant to improve its performance in specialized tasks. The Agent Skills specification is an open standard, used by a range of different AI systems.

You can create your own skills to teach Copilot to perform tasks in a specific, repeatable way—or use skills shared online, for example in the [anthropics/skills](https://github.com/anthropics/skills) repository or GitHub's community-created [github/awesome-copilot](https://github.com/github/awesome-copilot) collection.

> aside positive
> Skill files **must** be named SKILL.md

### How a skill works

A SKILL.md file contains structured instructions that tell Copilot how to behave when the skill is invoked — what inputs to look for, what outputs to produce, what format to follow, and what constraints to apply. Copilot reads the skill as context before responding, which makes its output consistent and predictable across team members and sessions.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Adding an agent Skill
Duration: 20

### 1. Adding "skills" support
Create a new folder `.github/skills`

This will be the location for all the skill configurations.

### 2. Add a Vue.js best practices skill
- Create a new folder `.github/skills/vue-best-practices`
- In that folder, create a new file `SKILL.md`
- Copy the raw content of the markdown document in [this link](https://github.com/vuejs-ai/skills/blob/main/skills/vue-best-practices/SKILL.md?plain=1) to that file you have just created.

### 3. Add a Figma design implementation skill
Sometimes skills include other configuration files, not just the `SKILL.md` file.

- Create a new folder `.github/skills/figma-implement-design`
- As usual, in that folder, create a new file `SKILL.md`
- Copy the raw content of the markdown document in [this link](https://github.com/openai/skills/blob/main/skills/.curated/figma-implement-design/SKILL.md?plain=1) to that file you have just created.
- Download or recreate the rest of the files in the [https://github.com/openai/skills/tree/main/skills/.curated/figma-implement-design](https://github.com/openai/skills/tree/main/skills/.curated/figma-implement-design) folder.

> aside positive
> You can learn more about adding skills on this [official GitHub page](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## API Documentation & Readiness Check
Duration: 15

Before we start with the PO module implementation in our procurement system MVP, let's validate the backend API first.
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

Figma is the default tool for designing frontend pages and user interfaces. Adding Figma MCP allows the AI model to access a Figma file directly.

### Modify the MCP config
1. Use the Command Palette, open the MCP configuration file `mcp.json`.

![mcp-config](github-copilot-workshop-procurement-mvp/img-source/mcp-config.png)

2. Add Figma configuration in the `mcp.json` file.

![mcp-figma](github-copilot-workshop-procurement-mvp/img-source/mcp-figma.png)


### Important Note

Before you ask Copilot to access a Figma file, make sure that:
- you are logged in to Figma
- confirm workshop file and node IDs are accessible
- confirm that the Figma file owner has already assigned access to you

> aside positive
> To make sure the frontend codes implement the Figma design as accurate as possible, we need at least two things:
> - Figma implementation skill
> - Figma file that implements best practices
>
> Check [this article](https://arie-m-prasetyo.medium.com/figma-recommended-practices-in-the-age-of-ai-e766b098ef9f) to learn about best practices for designing UIs in Figma for AI interpretation.

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

Start developing the PO module by generating the **Create PO** page.
We will be using a design in Figma to create the frontend codes.

Enter the prompt below:
```text
Using Figma MCP, generate Vue code for the PO Create page from this Figma file https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?m=auto&t=isYVX9I2o61eq0Vu-6.
Include reusable components for header form and line allocation table.
Do not implement API calls yet. Keep structure simple.
```

> aside positive
>
> [Link to the Figma file](https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?node-id=38-782&p=f&t=kto9reqIhe3VcQZi-0)

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
Create unit tests for important backend functions.
Focus on services that provide lists to the frontend.

Create Jest tests for frontend validations.
Focus on rendering of pages and components.

Keep tests readable.
```

Unit test result:
![tests](github-copilot-workshop-procurement-mvp/img-source/tests.png)

Unit test coverage report:
![coverage](github-copilot-workshop-procurement-mvp/img-source/coverage.png)

> aside negative
>
> One of the problems of AI models is that they are eager to please. Make sure your tests are actually producing good assessments, not just reinforcing mistakes in your code.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Project progress review
Duration: 10

It is best practice to have a document that tracks the status of the project. This can help Copilot get context on the overall status of the system we are building.
Use **Agent** mode and enter this prompt:

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
Duration: 10

Before taking a break, don't forget to commit and push your recent work.
Using Copilot, you can ask it to create a comprehensive commit message based on the staged files.

![commit-message](github-copilot-workshop-procurement-mvp/img-source/commit-message.png)

- Which tests caught real defects before integration?
- Have you added other documentation that you think can improve Copilot's result?
- Have you recognized what kind of prompt generates the most maintainable code?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Implement "Create PO" page
Duration: 30

Use this prompt to start integrating the Create PO page. Attach the related documents to provide context to Copilot.

```text
Integrate the available PO endpoints with the "Create PO" page.
Keep generated Figma components and wire them to purchase order APIs.
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

- Did Copilot add validation rules? If yes, where did it put them: on the back end or front end?
- Where should business-rule tests live: route or service? What did Copilot decide? Did it ask for your input?
- What do you think is the best way to keep generated code aligned with API contracts?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Git Hooks Demo (OPTIONAL)
Duration: 20

GitHub offers various features to make sure our project is secure and reliable.
But before we take a look into those features, let's try something we can implement locally.

Git hooks let us do a lot of things. They are triggered by the `git` command.
In this example we will make a hook that does pre-push checks, that can block low-quality pushes quickly.

### Create the hook
Create a new `.git/hooks/pre-push` file.

Then enter this prompt:
```text
Create a git hook pre-push script that runs npm test and blocks the push if there's a failed test.
```

Copy the script provided by Copilot to the file you have just created.

Below is an example of a simple pre-push script that runs `npm run test:unit`:
```text
#!/bin/sh

set -eu

echo "Running unit tests before push..."
cd app
npm run test:unit
```

Make sure you implement a script that runs the unit tests and cancels the push if an error is found.

### Test the hook
Before testing the hook, make sure the hook file is executable:

```text
chmod +x .githooks/pre-push
```

Then:
1. Create a failing test
2. Create a git commit
3. Push the commit and check the result

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Creating E2E test with Copilot
Duration: 15

Now we create an end-to-end test using Playwright.

The required scenarios for this end-to-end test:
1. Happy path: create + submit PO from approved PR data
2. Negative path: reject over-allocation qty

Create a dedicated Playwright spec using this prompt:

```text
Create tests/e2e/po-module.spec.js using the Playwright library.
Add happy path and negative over-allocation path with stable selectors and clear assertions.

The required artifacts:
- HTML report (`playwright-report/index.html`)
- screenshots/traces/videos - store them in `test-results/`
```

![playwright](github-copilot-workshop-procurement-mvp/img-source/pw.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Product Documentation
Duration: 10

Set Copilot Chat to **Agent** mode, then ask Copilot to generate implementation docs with diagrams.

Prompt:

```text
Create documentation for how the current application works.
Add a user flow chart and sequence diagram in Mermaid.
Save as markdown.
```

Use your favorite markdown viewer plugin to check the result, including the charts.

Because the charts are created using [Mermaid format](https://mermaid.js.org/), you can also copy-paste the Mermaid code into Mermaid's tool.

> aside negative
> 
> Below are some screenshots of documentation created by Copilot for a simple Pomodoro app. Our procurement MVP app would have a more complex documentation.

![App documentation](github-copilot-workshop-id/img/__docs-1.png)

![App documentation](github-copilot-workshop-id/img/__docs-2.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Creating Custom Prompts and Agents (OPTIONAL)
Duration: 10

### Prompt Files

Prompt files define reusable **prompts for specific tasks** that you can invoke when needed. We define it in a markdown file inside the `.github/prompts/` folder.

#### 1. Create a "code explainer" agent

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


### 2. Custom Agents

Other than the default agent provided by Copilot, you can create your own custom agent for specific use cases. Like custom prompts, we define custom agents in a markdown file inside a specific folder, in this case the `.github/agents/` folder.

#### Create a "readme creator" agent

1. Create a file: `.github/agents/readme-creator.agent.md`
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

You will be able to access your custom agent in Copilot Chat.

![Copilot VSCode](github-copilot-workshop-id/img/__agent-vsc.png)

> aside positive
>
> You can create as many custom prompts and agents as you want. Be creative, try creating some custom prompts and agents for your specific needs.

---


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#6)
Duration: 5

- What kind of custom agents and prompts do you think will be helpful to your workflow?
- Do you think the test scenarios added by Copilot helpful?
- Explore the types of Mermaid charts to help you create better documentation.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Exploration
Duration: 30

Using what you have learned so far, let's try to implement the last module in this procurement app: Goods Receipts (GR) module.
You have **30 minutes** to explore on your own, plan well.

> aside positive
>
> Reminders:
> - planning is crucial
> - specification documents steer the agent to achieve the goal
> - provide as much context as possible

![gr](github-copilot-workshop-procurement-mvp/img-source/gr.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## SDD frameworks
Duration: 20

### 1. Why use framework

SDD frameworks can help us create a standardized specifications throughout the organization.

Why use a ready-made framework:
- developing your own SDD standard takes time and resources
- you can use ready-made custom prompts, agents, and spec templates
- with a supportive community, the framework can continue to improve

![SpecKit](github-copilot-workshop-procurement-mvp/img-source/speckit.png)

> aside positive
>
> A framework is helpful, but not mandatory. You can still run SDD using your own templates and process.

Common SDD framework options:
- Homegrown docs in `docs/` or `specs/` and custom prompts/agents
- [Spec-Kit](https://github.com/github/spec-kit)
- [OpenSpec](https://openspec.dev/)
- [Intent by Augment Code](https://www.augmentcode.com/product/intent)
- [Superpowers](https://github.com/obra/superpowers)
- [MUSUBI](https://github.com/nahisaho/musubi)


### 2. Why spec matters in AI-enabled SDLC

A good spec does not die when the code is written. It becomes:

- The reference for PR reviewers: *does this implementation match the spec?*
- The source for test generation: *do the tests cover all acceptance criteria?*
- The input for the next feature: *what was built, and where are the boundaries?*
- The onboarding guide for new engineers: *what was this module intended to do?*

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Spec-Kit: SDD Framework from GitHub
Duration: 15

Spec-Kit provides reusable building blocks for spec-first development:
- A set of custom prompts and agents
- Specification templates and workflow conventions
- A repeatable pattern so teams do not reinvent SDD from zero

### Installing Spec-Kit

The recommended method to install Spec-Kit is using `uv`, a Python package manager.

Once uv is installed, run from your project root:

```bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@v0.8.11
```

![specify-cli](github-copilot-workshop-procurement-mvp/img-source/specify-cli.png)

Alternative setup: download template/package from the [release page](https://github.com/github/spec-kit/releases)


![scf](github-copilot-workshop-procurement-mvp/img-source/scf.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#7)
Duration: 5

- What is the difference between a Spec-Kit spec and a user story?
- Why does the constitution need to come before the specification?
- In your current team, who would run /speckit.constitution — the engineer, the tech lead, or the product owner?
- What would happen if two engineers ran /speckit.implement on the same spec at the same time?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Getting Started with Spec-Kit
Duration: 15

Initialize Spec-Kit in your project using the Specify CLI. Open a terminal, move to the project root, then initialize Spec-Kit.

For an existing project we can use this command:

```bash
specify init --here
```

Expected outcome:
- Spec-Kit folder/files are initialized
- Repository is ready for `/speckit.specify` and `/speckit.plan` workflow. You can try it out in the Copilot prompt.

![specs](github-copilot-workshop-procurement-mvp/img-source/specs.png)

We can also use the Specify CLI for a new project:

```bash
specify init <new-project-folder-name>
```

If the directory already contains files, skip confirmation:

```bash
# Skip confirmation when the directory already has files
specify init . --force
# or
specify init --here --force
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Spec-Kit agents
Duration: 10

GitHub Spec-Kit is a set of **agents** installed into the `.github/agents/` folder of your repository. Each agent has a specific and repeatable skill in the spec-driven workflow. When you invoke a command, Copilot loads the corresponding agent skill and executes it using your codebase and spec documents as context.

![sk-agents](github-copilot-workshop-procurement-mvp/img-source/sk-agents.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Constitution: Guardrails for the project
Duration: 20

The file `constitution.md` is the baseline rulebook for your project behavior and quality standards.

The constitution is the document that governs everything that follows. It captures:

- Project purpose — what this codebase is and who uses it
- Tech stack decisions — stack, frameworks, and why they were chosen
- Coding conventions — naming, file structure, patterns to follow
- Architecture rules — what is and is not allowed (ADR references)
- Quality standards — test requirements, coverage thresholds, DoD

When the constitution exists, every `/speckit.specify`, `/speckit.plan`, and `/speckit.implement` call respects it automatically — because the skill is designed to reference `.speckit/constitution.md` as context. You define the rules once; Copilot follows them consistently.

Use Copilot Agent to fill the constitution from template and existing project context:

```text
/speckit.constitution Fill in the constitution with the bare minimum requirements for a procurement management system, based on the template in constitution.md. Check the current codebase and README.md to get a context of the current state of the project.
```

Typical constitution content:
- Business-critical rules (PR -> PO -> GR flow integrity)
- Quality and testing baseline
- Architecture and convention constraints

This file becomes a stable reference for all future specs.

![constitution](github-copilot-workshop-procurement-mvp/img-source/constitution.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Create the GR Spec
Duration: 10

Create a functional specification for the GR module using Spec-Kit's `/speckit.specify` command:

```text
/speckit.specify add a GR (Goods Receipts) module on this application
```

What to verify after running:
- A new branch is created for the spec work
- New specification files appear in `specs/`
- Functional requirements cover list/create/detail and validation logic

![specs-result](github-copilot-workshop-procurement-mvp/img-source/specs-result.png)

Suggested GR spec checks:
- Cannot receive more than PO open quantity
- Supports partial receipts and cumulative tracking
- Includes status transitions (`DRAFT` -> `POSTED`)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Technical Plan
Duration: 10

Convert the functional spec into technical implementation steps using Spec-Kit's `/speckit.plan` command:

```text
/speckit.plan use the existing API endpoints and database (check the script in /db/migrations) to start developing the GR module. Make updates to existing files as necessary.
```

Review outputs in `specs/` (eg. `specs/001-add-gr-module/`):
- `plan.md`
- task breakdown and implementation notes

Execution guidance:
1. Implement GR backend APIs following the generated plan
2. Implement GR frontend pages using existing project patterns
3. Add unit/integration tests for business rules and edge cases
4. Validate with realistic sample data from migration/seed context

Final checkpoint: GR module is implemented end-to-end and aligned with spec + constitution

![plans](github-copilot-workshop-procurement-mvp/img-source/plans.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## The Full Spec-Kit Workflow
Duration: 10

Below is a description of the full Spec-Kit workflow using its custom agents

```
/speckit.constitution
    ↓  Establishes project principles, tech stack rules, and coding guidelines

/speckit.specify
    ↓  Captures requirements and user stories for the feature

/speckit.plan
    ↓  Produces a technical implementation plan for the chosen stack

/speckit.tasks
    ↓  Breaks the plan into a concrete, actionable task list

/speckit.taskstoissues          ← optional
    ↓  Converts task list into GitHub Issues for tracking

/speckit.implement
       Executes all tasks and builds the feature
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Break and Discussion (#8)
Duration: 15

- How did the constitution change what `/speckit.specify` produced compared to writing a spec from scratch?
- At which step did Copilot surface an edge case or constraint you had not considered?
- Would a new engineer on your team be able to verify the GR implementation against the spec without asking you?
- Which command in the chain added the most value? Which felt like overhead?
- Where would you introduce the Spec-Kit workflow first in your actual team — new features, bug fixes, or refactors?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Further Exploration: GR Module
Duration: 40

Use this session to implement the **GR (Goods Receipt)** module based on the specifications from the previous Spec-Kit slides.
You have **30 minutes**. You can also explore Spec-Kit's custom prompts and agents.

SDD frameworks like Spec-Kit help implementation start from a clear, reviewable specification before moving into technical planning and execution.

![grmod](github-copilot-workshop-procurement-mvp/img-source/grmod.png)

> aside positive
> 
> Check this recommended [guideline video on using Spec-Kit](https://www.youtube.com/watch?v=a9eR1xsfvHg) delivered by the creator of Spec-Kit himself.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Wrap-up, Retrospective, and Next Steps
Duration: 10

In this workshop, we learned to use GitHub Copilot to do the following:
- Using specifications to develop an application
- Started from a working baseline
- Delivered a new module end-to-end
- Utilizing agent functionality
- Using Spec-Kit as an SDD framework
- and many others

### Next Steps

- Try using Copilot in actual projects
- Challenge more complex application development
- Keep up with new Copilot features

### Resources

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [GitHub Copilot Best Practices](https://docs.github.com/copilot/using-github-copilot/best-practices-for-using-github-copilot)
- [CodeQL docs](https://docs.github.com/code-security/code-scanning/introduction-to-code-scanning/about-codeql)
- [Copilot Spaces](https://github.com/copilot/spaces)
- [Playwright docs](https://playwright.dev)

Great work! 🎉