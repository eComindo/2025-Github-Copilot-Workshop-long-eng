author: Arie M. Prasetyo
summary: GitHub Copilot Workshop - Procurement MVP
id: github-copilot-workshop-v4-halfday
description: 1 day compacted version, latest SDD documents folder structure
categories: AI, Development
environments: Web
status: Published
feedback link: 

change log:
22 Nov 2026
- Continuing from workshop_PROC_v3-C.md
- Updating the spec document folder structure of the sample app to be more similar to SDD frameworks
- Other minor updates
- Must use the new build system (new design system), i.e. `scripts/build-codelab.sh workshop_v4.md`

23 Nov 2026
- Compacted for 1 day event
- Essentials Copilot SDLC
- Audience is expected to have adequate technical knowledge working with all the technologies

# GitHub Copilot Workshop: Build a Procurement System MVP

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## About This Workshop
Duration: 10

*Dur: 10'*

Welcome. In this workshop, participants build a real-world procurement system MVP using GitHub Copilot in VS Code and GitHub.

![Octocat](image_source/octocat-copilot.png)

### Brownfield project for this workshop

We are going to work on an existing procurement system. This system already has two main modules/pages:
- Dashboard
- **PR (Purchase Requisition)** module

The aim is to build
- **PO (Purchase Order)**
- **GR (Goods Receipts)**
modules using Spec-Driven Development processes.

All the database tables are available in the provided SQL scripts and should be ready once participants completed the migration.

### Scope of the project
Application scope:

- Baseline provided:
  - *Home/Dashboard*
  - *PR module*
- Participant backlogs:
  - *PO module*
  - *GR module* (self-paced)
- Optional exploration:
  - *Bookmark feature* (for all modules) via GitHub Issue workflow

### Tech stack
- Backend: Fastify + JavaScript
- Frontend: Vue 3 + Vite + JavaScript
- Database: PostgreSQL in Docker
- Testing: Jest + Playwright
- Design: Figma + Figma MCP
- Support: Python

