# Workshop Offering: AI-Assisted Software Delivery with GitHub Copilot

## Purpose of This Outline

Client-facing presentation outline for a practical workshop on using GitHub Copilot to move from requirements to tested, documented software.

Based on [the procurement MVP workshop material](workshop_PROC_v3-C-compressed.md). The procurement application is the learning vehicle; the knowledge applies to other software development projects.

## Slide 1: From AI Coding to Disciplined Software Delivery

**Key message:** Help engineering teams use AI with clear intent, explicit specifications, and human judgment.

- Practical workshop using GitHub Copilot in VS Code and GitHub.
- Learn how to guide AI agents, integrate tools, and validate their work.
- Apply the techniques to extending an existing procurement application.

## Slide 2: The Challenges This Workshop Addresses

**Key message:** Generating code is only one part of delivering reliable software.

- Ambiguous requirements lead to inconsistent results and repeated rework.
- Agents need relevant context and clear project conventions.
- Generated code needs independent review, testing, and documentation.
- Unfocused sessions and unnecessary tool usage can increase token consumption.

## Slide 3: Who the Workshop Is For

**Key message:** Designed for technical teams adopting AI-assisted development in existing projects.

- Software developers learning practical Copilot workflows.
- Technical leads establishing shared implementation and review practices.
- QA and test engineers exploring AI-assisted test generation.
- Engineering teams interested in specification-driven development.

Participants should be comfortable working with source code, Git, and a local development environment. The workshop is not an introduction to programming.

## Slide 4: The Practical Learning Journey

**Key message:** Follow a feature from understanding the problem to reviewing the result.

1. Observe an application and capture its requirements.
2. Prepare repository context, instructions, and an implementation plan.
3. Generate UI code and integrate business functionality.
4. Validate behavior with tests and local quality checks.
5. Document the result and explore a repeatable specification workflow.

**Practical example:** Start with working Dashboard and Purchase Requisition modules, implement Purchase Orders, then explore Goods Receipts as an extension.

## Slide 5: Context Engineering and Effective AI Communication

**Key message:** Better direction starts with clear objectives and relevant evidence.

**Knowledge offered:**
- How LLMs use context and why it affects output quality.
- The roles of system instructions, user requests, and repository context.
- Communicating intent, constraints, expected behavior, and success criteria.
- Supplying plans, code, screenshots, and other relevant references.
- Choosing Ask, Plan, and Agent modes for different tasks.

**Practical exercise:** Compare results from different prompts and turn application observations into specification documents.

## Slide 6: Specification-Driven Development

**Key message:** Make requirements reviewable before asking an agent to implement them.

**Knowledge offered:**
- Moving beyond informal, iterative "vibe coding."
- Defining intent, behavior, constraints, edge cases, acceptance criteria, and data requirements.
- Using specification documents as shared implementation and review references.
- Turning an MVP plan into a sequenced runbook with checkpoints.
- Keeping specifications useful for testing, onboarding, and future changes.

**Participant output:** A refined implementation checklist focused on the Purchase Order backlog.

## Slide 7: Repository Instructions and Reusable Agent Workflows

**Key message:** Give AI assistants a consistent understanding of how the team works.

**Knowledge offered:**
- Repository-level instructions for product context, technology choices, and project conventions.
- Explicit expectations for testing, documentation, and completion criteria.
- Agent Skills for specialized, repeatable tasks.
- Reusable prompt files for common requests.
- Custom agents with a defined role and scope.

**Practical examples:** Improve repository instructions, add Vue and Figma skills, and create code-explanation prompts and a documentation-focused agent.

## Slide 8: Connecting Agents to External Tools with MCP

**Key message:** Give agents access to the systems needed for a specific task.

**Knowledge offered:**
- What Model Context Protocol servers do and when to use them.
- Configuring browser tooling to inspect an existing web application.
- Using browser observations to produce more detailed specifications.
- Connecting Figma designs to a frontend implementation workflow.
- Understanding access prerequisites and keeping tool use purposeful.

**Practical exercises:** Reverse engineer an application using Chrome DevTools MCP and generate a Vue page from a Figma design.

## Slide 9: Extending an Existing Application with Copilot

**Key message:** Build within an existing architecture instead of starting from a blank project.

**Knowledge offered:**
- Understanding an existing application's state and available APIs.
- Generating UI components from a design, then connecting them to backend services.
- Reusing components and established design patterns.
- Implementing list, create, and detail workflows.
- Enforcing business rules in the backend with clear validation responses.

**Practical example:** Complete Purchase Order pages and prevent allocations that exceed remaining approved requisition quantities.

## Slide 10: Testing, Validation, and Local Quality Gates

