# Testing Patterns

**Analysis Date:** 2026-03-24

> This is an Obsidian personal knowledge management vault, not a software project. There is no automated test framework, test runner, or test files. This document describes the **human verification and review patterns** that serve as the quality-assurance layer for vault content correctness.

---

## Test Framework

**Runner:** None — no automated test suite detected.

**Assertion Library:** None.

**Run Commands:** Not applicable.

The vault uses **manual review rituals** as its quality loop, defined in `02-GSD/Weekly-Review.md` and executed weekly on Sundays.

---

## Verification Rituals (Functional Equivalent of Tests)

### Daily Check (via `.claude/skills/daily-brief.md`)
Runs every morning. Verifies:
- Yesterday's open loops are surfaced (read `Daily/[yesterday].md`)
- Active tasks are current (read `02-GSD/Tasks/Active.md`)
- Training plan is reflected (read `03-Projects/Triathlon/LOG.md`)

### Weekly Review (via `02-GSD/Weekly-Review.md` and `.claude/skills/weekly-review.md`)
Runs every Sunday. Verifies:
1. `01-Inbox/Inbox.md` — all captures processed (no orphaned items)
2. `02-GSD/Tasks/Active.md` — stale or completed items identified and removed
3. `02-GSD/Tasks/Waiting.md` — overdue follow-ups flagged
4. Every `03-Projects/[Name]/LOG.md` — no project has gone silent (stale = no recent entry)
5. `02-GSD/Tasks/Someday.md` — items ready to promote to Active reviewed

**Output:** New weekly review note at `02-GSD/Weekly-Reviews/YYYY-MM-DD.md`

---

## Content Integrity Checks

**Agent file validation** — before using an agent, the template in `00-System/Agents/agent-template.md` defines the required schema:
- Frontmatter present: `name`, `purpose`, `status`, `created`
- Sections present: `## System Prompt`, `## Tools / Access`, `## When to use`, `## Example invocations`

**Project file validation** — a project folder in `03-Projects/` is considered complete when it contains:
- `README.md` — with Goal, Context, Tasks pointer, Links
- `LOG.md` — with at least one dated entry in `## YYYY-MM-DD — [title]` format

**Daily note validation** — a daily note is considered complete when:
- Frontmatter has `date`, `mood`, `energy`, `focus` keys
- `## Top 3 priorities` section has at least one `#p1` item
- `## Open loops from yesterday` section is populated (or explicitly marked "fresh start")

---

## Structural Conventions That Prevent Errors

**Checklist-driven workflows** — critical multi-step processes use `- [ ]` checkboxes to prevent missed steps:
- Weekly review steps in `02-GSD/Weekly-Review.md`
- Agent tool access in `00-System/Agents/agent-template.md`
- Project scaffolding steps in `.claude/skills/new-project.md`

**Waiting table** (`02-GSD/Tasks/Waiting.md`) — tracks externally-blocked items with `Since` and `Follow up by` columns, preventing silent drops.

**Priority triage** — the three-tier `#p1`/`#p2`/`#p3` system in `02-GSD/Tasks/Active.md` ensures weekly scope is bounded. `Active.md` is intentionally ruthless: "if it's not here, it doesn't exist."

---

## Agent Code Review Pattern

For actual software code review, the `00-System/Agents/agent-code-reviewer.md` agent defines the review checklist:

1. Check for bugs and logic errors
2. Flag security vulnerabilities (OWASP top 10, injection, auth issues)
3. Assess code quality (readability, SOLID principles, unnecessary complexity)
4. Suggest concrete improvements with code examples
5. Rate severity: `CRITICAL` / `HIGH` / `MEDIUM` / `LOW` / `INFO`

**Invocation pattern:**
```bash
claude "Act as my code-reviewer agent (see 00-System/Agents/agent-code-reviewer.md) and review this diff: ..."
```

Stack scope for code review: React, Node.js, Spring Boot, Godot (GDScript).

---

## Coverage Assessment

**What is "covered":**
- Daily note creation: automated via `.claude/skills/daily-brief.md`
- Task capture: automated via `.claude/skills/capture.md`
- Project scaffolding: automated via `.claude/skills/new-project.md`
- Weekly review: automated via `.claude/skills/weekly-review.md`

**What is NOT covered (gaps):**
- No validation that wikilinks point to existing files
- No check that `02-GSD/Dashboard.md` project table stays in sync when projects are added
- No automated test that LOG.md entries follow `## YYYY-MM-DD — [title]` format
- No check that archived items in `06-Archive/` are properly removed from Active.md
- `04-Goals/` and `05-Areas/` directories exist but contain no files — no coverage

---

## GSD Template Planning System

The `00-System/GSD-Template/.planning/` directory provides templates for software project planning. These are not tests but define requirements traceability:

**`REQUIREMENTS.md`** — Requirements follow `[CATEGORY-NUMBER]` IDs. Traceability table maps each requirement to a phase and status.

**`ROADMAP.md`** — Success criteria phrased as observable user behaviors ("User can [action]"), not task completions. This is the closest analogue to acceptance testing.

**`STATE.md`** — Session continuity file. Acts as a living status check — progress percentage, active blockers, pending todos.

---

*Testing analysis: 2026-03-24*
