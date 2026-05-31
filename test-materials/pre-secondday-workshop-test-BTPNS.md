# Pre-SecondDay Workshop Test - BTPNS

This pre-second-day test contains 10 MCQs focused on participant familiarity with:
- End-to-end testing and Playwright as an E2E framework
- SDD concepts and SDD frameworks

Distribution:
- 5 questions on E2E testing and Playwright (50%)
- 5 questions on SDD concepts and SDD frameworks (50%)

Each question has 5 options (A-E), with 1 correct answer and 4 distractors.

---

## Question 1 (E2E and Playwright)
What is the best description of an end-to-end (E2E) test in a web application context?

A. A test that checks one utility function in isolation.
B. A test that verifies only database schema migration scripts.
C. A test that validates complete user flows across UI, API, and data interactions.
D. A test that only checks whether the frontend compiles.
E. A test that focuses exclusively on CSS rendering.

**Correct answer:** C

**Explanation:** E2E tests validate realistic user journeys across integrated layers, not isolated units.

---

## Question 2 (E2E and Playwright)
Why is Playwright commonly used as an E2E framework for modern web apps?

A. It only works with static HTML files and no JavaScript apps.
B. It supports browser automation with reliable assertions and test tooling for full user flows.
C. It replaces backend APIs by mocking all network requests automatically.
D. It is intended only for performance benchmarking, not functional testing.
E. It cannot generate test artifacts such as reports or traces.

**Correct answer:** B

**Explanation:** Playwright is designed for robust browser automation and end-to-end validation with strong tooling support.

---

## Question 3 (E2E and Playwright)
In procurement workflow testing, why is it important to include both happy-path and negative-path E2E scenarios?

A. To avoid writing backend validation rules.
B. To prove that only successful flows exist in production.
C. To confirm valid behavior succeeds and invalid behavior is correctly rejected.
D. To reduce test maintenance by removing assertions.
E. To eliminate the need for any unit testing.

**Correct answer:** C

**Explanation:** Balanced E2E coverage should prove both successful flows and proper rejection of invalid operations.

---

## Question 4 (E2E and Playwright)
Which selector strategy generally improves long-term E2E test stability?

A. Use deep CSS chains tied to visual layout.
B. Use randomly generated class names from build output.
C. Use stable, intentional selectors and clear assertions.
D. Click elements by screen coordinates.
E. Depend only on text snippets that frequently change.

**Correct answer:** C

**Explanation:** Stable selectors reduce flakiness and make tests resilient to non-functional UI changes.

---

## Question 5 (E2E and Playwright)
What is the most appropriate interpretation of Playwright artifacts such as reports, traces, screenshots, and videos?

A. They are optional decorations with no debugging value.
B. They are replacements for assertions in test code.
C. They help diagnose failures, improve reproducibility, and support quality review.
D. They should be disabled to ensure deterministic test logic.
E. They are only useful for manual exploratory testing.

**Correct answer:** C

**Explanation:** Artifacts provide evidence and context that make failures easier to investigate and communicate.

---

## Question 6 (SDD Concept)
What is the core idea of Spec-Driven Development (SDD)?

A. Code is always written first, and specs are filled in after release.
B. Structured specs become the primary reference guiding implementation and validation.
C. Testing is postponed until all features are completed.
D. Documentation is optional if prompts are detailed enough.
E. Architecture decisions should be hidden to maximize model creativity.

**Correct answer:** B

**Explanation:** SDD treats structured specifications as a source of truth that drives design, implementation, and review.

---

## Question 7 (SDD Concept)
Which set best represents key sections of a practical software specification in SDD?

A. Theme colors, typography scale, and icon variants.
B. Intent, behavior, constraints, edge cases, and acceptance criteria.
C. Commit hash, branch name, and merge timestamp.
D. CPU usage, RAM usage, and disk quota only.
E. Team attendance, sprint velocity, and office seating map.

**Correct answer:** B

**Explanation:** These sections define what to build, boundaries to respect, and how success is objectively validated.

---

## Question 8 (SDD Frameworks)
Why might a team adopt an SDD framework instead of inventing everything from scratch?

A. Frameworks remove the need for project-specific requirements.
B. Frameworks provide reusable workflows, templates, and conventions that reduce setup overhead.
C. Frameworks guarantee perfect code without reviews.
D. Frameworks are only for design teams and not engineers.
E. Frameworks replace source control and issue tracking tools.

**Correct answer:** B

**Explanation:** SDD frameworks accelerate adoption by providing repeatable patterns and shared standards.

---

## Question 9 (SDD Concept)
In SDD, why is it useful to define project guardrails before implementation begins?

A. It removes the need for code reviews entirely.
B. It helps keep architecture, quality, and implementation decisions consistent.
C. It guarantees zero production defects.
D. It replaces acceptance criteria and edge-case analysis.
E. It is only needed after the feature is deployed.

**Correct answer:** B

**Explanation:** Guardrails reduce ambiguity and keep implementation choices aligned with team standards.

---

## Question 10 (SDD Workflow)
Which workflow best reflects SDD for a substantial new module?

A. Implement everything first, then backfill the spec if time remains.
B. Write tests only, then infer requirements from failing cases.
C. Define/refine specification, create a technical plan, execute in tasks, and validate against acceptance criteria.
D. Skip planning and rely on model iteration until output looks correct.
E. Freeze documentation and avoid updates during implementation.

**Correct answer:** C

**Explanation:** SDD is spec-first: requirements and constraints are defined upfront, then implemented and validated iteratively.
