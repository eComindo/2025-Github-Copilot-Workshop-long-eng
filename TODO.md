# TODO

---
## *Part 1*

December 2025

### Slides

#### 1. Preparation  (= = = = = DONE = = = = =)
- Remove custom github mcp server slide
- Add to pre-requisite instead: install [Github MCP Server](https://github.com/mcp/github/github-mcp-server) in VSCode

#### 2. Copilot Space (= = = = = DONE = = = = =)

- start from the Copilot Space?
- add image and document about Pomodoro to Copilot Space
- use Copilot Space to ask questions about the project
- use Copilot Space to generate the plan.md file

#### 3. Prompt File and Custom Agents (= = = = = DONE = = = = =)
- create prompt file: eg. unit test, code explainer
- create pre-built agents (already in the repo's `.github/`): eg. API agent, documentation maker
- create a custom agent: eg. Readme specialist

#### 4. Custom Instruction (= = = = = DONE = = = = =)
- prebuilt custom instruction
- modify custom instruction, eg. to always add documentation to all new function (this should be just before the "Create Issue" slide)

#### 5. Advanced Agent Interaction (Agent HQ)
- basically show the Copilot online's Agent tab to show the agent's activities
- add a new task (eg. add logging feature) from the Agents' tab while another agent is working on the previous issue

#### 6. Code Review Agent
- Ask an agent to do a review
- Ask agent to generate unit tests to improve overall Code Quality. So we need to check code quality BEFORE and AFTER the prompt
- Just provide screenshots, to make sure non-enterprise account users can see the feature in action

#### 7. Azure integration ???
- publish to Azure using Copilot Chat

---

### Preparation

1. Retest on [eComindo repo](https://github.com/eComindo/2025-github-ur-copilot-workshop)
2. Check time to complete the workshop with eComindo team (gladi kotor, with ~2-3 team members)
3. Review and rework the slides or example
4. Final test (gladi bersih, with all team members joining the workshop)

---
---

## *Part 2*

April 2025

### Anteraja 2 days training module
Add to slides:
- Add in the beginning something about LLM and contexts (brief intro on AI, ML, transformer, LLM, context, system and human message)
- GitHub spaces for new team member onboarding or product brainstorming
- PO modules/pages: Backend sepertinya sudah ada, remove dari branch `main`
- Join slides 13 (Add Unit Tests) & 17 (Jest tests with Copilot). Sum slide time.
- Move Slide 24. Code Quality, Code Scanning, CodeQL before 18. Copilot PR summary & review
  - Pastikan `.github/workflows/codeql.yml` tidak ada di branch `main`
- explanation on Code quality (check the BCA guide material)
- agent skills (readme, Vue frontend, backend)
  - adding skills
  - where to find available skills
- ~~Figma to code example. use agent skill and MCP also.~~
- add Figma skill https://github.com/openai/skills/blob/main/skills/.curated/figma-implement-design/SKILL.md
- ~~unit test and Playwright~~
- more discussion on SDD
  - my pattern
  - choose your own pattern, just make sure spec docs are created before adding new features, especially large fetaures
  - guardrail documents
  - tech stack and pattern documents
  - make sure copilot instructions know where to find these docs (put them in a specific folder inside the repo)
- add knowledge from BCA demo:
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
- implementation: use real cases, eg. DBS, Grab, Snoop Dogg
  - => https://www.dbs.com/artificial-intelligence-machine-learning/index.html
  - => https://www.forrester.com/blogs/dbs-banks-billion-dollar-ai-dream-realized/
  - => https://www.grab.com/sg/inside-grab/stories/how-ai-accelerated-product-innovation-at-grab-in-2024/
- Add small example of git hook before talking about Github Actions
  - https://chatgpt.com/c/69aa94da-b47c-8324-b446-202295a1e8e7
  - Combining hooks and Actions is powerful.
- very important demo: CodeQL
  - -> Show a developer attempting to commit a hardcoded API key and having the commit immediately blocked by Push Protection
  - -> Run a CodeQL scan on a repository with intentional vulnerabilities and show how the results are integrated directly into the pull request conversation for remediation



### Flow related
- add break & discussion slides for after every one-hour mark
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
