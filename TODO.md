# TODO

---

## *Part 2*

April 2025

### Anteraja 2 days training module
1. DONE ~~Add in the beginning something about LLM and contexts (brief intro on AI. Relationship between AI-ML-Deep Learnin-transformer-LLM. Definition of context and system/human message when working with AI model)~~
2. DONE ~~Slide about GitHub spaces for new team member onboarding or product brainstorming~~
3. DONE ~~Join slides 13 (Add Unit Tests) & 17 (Jest tests with Copilot). Sum slide time.~~
4. DONE ~~Move Slide 24. Code Quality, Code Scanning, CodeQL before 18. Copilot PR summary & review~~
  - Pastikan `.github/workflows/codeql.yml` tidak ada di branch `main`
5. DONE ~~add Slide to explain Code quality (check the BCA guide material: `refs/bca_guide_material.md`)~~
6. DONE ~~add a slide specific about "agent skills" (eg. create skills for creating readme, Vue frontend skill, backend skill, Figma skill)~~
  - adding skills
  - where to find available skills
  - add Figma skill https://github.com/openai/skills/blob/main/skills/.curated/figma-implement-design/SKILL.md
7. DONE ~~more discussion on SDD~~
  - a new slide specific discussing the importance of SDD
  - what differentiate a vibe-coded project with actual product is often SDD
  - my pattern
  - choose your own pattern, just make sure spec docs are created before adding new features, especially large fetaures
  - guardrail documents
  - tech stack and pattern documents
  - make sure copilot instructions know where to find these docs (put them in a specific folder inside the repo)
8. DONE ~~add knowledge as new slide or to existing slides from the BCA demo material (`refs/bca_guide_material.md`):~~
  - Demo Item 1: Copilot Instructions Checklist
    - Copilot instructions checklist — Show how project instructions shape Copilot responses.
  - Code QL: check Action results
  - Demo Item 4: VSCode Commit Message Generation
  - Demo Item 5: Git Hooks and GitHub Actions
    - GitHub Actions: server-side, auditable, enforced on push/PR
  - Demo Item 6: CodeQL (JavaScript Quality)
  - PR Description and Copilot Reviewer
  - Demo Item 9: GitHub Issues (Security Hardening)
  - Demo Item 10: Copilot Space (Optional)
    - Show how Copilot Space captures project context and helps generate aligned implementation guidance.
9. DONE ~~Add "break & discussion" slides for after every one-hour mark~~
  - use it for discussion with participants
  - share stories from these sources:
    - => https://www.dbs.com/artificial-intelligence-machine-learning/index.html
    - => https://www.forrester.com/blogs/dbs-banks-billion-dollar-ai-dream-realized/
    - => https://www.grab.com/sg/inside-grab/stories/how-ai-accelerated-product-innovation-at-grab-in-2024/
10. DONE ~~Add small example of git hook before talking about Github Actions~~
  - https://chatgpt.com/c/69aa94da-b47c-8324-b446-202295a1e8e7
  - Combining hooks and Actions is powerful.
11. DONE ~~very important demo: CodeQL~~
  - -> Show a developer attempting to commit a hardcoded API key and having the commit immediately blocked by Push Protection
  - -> Run a CodeQL scan on a repository with intentional vulnerabilities and show how the results are integrated directly into the pull request conversation for remediation

**Done items:**
- DONE ~~Figma to code example. use agent skill and MCP also.~~
- DONE ~~unit test and Playwright~~

---

### Sample app repository related
- PO modules/pages: Backend sepertinya sudah ada, remove dari branch `main`

---

### Demo flow related
- do this during break & discussion slides:
  - kuis berhadiah goodie bag
  - gain insights from the audience
- add a demo guide document:
  - do a pre-demo checklist (Do This First)
    - repo branch
    - database connection
    - Figma file is available and public
- try to make the workshop flow better, no back and forth between IDE and github HQ
- make git hook already a part of the repo
  - automatically running unit tests
  - Show that local pre-push checks automatically block bad pushes.
  - but user can still bypass it
- `plan.md` should be very clear about the data for PR, PO, and GR so that when participant asks for migration SQL, they all will have the same result

---

## Tips for Smooth Delivery
- Keep a backup branch with known good state.
- Prepare one failing-test scenario in advance for Item 2.
- Expect CI delay; narrate what is happening while waiting.
- Keep vulnerable snippet only on demo branch.
- End with cleanup and credential-rotation reminder.
- Post-Demo Cleanup
- Revert demo-only insecure code.
- Confirm CodeQL findings are resolved in remediation branch.
- Close loop: issue, PR, and final status update.
