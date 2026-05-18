# Pre-Workshop Test - BTPNS

This pre-workshop test contains 10 MCQs:
- 5 questions on AI in SDLC (50%)
- 5 questions on GitHub Copilot fundamentals (50%)

Each question has 5 options (A-E), with 1 correct answer and 4 distractors.

---

## Question 1 (AI in SDLC)
In many software teams, people say AI-generated code is fast but inconsistent for production systems. Based on the workshop framing, which practice best reduces rework, ambiguity, and hidden assumptions before implementation starts?

A. Ask different models for the same feature and merge the outputs manually.
B. Delay all documentation until after coding is complete and tested.
C. Use structured specs with intent, behavior, constraints, edge cases, and acceptance criteria.
D. Keep prompts very short so the model has room to be creative.
E. Focus only on UI speed and postpone business rule validation.

**Correct answer:** C

**Explanation:** The workshop emphasizes that structured specifications reduce ambiguity and create a clear contract between intent and implementation, which improves maintainability and review quality.

---

## Question 2 (AI in SDLC)
When a team adopts AI tools in development, who should be accountable if generated output misses important business logic or fails to match expected behavior in production workflows?

A. Only the AI model vendor, because the model produced the code.
B. Only QA engineers, because they run tests before release.
C. The product owner alone, because requirements came from product.
D. The human team using AI, because validation and understanding cannot be outsourced.
E. Nobody, because AI output is probabilistic by nature.

**Correct answer:** D

**Explanation:** The workshop explicitly states that teams can outsource code generation, but not understanding and validation. Human accountability remains essential.

---

## Question 3 (AI in SDLC)
A developer asks an LLM to generate a procurement module with almost no supporting context and gets a plausible but incorrect result. What is the most likely root cause according to the workshop’s context-first principle?

A. The model was unable to process domain terms like PR and PO.
B. The request lacked sufficient context and specific constraints.
C. The chosen framework automatically blocks AI-assisted generation.
D. The repository size was too small for useful completions.
E. The user should have used dark mode in the editor.

**Correct answer:** B

**Explanation:** The workshop stresses that better context yields better outputs, and poor briefs are usually the biggest failure point, not the model itself.

---

## Question 4 (AI in SDLC)
In a regulated environment such as banking procurement, why is “vibe-driven development” considered risky even when generated output appears to work during quick demonstrations?

A. It usually creates code that cannot be executed locally.
B. It always fails UI rendering on mobile devices.
C. It can hide ambiguity, weaken auditability, and miss non-obvious edge cases.
D. It prevents integration with version control systems.
E. It requires a premium model for every commit.

**Correct answer:** C

**Explanation:** The workshop highlights that plausible output is not enough for production; regulated domains require traceability, clarity, and explicit handling of constraints and edge cases.

---

## Question 5 (AI in SDLC)
A team wants AI support while keeping strong engineering discipline. Which workflow aligns most closely with the workshop’s recommended pattern for new features?

A. Generate full implementation first, then write requirements if needed.
B. Ask for a plan from available docs, implement in checkpoints, validate continuously.
C. Disable testing until all modules are generated for consistency.
D. Let AI decide architecture and skip team review to move faster.
E. Limit context inputs to reduce token usage and speed up replies.

**Correct answer:** B

**Explanation:** The workshop advises attaching relevant docs, asking for plans first, implementing in small checkpoints, and validating each step.

---

## Question 6 (Copilot Fundamentals)
Before making larger repository changes with Copilot, the workshop recommends updating a repository-level instruction file. What is the main objective of this file in daily development?

A. To replace README files and become the only project documentation.
B. To enforce operating system settings across all participant laptops.
C. To shape Copilot behavior with project context, conventions, and quality rules.
D. To automatically deploy every generated branch to production.
E. To store private credentials for backend and frontend environments.

**Correct answer:** C

**Explanation:** The instruction file is used to guide Copilot with standards such as testing discipline, naming conventions, and required docs context.

---

## Question 7 (Copilot Fundamentals)
In the workshop flow, participants are encouraged to use different Copilot modes for different activities. Which pairing best reflects the intended use during planning and implementation steps?

A. Plan mode for refining task sequence, then Agent mode for executing and saving runbooks.
B. Agent mode only for searching images, Plan mode only for terminal commands.
C. Plan mode for Git commits, Agent mode for syntax highlighting.
D. Agent mode for disabling tests, Plan mode for bypassing docs.
E. Plan mode and Agent mode are interchangeable with no practical difference.

**Correct answer:** A

**Explanation:** The material shows Plan mode for validating and sequencing work, then Agent mode for execution-oriented tasks like creating runbook artifacts.

---

## Question 8 (Copilot Fundamentals)
A team member wants better quality from Copilot but keeps sending short prompts with minimal repository context. According to workshop guidance, which adjustment is most likely to improve output quality quickly?

A. Add richer context: relevant files, docs, screenshots, and explicit constraints.
B. Use fewer words and rely on Copilot to infer architecture from memory.
C. Ask Copilot to skip explanations and generate only final code.
D. Avoid mentioning existing modules to prevent model bias.
E. Turn off linting and tests to reduce noise in responses.

**Correct answer:** A

**Explanation:** The workshop emphasizes context-rich prompting. Including concrete artifacts and constraints improves relevance and reduces hallucinated assumptions.

---

## Question 9 (Copilot Fundamentals)
When participants are asked to verify baseline readiness before implementing PO, what practical benefit comes from adding Swagger/OpenAPI support to the backend first?

A. It guarantees all future frontend code will be bug-free.
B. It exposes discoverable, testable API contracts before deeper integration.
C. It removes the need for backend unit testing.
D. It forces database migrations to run on every request.
E. It automatically creates production monitoring dashboards.

**Correct answer:** B

**Explanation:** Swagger/OpenAPI helps teams inspect endpoints, verify expected behavior, and align frontend integration with explicit API contracts.

---

## Question 10 (Copilot Fundamentals)
The workshop suggests project progress documentation (for example, a current-state summary file) while building modules. Why is this useful when working with Copilot over multiple sessions?

A. It reduces token cost by deleting implementation details from history.
B. It ensures Copilot ignores older architecture decisions.
C. It helps avoid duplicated work and keeps implementation context consistent.
D. It removes the need for code reviews and pull requests.
E. It allows skipping tests if progress notes look complete.

**Correct answer:** C

**Explanation:** Progress documentation gives Copilot and developers a shared status snapshot, reducing redundant changes and improving continuity across iterations.
