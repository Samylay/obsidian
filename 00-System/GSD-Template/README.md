# GSD Template

Source: https://github.com/gsd-build/get-shit-done

Context engineering framework for Claude Code. Prevents "context rot" in long dev sessions by giving each task a fresh 200k-token window with only what it needs.

## How to initialize a new project

From Claude Code inside your project directory:
```
/init-gsd
```
This copies the `.planning/` template into your project and kicks off the initialization flow.

Or manually:
```bash
cp -r "path/to/vault/00-System/GSD-Template/.planning" ./
```
Then run `/gsd:new-project` if you have GSD installed globally.

## The 5-step cycle per phase

1. `/gsd:new-project` — questions → research agents → requirements → roadmap
2. `/gsd:discuss-phase` — capture preferences before planning
3. `/gsd:plan-phase` — atomic task plans with verification
4. `/gsd:execute-phase` — parallel wave execution, fresh context per task
5. `/gsd:verify-work` — UAT + automated diagnosis

## Install GSD globally (recommended)
```bash
npx get-shit-done-cc@latest
```
Select **Claude Code** as runtime, **global** as scope. Then all `/gsd:*` commands are available in any project.

## Files in `.planning/`

| File | Purpose |
|------|---------|
| `PROJECT.md` | Vision, decisions, constraints — always loaded |
| `STATE.md` | Current position, blockers, session continuity — under 100 lines |
| `REQUIREMENTS.md` | v1/v2 features with phase traceability |
| `ROADMAP.md` | Phases, success criteria, dependencies |
| `config.json` | Workflow preferences |
| `research/` | Domain knowledge from parallel investigators |
| `threads/` | Persistent context across sessions |
| `seeds/` | Forward-looking ideas |
| `todos/` | Captured ideas mid-session |
