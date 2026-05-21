# Pre-Workshop Test - BTPNS

This pre-workshop test contains 10 MCQs:
- 5 questions on AI in SDLC (50%)
- 5 questions on GitHub Copilot fundamentals (50%)

Each question has 5 options (A-E), with 1 correct answer and 4 distractors.

---

## Question 1 (AI in SDLC)
In many software teams, AI-generated output is fast but can be inconsistent for production systems. Based on this workshop, which practice best reduces ambiguity before implementation starts?

A. Ask different models for the same feature and merge the outputs manually.
B. Delay all documentation until after coding is complete and tested.
C. Use structured specs with intent, behavior, constraints, edge cases, and acceptance criteria.
D. Keep prompts very short so the model has room to be creative.
E. Focus only on UI speed and postpone business rule validation.

**Correct answer:** C

**Explanation:** The workshop positions a specification as a contract between intent and implementation, helping teams reduce rework and misunderstandings.

---

## Question 2 (AI in SDLC)
When a team adopts AI tools in development, who remains accountable if generated output misses business logic in production workflows?

A. Only the AI model vendor, because the model produced the code.
B. Only QA engineers, because they run tests before release.
C. The product owner alone, because requirements came from product.
D. The human team using AI, because validation and understanding cannot be outsourced.
E. Nobody, because AI output is probabilistic by nature.

**Correct answer:** D

**Explanation:** The workshop explicitly says teams can outsource code generation, but not understanding and validation.

---

## Question 3 (AI in SDLC)
A developer asks an LLM to generate a procurement module with minimal context and gets a plausible but incorrect result. According to the workshop, what is the most likely root cause?

A. The model was unable to process domain terms like PR and PO.
B. The request lacked sufficient context and specific constraints.
C. The chosen framework automatically blocks AI-assisted generation.
D. The repository size was too small for useful completions.
E. The user should have used dark mode in the editor.

**Correct answer:** B

**Explanation:** The workshop emphasizes that the main failure is usually the brief, not the model.

---

## Question 4 (AI in SDLC)
In a regulated procurement environment, why is vibe-driven development risky even when generated output looks correct in demos?

A. It usually creates code that cannot be executed locally.
B. It always fails UI rendering on mobile devices.
C. It can hide ambiguity, weaken auditability, and miss non-obvious edge cases.
D. It prevents integration with version control systems.
E. It requires a premium model for every commit.

**Correct answer:** C

**Explanation:** The workshop explains that plausible output is not enough for production-grade systems that require traceability and clear rules.

---

## Question 5 (AI in SDLC)
A team wants AI support while maintaining engineering discipline. Which workflow matches the workshop pattern for new features?

A. Generate full implementation first, then write requirements if needed.
B. Ask for a plan from available docs, implement in checkpoints, validate continuously.
C. Disable testing until all modules are generated for consistency.
D. Let AI decide architecture and skip team review to move faster.
E. Limit context inputs to reduce token usage and speed up replies.

**Correct answer:** B

**Explanation:** The workshop guidance is: attach context, ask for plan first, implement in checkpoints, and validate continuously.

---

## Question 6 (Copilot Fundamentals)
Before making larger repository changes, the workshop recommends improving a repository instruction file. What is the main objective of this file?

A. To replace README files and become the only project documentation.
B. To enforce operating system settings across all participant laptops.
C. To shape Copilot behavior with project context, conventions, and quality rules.
D. To automatically deploy every generated branch to production.
E. To store private credentials for backend and frontend environments.

**Correct answer:** C

**Explanation:** This file aligns generated output with project standards such as naming, testing, and documentation practices.

---

## Question 7 (Copilot Fundamentals)
In the workshop flow, participants use different Copilot modes for different activities. Which pairing is correct?

A. Plan mode for refining task sequence, then Agent mode for executing and saving runbooks.
B. Agent mode only for searching images, Plan mode only for terminal commands.
C. Plan mode for Git commits, Agent mode for syntax highlighting.
D. Agent mode for disabling tests, Plan mode for bypassing docs.
E. Plan mode and Agent mode are interchangeable with no practical difference.

**Correct answer:** A

**Explanation:** The deck shows Plan mode for sequencing and Agent mode for execution tasks such as saving runbook outputs.

---

## Question 8 (Copilot Fundamentals)
A participant wants better Copilot output quality but keeps sending short prompts. Which change is most likely to improve results quickly?

A. Add richer context: relevant files, docs, screenshots, and explicit constraints.
B. Use fewer words and rely on Copilot to infer architecture from memory.
C. Ask Copilot to skip explanations and generate only final code.
D. Avoid mentioning existing modules to prevent model bias.
E. Turn off linting and tests to reduce noise in responses.

**Correct answer:** A

**Explanation:** Rich context and clear constraints improve relevance and reduce incorrect assumptions.

---

## Question 9 (Copilot Fundamentals)
Before implementing PO, the workshop asks participants to add Swagger/OpenAPI support. What is the practical benefit?

A. It guarantees all future frontend code will be bug-free.
B. It exposes discoverable, testable API contracts before deeper integration.
C. It removes the need for backend unit testing.
D. It forces database migrations to run on every request.
E. It automatically creates production monitoring dashboards.

**Correct answer:** B

**Explanation:** Swagger/OpenAPI makes endpoints visible and testable, reducing integration guesswork.

---

## Question 10 (Copilot Fundamentals)
The workshop suggests maintaining a project progress file (for example, docs/progress.md). Why is this useful with Copilot across sessions?

A. It reduces token cost by deleting implementation details from history.
B. It ensures Copilot ignores older architecture decisions.
C. It helps avoid duplicated work and keeps implementation context consistent.
D. It removes the need for code reviews and pull requests.
E. It allows skipping tests if progress notes look complete.

**Correct answer:** C

**Explanation:** A current-state document helps both humans and Copilot keep continuity and avoid duplicate work.