<!-- > aside positive
>
> You can access the slide deck at [https://bit.ly/eComindoCopilotWorkshop2026](https://bit.ly/eComindoCopilotWorkshop2026)

![qr_code](image_source/qr_code.png) -->

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## The Workshop's Project
Duration: 10

*Dur: 10'*

In this workshop we are going to build a **Procurement System** MVP (minimum viable product).

A procurement system manages how a company buys things, with control and traceability from request to receiving.

In simple terms, it helps answer:

- *Who requested what?*
- *Who approved it?*
- *What was ordered from which vendor?*
- *What quantity has been received so far?*
- *What is still open or pending?*

In this app, the workflow chain would be:

1. Purchase Requisition (PR) → **internal request** for goods/items
2. Purchase Order (PO) → **official order** sent to supplier to buy goods/items
3. Goods Receipt (GR) → record that **goods/items were received**

![Flow](image_source/flow.png)

### Definitions and Functions

1. Purchase Requisition (PR)
An internal document created by a requester (employee/department) to ask for goods or services.
2. Purchase Order (PO)
A commercial document issued to a vendor after PR approval.
3. Goods Receipt (GR)
A record that goods (or service delivery) were actually received against a PO.

#### One practical example:

1. PR: Maintenance team requests 10 safety helmets.
2. PO: Purchasing orders 10 helmets from Vendor A at agreed unit price.
3. GR: Warehouse receives 6 helmets today and records GR; later receives remaining 4 and records another GR.

Result: system shows requested = 10, ordered = 10, received = 10, open = 0.

So, a procurement app is essentially a controlled pipeline for spending:
```text
request → approve → order → receive
```
with quantities and statuses enforced at each step.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## AI, LLM, and Context Basics
Duration: 5

*Dur: 5'*

![AI](image_source/ai.png)

### Prompt anatomy in GitHub Copilot

- System instructions: global behavior and constraints
- User message: immediate task objective, the prompt written by the user
- Repository context: code, docs, config, the information available in the repo/workspace

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Why Context Matters - Part 1
Duration: 10

*Dur: 10'*

Open your favorite online LLM application (e.g., ChatGPT, Claude, Gemini, etc.) and write a prompt to recreate this image:

![target picture](image_source/target-picture.jpeg)

> aside positive
> 
> Be as specific as you can.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Why Context Matters - Part 2
Duration: 5

*Dur: 5'*

When working with an AI model, the problem (almost always) is not the AI. It is the brief you gave the AI.
The gap is not technical—it is communicative. Prompting—communicating with an AI model—is a skill that we need to master so we can provide AI models with the best direction for it to complete its task. You have to make your intention as clear as possible.


> aside positive
>
> **Open discussion**
> 
> Share your result with everyone. What do you think you can improve in your prompt to make your picture look as similar as the target picture? Do you think you share the responsibility if the result looks nothing like the target picture?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Token Optimization - Part 1
Duration: 5

*Dur: 5'*

The most expensive code an AI agent writes is the code you run without thinking. Today, the bottleneck is not anymore whether AI agents can write code. It’s whether you can use them economically.

### A. Develop your own analytical skills

#### A.1. Analysis is the real value
You have to able to describe the problem without ambiguity, name the constraints, and know what success looks like before you ask the agent to start implementation.

#### A.2. Keep your instructions concise and human-written
Your instruction file is too important for letting AI to generate it. Write it down by yourself.

#### A.3. Build architecture that speaks for itself
Good architecture is an optimization strategy. Treat it as such.

### B. Be strategic about what agents actually do

#### B.1. Use MCP strategically
Use MCP when you genuinely need the agent to interact with a system in real-time, in order to achieve your objective.

> aside positive
> 
> By default, turn all your agentic tools and MCP servers off.

#### B.2. Avoid SKILL.md unless you actually need it
Most of the time, your SKILL.md is just repeating what it knows, wasting tokens on context that does not add value.

Skills are very beneficial for proprietary knowledge, i.e. knowledge that you can be certain that LLMs are not trained on.


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Token Optimization - Part 2
Duration: 5

*Dur: 5'*

*(Continuing from our previous slide)*

#### B.3. Divide work into sessions, not monoliths
Divide tasks into sequential sessions, eg. research-planning-implementation. Long session is expensive because the context window is bloated the entire time.

#### B.4. Choose the right model for the task
Not every task needs your most powerful model.

- A reasoning-class model (like Claude Opus or GPT Astra) is excellent for planning, architecture, and debugging complex problems.
- Mid-tier models (Claude Sonnet, GPT Sol or Terra) are workhorses: they handle most implementation tasks efficiently.
- Smaller, faster models (Claude Haiku, GPT Luna) are excellent for repetitive tasks.

#### B.5. Use AGENTS.md to stop the agent early
A subtle but important detail: most agents will keep generating output until they hit their token limit. They are optimistic by default.

### C. Do not over-rely on agents for everything

#### C.1. Use deterministic tools when they exist
Want to check code quality? Use a linter. Want to find security issues? Use a scanner. Want to understand test coverage? Use an existing coverage tool.

> aside positive
>
> Tools like `rtk` improve shell output and make it easier for agents to parse with less token.

#### C.2. Create guardrails that do not require agents
Unit tests, linters, type systems, security scanning; none of these require tokens. All of them save tokens by preventing the agent from generating code that will need fixing later.

#### C.3. The agent is not your QA engineer
Validation is not optional. It is your job, and it saves you money in the long run by catching mistakes before they multiply.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Reverse Engineer an Application
Duration: 15

*Dur: 15'*

In this workshop we are going to learn how to use specifications to create an application. We are going to use Copilot to create specifications of an existing application.

### Check the sample application
1. Open the web application at [https://simplydemo.secure.simplybook.me/v2/dashboard/new](https://simplydemo.secure.simplybook.me/v2/dashboard/new)
2. Login using these credentials:
  a. login: `admin`
  b. password: `demo`

![reverse](image_source/reverse.png)

### Install an MCP server

An MCP Server (Model Context Protocol Server) is a universal adapter that securely bridges AI models with external tools, databases, and services.

For this exercise we are going to use the `chrome-devtools` MCP. It allows Copilot to perform browsing actions on a headless browser.

1. Open the MCP configuration file in VS Code.
2. Copy this line to connect VS Code to the MCP server:
```bash
"chrome-devtools": {
  "command": "npx",
  "args": ["-y", "chrome-devtools-mcp@latest", "--slim", "--headless"]
}
```

### Prompt

Before executing the prompt, let's add a file to create a more comprehensive context.

1. Create a new workspace.
2. Open the workspace in VS Code.
3. Create a file called `plan.md`
4. Put the content below in `plan.md`:

```prompt
Based on the following url https://simplydemo.secure.simplybook.me/v2/dashboard/new, create a comprehensive specification of a fully working web application with the following structure template.

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

1. Use [chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) to access the web application above.
2. Use the following credentials to access the application:
  - login: `admin`
  - password: `demo`
```

Once the file `plan.md` is ready, enter this prompt in Copilot Chat:

```prompt
Use the file #plan.md to conduct a reverse engineering process, ie. from application to specification documents.
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Prerequisites
Duration: 5

*Dur: 5'*

Before continuing, let's make sure all the prerequisites are ready:

- Latest VS Code
- GitHub Copilot extension
- GitHub account + Copilot license
- Docker Desktop running
- Node.js 20+
- Git
- Figma account (recommended)
- Python
- [uv Python package and project manager](https://github.com/astral-sh/uv) (recommended)

![vscode](image_source/vscode.png)

Optional MCP tools:
- VS Code extension Markdown Preview Enhanced
- GitHub MCP Server
- Figma MCP integration available in Copilot/agent environment

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Fork the Repository
Duration: 10

*Dur: 10'*

Open the project URL: [https://github.com/eComindo/2026-github-copilot-workshop](https://github.com/eComindo/2026-github-copilot-workshop)

![github repo](image_source/github-repo.png)

1. Open the project URL in your browser
2. Fork the repo. You can click the **Fork** button, on the top right

![fork](image_source/fork.png)

> aside negative
> 
> You can also `clone` the repository if the `fork` process is unavailable.
> Please make sure not to try merge it with the `main` branch.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Setup the Project Locally
Duration: 15

*Dur: 15'*

Go to your forked repo and clone it to your local machine.

### 1. Set up the repo

```bash
git clone https://github.com/<your-username>/<forked-repo>.git
cd <repo>
git checkout -b feature/po-module
```

Ensure project reference and persistent instruction documents are available:
- `docs/product-context.md`
- `.github/copilot-instructions.md`

### 2. Prepare the database

Ensure bootstrap files used by all participants are available:

*Migration and seeding scripts*
- `db/migrations/001_init_procurement_mvp.sql`
- `db/seeds/002_seed_procurement_mvp.sql`

*Shell script to perform the migration and seeding*
- `docker/postgres/init/00-init-mvp-db.sh`

> aside negative
>
> Cross-OS readiness note:
> Bootstrap supports Windows, macOS, Linux via LF line endings for `.sh` and `.sql` in `.gitattributes`

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Database Bootstrap Using Docker
Duration: 10

*Dur: 10'*

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

> aside negative
>
> If you have another instance of PostgreSQL running in your machine, don't forget to turn it off first.
> On Windows, you can check `services.msc`. On Mac, use the Activity Monitor.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Configure Local Credentials
Duration: 15

*Dur: 15'*

### 1. Install libraries

Let's install all the libraries required to run the application.

Run `npm install` **3 times**, each in:
1. `/` (project root)
2. `backend/`
3. `frontend/`

### 2. Config for backend server

Create backend's environment variable: `backend/.env`:
```env
PORT=3000
DATABASE_URL=postgres://workshop:workshop@localhost:5433/procurement_mvp
```

The backend server is running on port 3000.

### 3. Config for frontend server

Create frontend's environment variable: `frontend/.env`:

```env
VITE_API_BASE_URL=http://localhost:3000
```

This will tell the frontend the address of the backend service.

### 4. Start the application

To run the app, execute `npm run dev` from root.

Open the app (frontend server) on `http://localhost:5173`.

Base expectations:
- Home/Dashboard page available
- PR list/create/detail pages available
- PR APIs connected to DB (the data from DB is shown in the PR list page)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Agent's Persistent Instructions Checklist
Duration: 15

*Dur: 15'*

Manually open `copilot-instructions.md`. This file contains the "system message", the message that will always embedded alongside the prompts entered into Copilot by user (also known as "user message").

This file is also known as the "persistent instruction". Different agents use different persistent instruction files. For example, Claude uses CLAUDE.md. Copilot uses `copilot-instructions.md` inside the `.github/` folder.

In this file you can add more rules such as:
- "Always update `docs/product-context.md` after large changes"
- "Add tests for new logic."
- "Always use descriptive naming."

### Good Persistent Instruction

What makes a good persistent instruction file? You have to, at least, make sure it contains the product context & tech stack. You can also add code convention, unit testing strategy, or tell the agent to never read the `.env` file. This file should contain all the conventions, rules, and exceptions that you want the agent to follow.

And it is an evolving file. So you can always improve this file alongside the project.

> aside positive
> 
> For the persistent instruction file we use in this project, we added token optimization instructions based on this gist: [AGENTS.md](https://gist.github.com/arisetyo/8d6282bb1035ffb87c7cdb5341e944ce)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Token Optimization - Part 3
Duration: 15

*Dur: 15'*

### Tool: RTK

[RTK](https://github.com/rtk-ai/rtk) is installed globally on our computer. It is a tool (written in Rust) that filters and compresses command outputs before they reach your LLM context.

#### Installation

Homebrew (recommended)
```bash
brew install rtk
```

Cargo
```bash
cargo install --git https://github.com/rtk-ai/rtk
```

> aside negative
>
> Check the pre-built binaries [here](https://github.com/rtk-ai/rtk#pre-built-binaries) for installation instruction on other systems.

Verify installation
```bash
rtk --version
```

Check token savings stats
```bash
rtk gain
```

![rtk_gain](image_source/rtk_gain.png)

#### Usage

Add these lines into `AGENTS.md`:

![rtk](image_source/token_opt.png)

**Example text:**

> aside negative
> RTK — Token-Optimized CLI
> 
> **rtk** is a CLI proxy that filters and compresses command outputs, saving 60-90% tokens.
> 
> Rule
> 
> Always prefix shell commands with `rtk`:
> 
> ```bash
> # Instead of:      Use:
> git status         rtk git status
> git log -10        rtk git log -10
> docker ps          rtk docker ps
> ```
> 
> Other examples where you can use `rtk`:
> ```bash
> rtk tree
> rtk ls -la
> rtk read
> rtk grep
> rtk rg
> rtk npm run test
> rtk curl <url>
> ```
>

> aside positive
>
> You can adjust the examples according to your project's needs. Check other command examples in [here](https://github.com/rtk-ai/rtk#quick-start).

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Token Optimization - Part 4
Duration: 15

*Dur: 15'*

### Tool: Graphify

Graphify is a set of tools for AI coding assistants.
By combining Tree-sitter static analysis with LLM-driven semantic extraction, Graphify turns an entire repository — including source code, documentation, research papers and diagrams — into an interactive graph that explains both what the code does and why it was designed that way.

![graphify](image_source/graphify.png)

In this example we are going to use a tool (written in Python) to build a queryable knowledge graph from our repo's documents and codebase.

#### Installation

**Note that there are two "y"'s in the installation command. But the installed tool will only have one "y"*
```bash
uv tool install graphifyy
```

#### Configuration

When scanning the repo to create a knowledge graph, we can choose not to use LLM, so no token cost.

To make sure Graphify creates a pure, AST-based knowledge graph of only our source code (costing $0 and zero LLM tokens), let's first create the `.graphifyignore` file and fill it with this:
```env
# Ignore documentation and text assets
*.md
*.txt
*.pdf
*.html

# Ignore images, diagrams, and video walkthroughs
*.png
*.jpg
*.jpeg
*.svg
*.mp4
*.wav

# Ignore config and infrastructure files (which sometimes trigger semantic parsing)
*.yaml
*.yml
*.json
*.toml

# Ignore generated build artifacts and test output (contain minified code that pollutes the graph)
playwright-report/
test-results/
coverage/
graphify-out/

# Ignore HTML files (build output, reports)
*.html
```

Then run this to start the scanning process:
```bash
graphify .
```

Graphify will look at the code files (e.g., `.py`, `.js`, `.go`, `.rs`, etc.), pull them through the local syntax tree parser, and write the final knowledge graph directly to `graphify-out/graph.json` without making a single network call.

### Visualize The Graph

To visualize how the graph looks like to AI model, we can run this command:

```bash
graphify cluster-only
```

This command will create an HTML that visualizes `graph.json` for us humans.

![graphify-graph](image_source/graphify-graph.png)


> aside positive
> 
> We can also create reports on how each file works based on the graph using this command:
>
> `uvx --from graphifyy graphify export callflow-html`
>

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## The Problem with Vibe Coding
Duration: 10

*Dur: 10'*

![vcdead](image_source/vcdead.webp)
*Image source: [Vibe Coding Is Dead. Here’s What Replaced It.](https://ai.plainenglish.io/vibe-coding-is-dead-heres-what-replaced-it-aa7d2889b05a)*


You probably have experienced this pattern:
- You write a prompt describing roughly what you want
- Copilot generates something plausible
- You iterate — adjusting, correcting, re-running
- Eventually it looks right

This works for fast prototyping. It does not work for production-grade, maintainable, auditable software — especially in a regulated banking environment. The output is only as precise as your prompt, and prompts are inherently imprecise.

### What is a "spec"?

A "spec" (short for specification) is a structured, human-readable document that defines:

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
Duration: 10

*Dur: 10'*

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

- Create and maintain spec docs before large features. You can store it in a specific folder in your repo/workspace. In this project, we store it in the `docs/specs/` folder.
- We can keep guardrail docs for architecture, naming, and patterns, e.g., in a `guidelines/` folder.
- If required, you can create a dedicated document that explains the tech-stack decisions and coding conventions.

> aside positive
> Make sure `.github/copilot-instructions.md` are aware of the locations of these spec documents. This will ensure that the documents can be invoked as relatable context.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Create New Spec
Duration: 10

*Dur: 10'*

To start this project, we use the available product context document.

Attach the file `docs/product-context.md` in Copilot and enter this prompt:

```prompt
Create specification for the development of the Purchase Order module.
Check the attached product context on what this module is for.
Save the specification in the empty `docs/specs/001-module-PO.md` file.
```

Here we are creating a new "spec" document, a document that contains all the items the agent needs to implement in order to create the next module (Purchase Order).

![plan-po](image_source/plan-po.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Agent Skills
Duration: 10

*Dur: 10'*

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
## Adding Agent Skill
Duration: 10

*Dur: 10'*

### 1. Adding "skills" support
Create a new folder `.github/skills`

This will be the location for all the skill configurations.

### 2. Add a Figma design implementation skill
- Create a new folder `.github/skills/figma-implement-design`
- In that folder, create a new file `SKILL.md`
- Copy the raw content of the markdown document in [this link](https://github.com/openai/skills/blob/main/skills/.curated/figma-implement-design/SKILL.md?plain=1) to that file you have just created.
- Download or recreate the rest of the files in the [https://github.com/openai/skills/tree/main/skills/.curated/figma-implement-design](https://github.com/openai/skills/tree/main/skills/.curated/figma-implement-design) folder.

> aside positive
> You can learn more about adding skills on this [official GitHub page](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Figma MCP Setup
Duration: 15

*Dur: 15'*

Figma is the default tool for designing frontend pages and user interfaces.

Adding Figma MCP allows the AI model to access a Figma file directly.

### Modify the MCP config
1. Use the Command Palette, open the MCP configuration file `mcp.json`.

![mcp-config](image_source/mcp-config.png)

2. Add Figma configuration in the `mcp.json` file.

![mcp-figma](image_source/mcp-figma.png)


### Important Note

> aside positive
>
> [Link to the Figma file](https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?node-id=38-782&p=f&t=kto9reqIhe3VcQZi-0)

Before you ask Copilot to access a Figma file, make sure that:
- you are logged in to Figma
- confirm workshop file and node IDs are accessible
- confirm that the Figma file owner has already assigned access to you

> aside negative
> To make sure the frontend codes implement the Figma design as accurate as possible, we need at least two things:
> - Figma implementation skill
> - Figma file that implements best practices
>
> Check [this article](https://arie-m-prasetyo.medium.com/figma-recommended-practices-in-the-age-of-ai-e766b098ef9f) to learn about best practices for designing UIs in Figma for AI interpretation.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = DAY 2 = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Using Figma MCP
Duration: 15

*Dur: 15'*

Start developing the PO module by generating the **Create PO** page.

We will be using a design in Figma to create the frontend codes.

Use Agent mode in Copilot chat and enter the prompt below:

```prompt
- Using Figma MCP, generate Vue code for the PO Create page from this Figma file https://www.figma.com/design/1PpeiduceHdtCB0Qds30am/Github-Copilot--Workshop-?node-id=38-323&p=f&t=QJcJvfEN1Kpy8NGa-0
- Include reusable components for header form and line allocation table
- Keep structure simple
- IMPORTANT: Do not implement backend API or backend integration yet.
```

Scope for generated page:
- Header section (vendor, PO date, notes)
- Line table section (approved PR open lines, allocate qty, unit price)
- Actions (save draft, submit)

> aside negative
> 
> If you have trouble accessing Figma through MCP, try copying the Figma file to your Figma account.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Add Tests with Copilot
Duration: 15

*Dur: 15'*

Ask Copilot to help us create unit tests for the pages we have just created.
Enter this prompt:

```prompt
- Create unit tests for important backend functions. Focus on services that provide lists to the frontend.
- Create Jest tests for frontend validations. Focus on rendering of pages and components.
- Keep tests readable.
```

Unit test result:
![tests](image_source/tests.png)

Unit test coverage report:
![coverage](image_source/coverage.png)

> aside negative
>
> One of the problems of AI models is that they are eager to please. Make sure your tests are actually producing good assessments, not just reinforcing mistakes in your code.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Project Progress Review
Duration: 10

*Dur: 10'*

It is best practice to have a document that tracks the status of the project. This can help Copilot get context on the overall status of the system we are building.
Use **Agent** mode and enter this prompt:

```prompt
- Analyze and summarize what is already implemented.
- Identify the available API endpoints for PO module.
- Update `docs/progress.md` with the latest state of the project.
```

The goal here is to make Copilot aware of what has been done and avoid redundancy.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Implement "Create PO" Page
Duration: 15

*Dur: 15'*

Use this prompt to start integrating the Create PO page. Attach the related documents to provide context to Copilot.

```prompt
- Integrate the available PO endpoints with the "Create PO" page.
- Keep generated Figma components and wire them to purchase order APIs.
```

The end result should be a working PO Create page.

![create po](image_source/create-po-page.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Complete the PO Module
Duration: 30

*Dur: 30'*

Create the rest of the PO module pages and connect them to the PO module API endpoints.

We don't have Figma file for these pages, so ask Copilot to follow the existing design rules (using available codes as context).

```prompt
- Finish the PO module.
- Implement PO list and detail pages in Vue using existing patterns.
- Keep UI simple for clarity and follow the existing design system.
- Use existing components when possible. Only create components that aren't already available.
- Connect the new pages with the existing backend API endpoints for PO module.
```

The end result should be
- PO List page
- PO Detail page

![po detail](image_source/po-detail.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Copilot in GitHub
Duration: 15

*Dur: 15'*

Copilot is also available on Github's website. Click on [this link](https://github.com/copilot/) to open Copilot on Github.

![copilot home](image_source/github-copilot-home.png)

Let's see some of the things Copilot can do for us in the Github website.

### 1. Add PR Summary

We can ask Copilot to add Pull Request description.

1. Commit the changes from the previous slide.
2. Push to your repo.
3. Open your Github repo page, create a new Pull Request.

![generate summary](image_source/generate-summary.png)

The summary from Copilot:
![summary](image_source/copilot-pr-review.png)


It will create a comprehensive PR description based on the commits in the branch that we wanted to merge.


### 2. Add As PR Reviewer

We can also add Copilot as a reviewer to a Pull Request. Very handy if you're working solo on a project.

After pushing, let's create a Pull Request on GitHub.com and utilize Copilot's code review functionality.

1. Access your repository on GitHub
2. Click **Open a pull request**
3. On the Pull Request creation screen, click **Copilot icon** >> **Summary**

![PR Reviewer](image_source/request-copilot-review.png)

In the **Reviewers** section, you can assign **Copilot** as a reviewer to request code review from Copilot.

Copilot would check all the files in the PR and make appropriate comments.

> aside positive
>
> **Auto-assign Setting**: By checking Settings >> Branches >> Rulesets >> Require a pull request before merging >> Automatically request Copilot code review, Copilot will be automatically assigned when opening Pull Requests.

After the Pull Request is opened, you can view Copilot Code Review results:

- **Pull Request Overview**: Summary of code changes
- **Issues Identified**: Pointing out potential problems
- **Improvement Suggestions**: Specific suggestions for improving code quality

![copilot comment](image_source/copilot-pr-comment.png)

> aside negative
>
> **Note**: Depending on the PR size, you might need to wait for Copilot to finish creating a summary or adding PR reviews.

> aside positive
>
> **Pro Tip**: not confidence about your PR? Anxious that the senior devs are going to roast your PR? Let Copilot review your PR first, before you add other reviewers.

You can go ahead ask Copilot to work on its proposed changes to the PR. It will automatically create a new separate PR that targets your working branch in the original PR.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Product Documentation
Duration: 10

*Dur: 10'*

Ask Copilot to generate implementation docs with diagrams.

Prompt:

```prompt
- Create documentation for how the current application works.
- Add a user flow chart and sequence diagram in Mermaid.
- Save as `docs/product-technical-documentation.md`.
```

Use your favorite markdown viewer plugin to check the result, including the charts.

Because the charts are created using [Mermaid format](https://mermaid.js.org/), you can also copy-paste the Mermaid code into Mermaid's tool.

> aside negative
> 
> Below are some screenshots of documentation created by Copilot for a simple Pomodoro app. Our procurement MVP app would have a more complex documentation.

![App documentation](image_source/chart0.png)

![App documentation](image_source/chart1.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Custom Prompts and Agents
Duration: 15

*Dur: 15'*

### Prompt Files

Prompt files define reusable **prompts for specific tasks** that you can invoke when needed. We define it in a markdown file inside the `.github/prompts/` folder.

#### 1. Create a "code explainer" agent

1. In the Chat view, select Open Customizations in the title bar to open the Agent Customizations editor, and then select Prompts.
2. Select New Prompt (plus icon) next to the Workspace or User group, depending on where you want to store the prompt file.

![create prompt](image_source/create-prompt-file-2.png)

3. Select the location and enter a file name for your prompt file. This is the default name that appears when you type / in chat.
4. Replace the generated content with this self-contained prompt:

```text
---
name: code-explainer
agent: agent
description: Generate a clear code explanation with examples
---

Explain the pasted code in a clear, beginner-friendly way.

* A brief overview of what the code does
* A step-by-step breakdown of the main parts
* Explanation of any key concepts or terminology
* A simple example showing how it works
* Common use cases or when you might use this approach

Use clear, simple language and avoid unnecessary jargon.
```

5. Save the file. You can modify it later by opening it in the Agent Customizations editor.

> aside positive
>
> As alternatives, run `Chat: New Prompt File` or `Chat: New Untitled Prompt File` from the Command Palette, or enter `/prompts` in a *Local* chat to open Configure Prompt Files.


### 2. Custom Agents

Other than the default agent provided by Copilot, you can create your own custom agent for specific use cases. Like custom prompts, we define custom agents in a markdown file inside a specific folder, in this case the `.github/agents/` folder.

#### Create a "readme creator" agent

1. Create a file: `.github/agents/readme-creator.agent.md`
2. Add this into the file:

```text
---
name: readme-creator
description: Agent specializing in creating and improving README files
tools: ['read', 'search']
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

> aside positive
> 
> Open **Agents** in the **Agent Customizations** editor and confirm that your custom agent is listed without file errors.

![custom-agent](image_source/custom-agent.png)

> aside positive
>
> You can create as many custom prompts and agents as you want. Be creative, try creating some custom prompts and agents for your specific needs.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## SDD Frameworks
Duration: 10

*Dur: 10'*

<!-- Below is an example of spec documents created using an SDD framework "OpenSpec" for the development of GR module: -->

<!-- ![sk-files2](image_source/sk-files2.png) -->

### 1. Why use framework

SDD frameworks can help us create a standardized specifications throughout the organization.

Why use a ready-made framework:
- developing your own SDD standard takes time and resources
- you can use ready-made custom prompts, agents, and spec templates
- with a supportive community, the framework can continue to improve

![OpenSpec](image_source/openspec.png)

> aside positive
> 
> OpenSpec is one of the popular SDD frameworks, known for its simplicity & small size.

Common SDD framework options:
- Homegrown docs in `docs/` or `specs/` and custom prompts/agents
- [OpenSpec](https://openspec.dev/)
- [Spec-Kit](https://github.com/github/spec-kit)
- [Superpowers](https://github.com/obra/superpowers)

Comparison matrix of various SDD frameworks:

![SDD frameworks](image_source/sdd-fs.jpg)
*Source: [Comparing 15 SDD frameworks - Medium](https://medium.com/@wasowski.jarek/comparing-15-spec-driven-development-frameworks-sdd-c052df529274)*


### 2. Why spec matters in AI-enabled SDLC

A good spec does not die when the code is written. It becomes:

- The reference for PR reviewers: *does this implementation match the spec?*
- The source for test generation: *do the tests cover all acceptance criteria?*
- The input for the next feature: *what was built, and where are the boundaries?*
- The onboarding guide for new engineers: *what was this module intended to do?*

> aside positive
>
> A framework is helpful, but not mandatory. You can still run SDD using your own templates and process.

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## OpenSpec - SDD Framework
Duration: 15

*Dur: 15'*

OpenSpec is a lightweight framework for SDD.

OpenSpec has these philosophies:
- fluid not rigid
- iterative not waterfall
- easy not complex
- built for brownfield not just greenfield
- scalable from personal projects to enterprises

### Getting started OpenSpec

Install OpenSpec globally:

```bash
npm install -g @fission-ai/openspec@latest
```

Go to your root folder in the terminal/console and initialize OpenSpec:

```bash
cd <your-project-folder>
openspec init
```

On this screen, press enter to continue:
![OpenSpec init](image_source/openspec-init.png)

If GitHub Copilot is automatically detected, you can press enter to continue:
![OpenSpec setup 1](image_source/openspec-setup-1.png)

Once setup is complete, restart VS Code to let the changes take effect:
![OpenSpec setup 2](image_source/openspec-setup-2.png)

### Expected outcome:

Once you have completed setting up OpenSpec, you will see:
- New custom skills and prompts by OpenSpec
- New slash commands (eg. `/opsx:explore`, `/opsx:new`) in the GitHub Copilot Chat's text input

New custom skills and prompts:
![OpenSpec result 1](image_source/openspec-result-1.png)

New slash commands:
![OpenSpec result 2](image_source/openspec-result-2.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Getting Started with OpenSpec
Duration: 10

*Dur: 10'*

### OpenSpec workflow

The standard workflow for OpenSpec is a fluid, iterative workflow for spec changes. No rigid phases, just actions you can take anytime.
- Actions, not phases — create, implement, update, archive — do any of them anytime
- Dependencies are enablers — they show what's possible, not what's required next

![OpenSpec flow](image_source/openspec-flow-small.png)

Most common OpenSpec commands:
| Location | Command | Note |
|---|---|---|
Terminal | `$ npm install -g @fission-ai/openspec@latest` | 
Terminal | `$ cd <your-project> && openspec init` | 
Copilot Chat | `/opsx:explore` | (optional: think it through first)
Copilot Chat | `/opsx:propose add-dark-mode` | (AI drafts the plan; you review it)
Copilot Chat | `/opsx:apply` | (AI builds it)
Copilot Chat | `/opsx:archive` | (specs updated, change filed away)

Below is some examples of what you can do with OpenSpec commands:

![OpenSpec example](image_source/openspec-example.png)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Re-Create GR Module
Duration: 15

*Dur: 15'*

Let's re-create the GR (Good Receipts) module using OpenSpec.

Create a functional specification for the GR module using OpenSpec `/opsx:propose` command:

```prompt
/opsx:propose goods-receipts-module
```

After the proposition process is done, you will get the specification documents for the GR module.

![openspec propose 1](image_source/openspec-propose-1.png)

You can check the specification documents in the newly created `openspec/` folder:

![openspec propose 2](image_source/openspec-propose-2.png)

> aside positive
>
> Suggested GR spec checks:
> - Cannot receive more than PO open quantity
> - Supports partial receipts and cumulative tracking
> - Includes status transitions (`DRAFT` -> `POSTED`)

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Implementation with OpenSpec
Duration: 20

*Dur: 20'*

Use this session to implement the **GR (Goods Receipt)** module based on the specifications from the previous process.

You have **30 minutes**.

You can also explore OpenSpec's custom prompt and skill files. Check [this documentation](https://github.com/Fission-AI/OpenSpec/blob/main/docs/getting-started.md) for more information about OpenSpec's workflow.

### Implementation

Type this in the GitHub Copilot Chat:

```prompt
/opsx:apply
```

Once the implementation is finished, review the result:
1. Implementation of GR backend APIs
2. Implementation of GR frontend pages using existing project patterns
3. Unit/integration tests for business rules and edge cases

Validate with realistic sample data from migration/seed context. Final checkpoint: GR module is implemented end-to-end and aligned with spec + constitution

![grmod](image_source/grmod.png)

> aside positive
> 
> SDD frameworks help implementation start from a clear, reviewable specification before moving into technical planning and execution.
> 
> Check this [introduction to OpenSpec](https://www.youtube.com/watch?v=N-MftbmnmMo) from its YouTube channel.

### Archive the spec

Use this command to archive the spec once the implementation is complete.

```prompt
/opsx:archive
```

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = SLIDE = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Wrap-up, Retrospective, and Next Steps
Duration: 10

*Dur: 10'*

In this workshop, we learned to use GitHub Copilot to do the following:
- Using specifications to develop an application
- Started from a working baseline
- Delivered a new module end-to-end
- Utilizing agent functionality
- Using OpenSpec as an SDD framework
- and many others

### Next Steps

- Try using Copilot in actual projects
- Challenge more complex application development
- Keep up with new Copilot features

### Resources

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [GitHub Copilot Best Practices](https://docs.github.com/copilot/using-github-copilot/best-practices-for-using-github-copilot)
- [Copilot Spaces](https://github.com/copilot/spaces)
- [Playwright docs](https://playwright.dev)

Great work! 🎉