**Key message:** AI-generated work must be checked against expected behavior.

**Knowledge offered:**
- Generating readable unit tests for backend logic and frontend behavior.
- Reviewing tests critically rather than assuming generated assertions are correct.
- Creating Playwright end-to-end tests for successful and invalid workflows.
- Using reports, screenshots, traces, and videos to inspect failures.
- Adding a pre-push Git hook that blocks pushes when tests fail.

**Participant outputs:** Unit tests, a Purchase Order end-to-end test, and a local test gate.

## Slide 11: Documentation and API Discoverability

**Key message:** Make delivered functionality easier to understand, verify, and maintain.

**Knowledge offered:**
- Recording implementation status and available API endpoints.
- Generating product documentation grounded in the current application.
- Visualizing user flows and interactions with Mermaid diagrams.
- Adding Swagger/OpenAPI documentation to a Fastify backend.
- Checking that documented endpoints are available and callable.

**Participant outputs:** Progress documentation, application diagrams, and an interactive API documentation endpoint.

## Slide 12: Token-Aware and Efficient Agent Usage

**Key message:** Use AI resources deliberately while preserving the context needed for useful results.

**Knowledge offered:**
- Clarifying the problem before starting an agent session.
- Keeping persistent instructions focused and selecting skills and MCP tools selectively.
- Splitting work into manageable sessions and choosing models by task complexity.
- Defining stopping criteria and using deterministic tools for routine checks.
- Using RTK to reduce command-output volume in agent context.
- Using Graphify to explore a codebase through a generated knowledge graph, including an AST-only workflow.

**Practical examples:** Configure RTK usage instructions and generate and visualize a repository knowledge graph.

**Positioning note:** Efficiency benefits depend on the project, tools, and usage patterns; no fixed token savings are promised.

## Slide 13: Repeatable Specification Workflows with OpenSpec

**Key message:** Explore a lightweight framework for managing specifications and implementation changes.

**Knowledge offered:**
- Why teams may adopt a shared specification framework.
- Awareness of OpenSpec, Spec-Kit, Superpowers, and homegrown approaches.
- Initializing OpenSpec and using its Copilot integrations.
- Proposing a change, reviewing specifications, applying implementation tasks, and archiving the change.
- Checking business rules against the resulting implementation.

**Extension exercise:** Specify and implement Goods Receipts, including partial receipts and prevention of over-receiving against a Purchase Order.

## Slide 14: AI Workflows Beyond the IDE

**Key message:** Understand where browser-based agents and managed model platforms fit.

**Introductory coverage:**
- Using Copilot on GitHub.com for repository questions and background tasks.
- Understanding agent-created branches and draft pull requests.
- Using Copilot review feedback alongside human review.
- Introducing Microsoft Foundry for model discovery, testing, deployment, and agent development.

**Scope:** Platform orientation, not a dedicated Foundry deployment lab or an enterprise governance implementation.

## Slide 15: What Participants Can Take Back to Their Teams

**Key message:** Leave with practical artifacts and workflows that can be adapted to real projects.

- A procurement MVP extended with a Purchase Order workflow.
- A specification-based implementation checklist and progress record.
- Repository instructions and examples of reusable prompts, skills, and agents.
- Unit and end-to-end test examples with a local quality gate.
- Application documentation, diagrams, and API documentation.
- A working introduction to token optimization and OpenSpec.

**Expected capability:** Participants can practice a repeatable loop of clarifying, specifying, implementing, validating, and documenting an AI-assisted change.

Deliverables depend on completion of the exercises. Goods Receipts is an extension or self-paced activity, not a guaranteed core deliverable.

## Slide 16: Delivery Scope and Preparation

**Key message:** Confirm priorities and environment readiness before scheduling delivery.

- **Format:** Guided explanations, demonstrations, hands-on exercises, and review checkpoints.
- **Core project stack:** Fastify and JavaScript, Vue 3 and Vite, PostgreSQL in Docker, Jest, and Playwright.
- **Required preparation:** VS Code, GitHub account with Copilot access, Git, Node.js 20+, and Docker Desktop. Python supports the knowledge-graph tooling; uv is recommended.
- **Design exercise:** Figma account and access to the workshop design are needed for the Figma MCP lab.
- **Access checks:** Confirm repository access and that workshop tooling, external services, and MCP connections are permitted in the client environment.
- **Scheduling:** Agree on core labs, demonstrations, and optional extensions before confirming the agenda. The source targets a compressed 1.5-day format; validate exercise timings before offering a fixed schedule.

## Closing Message

GitHub Copilot supplies speed and breadth. Engineers remain responsible for intent, decisions, validation, and understanding. This workshop teaches teams how to combine both in a practical software delivery workflow.