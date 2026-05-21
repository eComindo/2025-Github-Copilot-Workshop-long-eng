# Post-Workshop Test - BTPNS

This post-workshop test contains 10 MCQs:
- 5 questions on practical Copilot usage (50%)
- 3 questions on Spec-Driven Development / SDD (30%)
- 2 questions on Spec-Kit workflow (20%)

Each question has 5 options (A-E), with 1 correct answer and 4 distractors.

---

## Question 1 (Copilot Usage)
During implementation of the PO Create page, the team must enforce allocation rules and provide clear errors when rules are violated. Which approach best aligns with workshop expectations for robust Copilot-assisted delivery?

A. Enforce business rules only in frontend form checks to improve speed.
B. Skip validation during development and add it after user feedback.
C. Implement backend rule enforcement with clear 422 responses and readable messages.
D. Return generic 500 errors so clients can retry automatically.
E. Allow over-allocation in draft mode and fix data during nightly jobs.

**Correct answer:** C

**Explanation:** The workshop specifically requests over-allocation validation with clear 422 responses, which belongs in reliable backend rule enforcement.

---

## Question 2 (Copilot Usage)
When integrating Figma-generated Vue components with live APIs, which approach best preserves maintainability?

A. Replace all existing components with generated ones for visual consistency.
B. Keep reusable generated structure, then wire data and actions to existing API patterns.
C. Avoid existing design system conventions to keep generated code untouched.
D. Move all API calls into one giant component to reduce file count.
E. Disable type and lint checks to minimize friction during integration.

**Correct answer:** B

**Explanation:** The workshop asks participants to keep generated structure where useful but still follow existing module conventions and API contracts.

---

## Question 3 (Copilot Usage)
After Copilot generates tests, what is the most important check before trusting them as a quality signal?

A. Confirm that test files were created and committed to the branch.
B. Check whether assertions truly validate business behavior, not just implementation details.
C. Prefer the longest test files because more lines imply better coverage.
D. Focus only on snapshot tests to reduce maintenance effort.
E. Ignore negative paths if happy path coverage is above 80%.

**Correct answer:** B

**Explanation:** The workshop warns that AI-generated tests can look convincing while missing real business validation.

---

## Question 4 (Copilot Usage)
A participant asks Copilot to complete PO list and detail pages without Figma references. Which instruction should guide the implementation?

A. Build a completely new visual language independent of existing UI.
B. Reuse available components and follow established project design patterns.
C. Generate every screen from scratch to maximize originality.
D. Prioritize animation over data clarity for procurement records.
E. Skip backend integration until all pages are visually finalized.

**Correct answer:** B

**Explanation:** The workshop says to follow established design rules and reuse existing components whenever possible.

---

## Question 5 (Copilot Usage)
The workshop asks for PO end-to-end tests with both happy path and negative over-allocation path. Why does this matter?

A. It helps ensure core flow works and critical validation failures are also enforced.
B. It guarantees no future refactoring will break unrelated modules.
C. It removes the need for backend unit and integration tests.
D. It allows teams to skip manual exploratory testing completely.
E. It proves AI-generated selectors never become flaky over time.

**Correct answer:** A

**Explanation:** Both paths verify not only that valid flows succeed, but also that invalid operations are correctly blocked.

---

## Question 6 (SDD)
In Spec-Driven Development, what is the most accurate role of a specification when building modules like PR, PO, and GR in a controlled procurement workflow?

A. A temporary note that can be deleted once code compiles.
B. A replacement for architecture decisions and team conventions.
C. A contract connecting intent to implementation with testable criteria.
D. A UI style guide focused mainly on colors and typography.
E. A script that automatically creates database tables.

**Correct answer:** C

**Explanation:** The workshop defines a spec as a structured contract including behavior, constraints, edge cases, and acceptance criteria.

---

## Question 7 (SDD)
Why does SDD improve collaboration across engineering, QA, and product stakeholders compared with purely prompt-driven coding?

A. Because it reduces the need for any written communication.
B. Because it centralizes assumptions and acceptance criteria in a reviewable artifact.
C. Because it eliminates disagreements by locking requirements forever.
D. Because it guarantees implementation speed regardless of complexity.
E. Because it avoids the need for sequence or flow diagrams.

**Correct answer:** B

**Explanation:** Shared specs make assumptions and acceptance criteria explicit, enabling clearer reviews and handoffs.

---

## Question 8 (SDD)
A team wants to improve quality without slowing delivery too much. According to the workshop, which sequence is most sensible for substantial new functionality?

A. Code first, then infer requirements from implementation behavior.
B. Write tests first without requirements, then adjust scope later.
C. Define or refine spec, plan checkpoints, implement iteratively, validate continuously.
D. Generate a complete module in one prompt and review only at release.
E. Delay all documentation until post-mortem.

**Correct answer:** C

**Explanation:** The workshop promotes spec-first planning, iterative implementation checkpoints, and continuous validation.

---

## Question 9 (Spec-Kit)
In the Spec-Kit workflow, what is the practical purpose of running /speckit.constitution before /speckit.specify and /speckit.plan?

A. It creates random tasks to stress-test team velocity.
B. It defines project guardrails so later spec and plan outputs follow consistent rules.
C. It replaces branch strategy and issue tracking conventions.
D. It compiles frontend assets for preview in production.
E. It automatically approves pull requests based on template matching.

**Correct answer:** B

**Explanation:** Constitution sets the baseline rules so downstream specification and planning outputs stay consistent.

---

## Question 10 (Spec-Kit)
For a new module such as GR, which Spec-Kit command sequence best matches the full flow in the workshop?

A. /speckit.tasks -> /speckit.implement -> /speckit.constitution -> /speckit.specify
B. /speckit.plan -> /speckit.specify -> /speckit.constitution -> /speckit.implement
C. /speckit.specify -> /speckit.constitution -> /speckit.tasks -> /speckit.plan
D. /speckit.constitution -> /speckit.specify -> /speckit.plan -> /speckit.tasks -> /speckit.taskstoissues (optional) -> /speckit.implement
E. /speckit.implement -> /speckit.plan -> /speckit.tasks -> /speckit.taskstoissues

**Correct answer:** D

**Explanation:** The workshop shows a full chain from guardrails to spec, plan, tasks, optional issue conversion, and implementation.
