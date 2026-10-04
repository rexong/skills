---
name: feature-spec
description: Plan the next spec-driven development roadmap phase as a dated, numbered feature spec with requirements, implementation plan, and merge validation. Use when the user asks to spec, plan, or start the next phase in specs/roadmap.md.
---

# Next feature spec

Work in the current project's repository. This skill prepares a feature for implementation; it does not implement the feature.

1. Read `specs/mission.md`, `specs/tech-stack.md`, and `specs/roadmap.md` and inspect relevant existing code and specs. If the constitution is missing, ask the user to establish it first. Identify the first phase not yet completed using explicit status or completion evidence; if status is ambiguous, confirm with the user. Do not invent a new phase number.
2. **Before creating a branch, directory, or file**, ask the user about the feature spec in one grouped set of questions under **Requirements**, **Plan**, and **Validation**. Use the host's structured question tool if available; otherwise ask in a conversational message and wait for answers. Do not depend on any tool named `AskUserQuestion`. Summarize known details and ask for confirmation of material gaps or assumptions even if the initial request is detailed.
   - Requirements: scope, user-facing behavior, constraints, decisions, exclusions, and unresolved questions.
   - Plan: implementation approach, dependencies, boundaries between small task groups, and whether any sequencing is mandatory.
   - Validation: tests/checks, manual acceptance criteria, and what must be true before merging.
3. Once answers are clear, check repository status and branch name collisions. Do not discard uncommitted work or overwrite an existing branch/spec directory. If the tree is dirty or the target exists, ask how to proceed. Follow the `git-workflow` skill: fetch `dev`, create a branch from the latest `origin/dev` named `feat/<phase-number>-<feature-slug>`, and leave all merges to the user. If `dev` is unavailable or the repository isn't under Git, stop and ask how the user wants to proceed.
4. Create `specs/YYYY-MM-DD-<phase-number>-<feature-slug>/` using the current local date, the stable phase number from the roadmap, and a short lowercase kebab-case slug. Example: `specs/2026-10-04-3-user-login/`. If a phase has a label such as `3.1`, preserve it in a filesystem-safe slug (e.g. `3-1`) and explain the mapping. Do not overwrite existing specs.
5. Write these three documents, aligned with `specs/mission.md` and `specs/tech-stack.md`:
   - `requirements.md`: roadmap phase reference, context, in-scope behavior, explicit out-of-scope work, decisions and open questions. Distinguish confirmed requirements from assumptions.
   - `plan.md`: a sequence of **numbered task groups** with small, concrete steps, dependencies, and a result/check for each group. Keep implementation out of this step.
   - `validation.md`: objective checks mapped to requirements, test commands where known, manual acceptance checks, and merge readiness criteria. Do not claim unrun checks passed.
6. Report the branch, paths created, and unresolved questions. Leave implementation and merge to a later request.
