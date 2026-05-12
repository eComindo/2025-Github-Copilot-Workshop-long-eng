author: Arie M. Prasetyo
summary: Crash Course - Adapting Software Development with AI Agents
id: ai-agent-crash-course
categories: AI, Development
environments: Web
status: Draft
feedback link: https://example.com/feedback

# AI Agent Adaptation Crash Course

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 01 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## About this crash course
Duration: 8

This crash course helps participants adapt to a new software development workflow where AI agents are active collaborators.

Concept:
- Traditional workflow: humans do most drafting and execution manually
- AI-agent workflow: humans provide direction, constraints, and quality checks
- Main skill shift: from only writing code to also orchestrating decision quality

Examples:
- Instead of writing a feature from scratch, ask an agent to generate a plan, then implement in controlled steps
- Instead of manually exploring a large codebase, ask the agent to map architecture and risks first

Task:
- Write a 3-sentence personal goal for this workshop:
  1. What part of your current workflow is slow?
  2. What do you want AI agents to help with?
  3. What quality bar must still be owned by you?

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 02 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## The new operating model
Duration: 7

Concept:
- Strong outcomes come from a loop: Frame -> Delegate -> Verify -> Iterate
- AI speed does not remove the need for engineering judgment
- Better context reduces hallucination and rework

Examples:
- Frame: provide repo context, target files, acceptance criteria, constraints
- Delegate: choose Ask for explanation, Plan for strategy, Agent for execution
- Verify: run tests, inspect diffs, validate assumptions

Task:
- Map one of your daily tasks into this loop in 4 bullets:
  1. Framing input
  2. Delegation mode
  3. Verification checks
  4. Iteration trigger

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 03 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 1 overview: execution foundation
Duration: 8

Concept:
- Phase 1 builds operational control before deeper architecture tasks
- Two foundations:
  1. Prompt mastery
  2. Tool mastery

Examples:
- Prompt mastery reduces ambiguous instructions and off-target outputs
- Tool mastery improves throughput by selecting the right mode at the right time

Task:
- Define one success criterion for each Phase 1 item:
  - Prompt mastery success criterion
  - Tool mastery success criterion

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 04 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 1 item: Prompt mastery
Duration: 15

Concept:
- Good prompts are precise, constrained, and measurable
- Effective prompt structure:
  1. Goal
  2. Context
  3. Constraints
  4. Output format
  5. Done criteria

Examples:
- Weak prompt: "improve this feature"
- Strong prompt: "In file X, refactor function Y to reduce duplication without behavior changes. Keep API unchanged. Add tests for edge cases A and B."

Task:
- Rewrite this weak prompt into a strong one:
  - Weak prompt: "fix performance issues in this module"
- Your final prompt must include:
  - target scope (specific files or symbols)
  - non-goals
  - measurable done criteria

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 05 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 1 item: Tool mastery
Duration: 15

Concept:
- Tool mastery is choosing Ask, Plan, or Agent intentionally
- Decision guidance:
  - Ask: understanding, trade-offs, explanation
  - Plan: multi-step approach and alignment
  - Agent: implementation and execution

Examples:
- Ask: "Explain this error and likely root causes"
- Plan: "Propose migration steps with risk controls"
- Agent: "Apply the approved plan and run verification"
- Optimization tip: explicitly mention filenames and symbols to improve relevance and reduce cost

Task:
- For each scenario below, select Ask, Plan, or Agent and explain why:
  1. New teammate needs architecture orientation
  2. Legacy service needs phased refactor
  3. You already approved approach and now need concrete edits

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 06 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 1 checkpoint (non-exercise)
Duration: 7

Concept:
- Prompt quality and tool selection are multiplicative
- If either is weak, output quality drops quickly

Examples:
- Strong prompt + wrong tool = slow progress
- Weak prompt + right tool = fast but misaligned output
- Strong prompt + right tool = high-quality throughput

Task:
- Self-assessment score (1-5) for:
  - Prompt precision
  - Mode selection confidence
  - Context completeness
- Write one immediate behavior change you will apply after this session

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 07 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 2 overview: solution architecture
Duration: 8

Concept:
- Phase 2 focuses on moving from execution quality to solution quality
- Three capabilities:
  1. Problem solving
  2. Creating specifications
  3. Creating system designs

Examples:
- Problem solving: identify root cause and choose feasible strategy
- Specification: turn ambiguous intent into verifiable requirements
- System design: map components, contracts, and trade-offs

Task:
- Pick one ongoing initiative from your team and write:
  - the main problem statement
  - one missing specification area
  - one design question still unresolved

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 08 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 2 item: Problem solving with AI
Duration: 14

Concept:
- High-quality problem solving requires separating symptoms from causes
- AI helps generate options, but humans must evaluate constraints and risk

Examples:
- Symptom: API latency spike
- Possible causes: DB lock contention, cache miss storm, inefficient query path
- AI-assisted approach: ask for hypotheses, then request a validation plan and ranked mitigations

Task:
- Use this template on a real problem:
  1. Problem statement (one sentence)
  2. Top 3 hypotheses
  3. Evidence needed for each hypothesis
  4. Decision and next experiment

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 09 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 2 item: Specification creation with AI
Duration: 14

Concept:
- Specifications convert intent into an executable shared contract
- Good specs are testable, scoped, and explicit about non-goals

Examples:
- Product spec sections:
  - user problem
  - target users
  - requirements
  - acceptance criteria
  - metrics
- Feature spec sections:
  - API contract
  - edge cases
  - rollout strategy
  - test plan

Task:
- Draft a one-page feature spec using AI support with these required headings:
  - Problem
  - Scope
  - Requirements
  - Non-goals
  - Acceptance criteria
  - Risks

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 10 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Phase 2 item: System design with AI
Duration: 14

Concept:
- System design is choosing component boundaries and trade-offs under constraints
- AI can accelerate option generation, but architecture decisions must remain intentional

Examples:
- Ask AI to produce 2 architectures: monolith-first vs service-split
- Compare them by latency, operational overhead, team skill fit, and migration risk
- Ask for a sequence diagram and data model draft to validate interaction flow

Task:
- Produce a mini design package for one feature:
  1. Context diagram
  2. Key components and responsibilities
  3. Data model outline
  4. Two trade-offs with chosen direction

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 11 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Capstone: integrated workflow challenge
Duration: 8

Concept:
- Real value comes from combining all five capabilities in one flow
- Sequence:
  1. Frame with prompt mastery
  2. Route with tool mastery
  3. Solve problem
  4. Write spec
  5. Produce system design

Examples:
- Scenario: "Add approval workflow to purchasing system with audit trail"
- Required outputs:
  - problem breakdown
  - feature spec
  - architecture sketch

Task:
- In small groups, produce a single shared artifact pack containing:
  - final prompt set
  - mode selection log (Ask/Plan/Agent)
  - concise feature spec
  - system design summary

---

<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = =  SLIDE 12 = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
## Wrap-up and adoption commitments
Duration: 2

Concept:
- Sustainable AI adoption is a behavior change, not a single tool upgrade
- The most durable improvement is consistent workflow discipline

Examples:
- Daily improvement: always define done criteria before asking an agent to implement
- Team improvement: keep specs and design notes as first-class artifacts

Task:
- Write one 14-day adoption commitment:
  - one workflow you will change
  - one metric you will track
  - one weekly checkpoint with your team
