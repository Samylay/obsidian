# Architecture

**Analysis Date:** 2026-03-24

## Pattern Overview

**Overall:** Personal Knowledge Management (PKM) vault using the PARA + GSD hybrid methodology

**Key Characteristics:**
- Content organized by actionability (Projects > Areas > Resources > Archive)
- Task management follows GTD-inspired GSD workflow (Capture → Clarify → Organize → Reflect → Engage)
- AI-augmented via Claude Code agents and skills stored inside the vault itself
- All notes are plain Markdown files; Obsidian renders and links them — no database, no server
- Cross-note navigation uses `[[wikilinks]]`; no external indexing required

## Layers

**Capture Layer:**
- Purpose: Raw input, unprocessed ideas and tasks
- Location: `01-Inbox/Inbox.md`
- Contains: Quick captures, misc notes, things to process
- Depends on: Nothing — terminal write destination
- Used by: GSD processing step (moves items out)

**Task Management Layer:**
- Purpose: Organized, prioritized, actionable items
- Location: `02-GSD/`
- Contains: `Dashboard.md`, `Tasks/Active.md`, `Tasks/Waiting.md`, `Tasks/Someday.md`, `Weekly-Review.md`
- Depends on: Inbox (upstream), Projects (linked context)
- Used by: Daily brief generation, weekly review process

**Project Layer:**
- Purpose: Active projects with defined outcomes and progress logs
- Location: `03-Projects/`
- Contains: One folder per project, each with `README.md` + `LOG.md` (some have `Tasks.md`)
- Depends on: GSD tasks link back here; agents reference project READMEs
- Used by: Dashboard project table, weekly review, agent context

**Areas Layer:**
- Purpose: Ongoing responsibilities without a finish date
- Location: `04-Areas/`
- Contains: `Dev/README.md`, `Health/README.md`, `School/` (with course notes)
- Depends on: Knowledge base for reference material
- Used by: Dashboard areas table

**Knowledge Layer:**
- Purpose: Reference material — not actionable, for future lookup
- Location: `05-Knowledge/`
- Contains: `Books/`, `Clippings/` (saved web articles)
- Depends on: Nothing — terminal archive for reference
- Used by: Areas and projects link here for context

**Archive Layer:**
- Purpose: Done or dormant notes — nothing is deleted, only moved
- Location: `06-Archive/`
- Contains: Raw historical notes (`GameDev-raw-notes.md`, `Ject-raw-notes.md`)
- Depends on: Nothing
- Used by: Nothing active — historical reference only

**Daily Notes Layer:**
- Purpose: Daily check-ins, priorities, schedule, open loops
- Location: `Daily/` (format: `YYYY-MM-DD.md`)
- Contains: Frontmatter (date, mood, energy, focus), top 3 priorities, training, schedule, open loops
- Depends on: `02-GSD/Tasks/Active.md`, previous day's note, `03-Projects/Triathlon/LOG.md`
- Used by: Daily brief agent, open loop tracking

**AI System Layer:**
- Purpose: Configuration for AI-assisted vault operations
- Location: `00-System/`
- Contains: `CLAUDE.md` (Jarvis identity/instructions), `Agents/` (agent definitions), `Skills/` (slash commands), `GSD-Template/` (project scaffolding template)
- Depends on: All other layers (reads vault-wide context)
- Used by: Claude Code sessions via `.claude/skills/` and `CLAUDE.md`

## Data Flow

**Daily Brief Generation:**

1. Skill `.claude/skills/daily-brief.md` or agent `00-System/Agents/agent-daily-brief.md` is invoked
2. Agent reads yesterday's `Daily/YYYY-MM-DD.md` for open loops
3. Agent reads `02-GSD/Tasks/Active.md` for current priorities
4. Agent reads `03-Projects/Triathlon/LOG.md` for training session
5. Agent writes new `Daily/YYYY-MM-DD.md` with populated sections

**Weekly Review Flow:**

1. `02-GSD/Weekly-Review.md` template is copied to a dated note
2. Reviewer processes `01-Inbox/Inbox.md` — items move to `Tasks/Active.md`, a project, or `06-Archive/`
3. Completed tasks in `Active.md` are archived; uncompleted ones are reassessed
4. `Tasks/Waiting.md` is checked for follow-ups
5. Each project's `LOG.md` is updated; next actions set in `Tasks/Active.md`

**New Project Creation:**

