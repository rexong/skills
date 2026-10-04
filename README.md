# Skills

A portable collection of agent skills. Each subdirectory contains a `SKILL.md` and any files the skill needs.

- `find-skills/` — sourced from [vercel-labs/skills](https://github.com/vercel-labs/skills) (the locally installed copy).
- `skill-creator/` — sourced from [anthropics/skills](https://github.com/anthropics/skills), including its supporting scripts and resources.

## Set up on a new environment

1. Clone this repository (after you've published it to a Git host):

   ```bash
   git clone <your-skills-repo-url> ~/projects/skills
   cd ~/projects/skills
   ```

2. Link all skills into your user-level Agent Skills directory:

   ```bash
   bash install.sh
   ```

   This creates links in `~/.agents/skills/`, which Pi discovers globally. It does not replace existing skills; if one already exists there, move it aside and rerun the script if you want this repo's version. Keep the cloned repository in place while using the links.

3. Start a new Pi session, or run `/reload` in an existing one. You can invoke a skill explicitly with `/skill:find-skills` or `/skill:skill-creator`.

To add another skill later, put its complete directory (including `SKILL.md` and any bundled files) in this repo, commit and push it, then `git pull` and rerun `bash install.sh` on other environments. Existing links will pick up edits automatically.

## Publish this repo

This is a local Git repository until you create a remote (for example, a GitHub repository named `skills`) and push it:

```bash
git remote add origin <your-skills-repo-url>
git push -u origin main
```

Review third-party skill code before running it: skill scripts execute with your user permissions.
