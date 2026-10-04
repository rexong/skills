---
name: constitution
description: Establish or revise a project's spec-driven development constitution in specs/mission.md, specs/tech-stack.md, and specs/roadmap.md. Use when a user asks to define project purpose, technical choices, or a small-phased roadmap before feature work.
---

# Project constitution

Create or update three documents in the current project's `specs/` directory: `mission.md`, `tech-stack.md`, and `roadmap.md`. These guide later feature specs and implementation.

1. Inspect the project and existing `specs/` documents first. Use existing information as context, not as permission to invent decisions. If there are existing documents, propose changes rather than silently replacing them.
2. **Before writing to disk**, ask the user questions covering all three documents, grouped clearly under **Mission**, **Tech stack**, and **Roadmap**. Use the host's structured question tool if available; otherwise ask in one conversational message and wait for answers. Do not depend on any tool named `AskUserQuestion`. Even if the initial request includes some answers, summarize what is known and ask for confirmation of material gaps or assumptions. Do not create files or directories until the user has had the chance to answer.
   - Mission: problem, audience, success criteria, boundaries/non-goals.
   - Tech stack: language, framework, storage, hosting, constraints, and choices still undecided.
   - Roadmap: key outcomes, dependencies, priorities, and what constitutes a *small* phase for this project.
3. Resolve conflicting or consequential unknowns with follow-up questions rather than guessing. Mark genuinely undecided items explicitly as TBD when the user agrees.
4. Create or edit `specs/mission.md` (purpose, users, success, scope), `specs/tech-stack.md` (chosen technologies and rationale, constraints, undecided choices), and `specs/roadmap.md` (ordered, numbered phases). Keep each roadmap phase small enough to implement and validate independently; include an outcome and an observable completion criterion. Use stable phase numbers (e.g. `1`, `2`, `3`) because the feature-spec skill uses the number in its directory and branch name. Do not silently renumber existing phases.
5. Summarize what changed and list any open decisions. Do not implement roadmap phases as part of this skill.
