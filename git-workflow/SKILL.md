---
name: git-workflow
description: Follow the user's Git workflow when starting work, committing changes, or opening a pull request. Create numbered feat/fix/test/chore branches from dev, commit there, and open PRs targeting dev; never merge or push to dev, staging, or main.
---

# Git workflow

The repository has three long-lived branches: `dev`, `staging`, and `main`. The user alone performs all merges, including merges into `dev`. Agents create work branches, commit their changes, and open pull requests for the user to review. Never merge a PR or merge into any branch, even if asked; explain that the merge is reserved for the user. Never commit or push directly to `dev`, `staging`, or `main`. In particular, only the user may merge into `staging` and `main`.

## Start work

1. Inspect repository status, current branch, and remotes. Do not discard, stash, or move unrelated uncommitted changes without asking. If the worktree is dirty, coordinate with the user before branching or committing.
2. Determine the work type: `feat`, `fix`, `test`, or `chore`. Get the feature number from the relevant roadmap/issue or ask the user if it is missing or ambiguous. **Every type requires a feature number.** Choose a concise lowercase kebab-case name.
3. Name the branch `<type>/<feature-number>-<name>` (for example, `feat/3-user-login`, `fix/3-login-redirect`, `test/3-login-errors`, or `chore/3-update-deps`). If a project has a fractional number, normalize its separator to `-` for the branch (e.g. `3.1` → `3-1`). Confirm if that creates ambiguity. Do not reuse an existing branch for unrelated work.
4. Fetch the remote `dev` branch and branch from its latest commit (normally `origin/dev`). If `dev` is missing or the remote cannot be fetched, ask how to proceed; do not silently branch from `main`, `staging`, or an outdated local `dev`. If currently on another branch with uncommitted work, resolve that with the user first.

## Finish work

1. Review the diff, run relevant checks, and stage only files belonging to this task. Never commit secrets or unrelated changes. Commit on the numbered work branch with a concise descriptive message.
2. Push only the work branch. Open a pull request with **base `dev`** and the work branch as its head. Include a summary, validation performed (and any checks not run), and the associated feature number. If a PR for this branch already exists, report or update it rather than opening a duplicate.
3. If GitHub CLI or authentication is unavailable, provide the exact PR URL or commands the user can use; do not claim the PR was opened. Never auto-merge or set up auto-merge. Leave merges and promotions from `dev` to `staging` and from `staging` to `main` to the user.

If another skill requests a branch as part of planning, apply this naming and `dev` base rule there too. Do not make a branch for a planning-only task unless requested by that task or the user.