1. Skill `.claude/skills/new-project.md` is invoked with project name
2. Claude creates `03-Projects/[project-name]/README.md` and `LOG.md`
3. Claude updates `02-GSD/Dashboard.md` project table with wikilink

**Capture → Action Flow:**

1. Raw item lands in `01-Inbox/Inbox.md`
2. During processing: if actionable → moves to `02-GSD/Tasks/Active.md` under correct project heading + priority
3. If reference → moves to `05-Knowledge/`
4. If dormant → moves to `06-Archive/`

**State Management:**
- No live state — everything is flat Markdown files
- "Current state" is inferred by reading `Active.md`, `Dashboard.md`, and the latest daily note
- Project progress tracked via append-only `LOG.md` per project

## Key Abstractions

**Project:**
- Purpose: Self-contained unit of work with a defined end state
- Examples: `03-Projects/JECT/`, `03-Projects/Synthscape/`, `03-Projects/Triathlon/`
- Pattern: Each project has `README.md` (context + strategy) and `LOG.md` (append-only progress log). Some have `Tasks.md` for project-specific backlog.

**Agent:**
- Purpose: A specialized AI persona definition invoked by name for recurring tasks
- Examples: `00-System/Agents/agent-daily-brief.md`, `00-System/Agents/agent-code-reviewer.md`, `00-System/Agents/agent-ject-sales.md`
- Pattern: Frontmatter (name, purpose, status, created) + System Prompt block + Tools checklist + When to use + Example invocations

**Skill:**
- Purpose: A Claude Code slash command — short instruction file that automates a vault operation
- Examples: `.claude/skills/daily-brief.md`, `.claude/skills/new-project.md`, `.claude/skills/capture.md`, `.claude/skills/weekly-review.md`
- Pattern: Plain instructions in imperative form, referencing vault paths and output format

**Task:**
- Purpose: Atomic actionable item with priority and project context
- Examples: Lines in `02-GSD/Tasks/Active.md`
- Pattern: `- [ ] Description` under `## #p1`, `## #p2`, or `## #p3` heading, grouped by project sub-heading

## Entry Points

**Morning entry point:**
- Location: `Daily/YYYY-MM-DD.md` or `02-GSD/Dashboard.md`
- Triggers: Daily brief skill or manual open
- Responsibilities: Surface today's priorities, training, and open loops

**Work entry point:**
- Location: `02-GSD/Tasks/Active.md`
- Triggers: Work session start
- Responsibilities: Single source of truth for what to do this week, in priority order

**Capture entry point:**
- Location: `01-Inbox/Inbox.md`
- Triggers: Any new idea, task, or note that needs to be captured
- Responsibilities: Buffer for unprocessed input — processed daily

**AI configuration entry point:**
- Location: `CLAUDE.md` (vault root), `00-System/CLAUDE.md`
- Triggers: Every Claude Code session in this vault
- Responsibilities: Load Jarvis persona, vault structure, conventions, and GSD workflow rules

**Weekly review entry point:**
- Location: `02-GSD/Weekly-Review.md`
- Triggers: Every Sunday
- Responsibilities: Process inbox, review tasks, update projects, plan next week

## Error Handling

**Strategy:** Soft failure — nothing is deleted, everything is movable

**Patterns:**
- Missing yesterday's daily note → daily brief agent logs "fresh start" and skips open loops section
- Unprocessed items accumulate in `01-Inbox/Inbox.md` until weekly review
- Stale tasks remain in `Active.md` and are reassessed during weekly review; do not auto-expire
- Legacy/deprecated structure remains in `04-Goals/`, `05-Areas/`, `06-Resources/`, `07-Templates/`, `08-Archives/` — these are old directory names from a prior organization scheme, preserved rather than deleted

## Cross-Cutting Concerns

**Linking:** Wikilinks `[[path/to/note]]` connect all layers — Dashboard links to projects and task files; project READMEs link to their LOG and agent
**Priority tagging:** `#p1`, `#p2`, `#p3` tags used consistently in `Active.md` and daily notes
**Git sync:** `.obsidian/plugins/github-sync` plugin syncs vault to remote git repository; commits are automated
**Frontmatter:** Daily notes use YAML frontmatter (`date`, `mood`, `energy`, `focus`); agent files use frontmatter (`name`, `purpose`, `status`, `created`)

---

*Architecture analysis: 2026-03-24*
