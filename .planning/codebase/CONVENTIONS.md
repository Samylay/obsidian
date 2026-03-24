# Coding Conventions

**Analysis Date:** 2026-03-24

> This vault is a personal knowledge management system, not a software codebase. "Conventions" here means the note-writing, naming, and structural standards that govern how content is created and maintained. Follow these when adding, editing, or restructuring vault content.

---

## Naming Patterns

**Daily Notes:**
- File: `Daily/YYYY-MM-DD.md` — strictly ISO date, no other format
- Example: `Daily/2026-03-23.md`

**Project Files:**
- Project folders: PascalCase, hyphen-separated for multi-word — `03-Projects/Japan-Summer/`, `03-Projects/Personal-Brand/`
- Every project has exactly two files: `README.md` (overview) and `LOG.md` (append-only log)
- Optional: `Tasks.md` for extended task breakdown (see `03-Projects/Synthscape/Tasks.md`)

**Agent Files:**
- Pattern: `agent-[name].md` — kebab-case, prefixed with `agent-`
- Examples: `00-System/Agents/agent-code-reviewer.md`, `00-System/Agents/agent-daily-brief.md`

**Skill Files:**
- Pattern: `[name].md` — kebab-case, no prefix
- Location: `.claude/skills/[name].md`
- Examples: `.claude/skills/daily-brief.md`, `.claude/skills/new-project.md`

**Area/Knowledge Files:**
- Use `README.md` as the entry point for each area directory

**Directories:**
- Top-level: `NN-Name/` — two-digit prefix for ordering, PascalCase name
- Examples: `00-System/`, `01-Inbox/`, `02-GSD/`, `03-Projects/`

---

## Frontmatter Standards

**Daily Notes — required frontmatter:**
```yaml
---
date: YYYY-MM-DD
mood:
energy:
focus:
---
```
All three fields (mood, energy, focus) are present but may be left blank for fill-in-later. Do not add extra keys.

**Agent Files — required frontmatter:**
```yaml
---
name: agent-name
purpose: one-line description
status: active
created: YYYY-MM-DD
---
```

**Project/Area README files:** No frontmatter — start directly with `# Title`.

---

## Document Structure Patterns

**Daily Note structure** (from `.claude/skills/daily-brief.md`):
```markdown
# {{Day}}, {{Date}}

## Energy check-in
> [prompt]

## Top 3 priorities
- [ ] #p1
- [ ] #p1
- [ ] #p1

## Training
[session from Triathlon plan]

## JECT / School
[deadlines or follow-ups]

## Open loops from yesterday
[unchecked items from yesterday]

## Notes
[free space]
```

**Project README structure** (from `03-Projects/Synthscape/README.md`, `03-Projects/JECT/README.md`):
- `# Project Name` — h1 title
- Short description block with bold key/value pairs
- `## [Section]` headers for logical groupings
- `## Tasks` section pointing to `→ [[02-GSD/Tasks/Active]]`
- `## Links` section at the bottom with wikilinks and external URLs

**Project LOG structure** (from `03-Projects/JECT/LOG.md`):
```markdown
## YYYY-MM-DD — [title]
- [bullet entry]
- [bullet entry]
```
Entries are appended chronologically. Never edit past entries.

**Agent File structure** (from `00-System/Agents/agent-template.md`):
```markdown
# Agent: [Name]

## System Prompt
```
[prompt text]
```

## Tools / Access
- [ ] Vault read access
- [ ] Web search
- [ ] Code execution
- [ ] External API: [name]

## When to use
[trigger description]

## Example invocations
```
[examples]
```

## Notes
[quirks, limitations, tips]
```

---

## Task System Conventions

**Priority tags** — inline hashtags on checkbox items:
- `#p1` — must do this week / top priority
- `#p2` — should do this week
- `#p3` — nice to have

**Task format:**
```markdown
- [ ] Task description #p1
- [x] Completed task
```

**Active tasks file** (`02-GSD/Tasks/Active.md`) — sections:
```markdown
## #p1 — Must do this week
### [Project Name]
- [ ] task

## #p2 — Should do this week
### [Project Name]
- [ ] task

## #p3 — Nice to have
### [Project Name]
- [ ] task
```

**Waiting table** (`02-GSD/Tasks/Waiting.md`) — Markdown table format:
```markdown
| Item | Waiting on | Since | Follow up by |
```

---

## Linking Conventions

**Wikilinks** are the standard internal link format:
```markdown
[[03-Projects/JECT/README]]           # full path link
[[03-Projects/JECT/README\|JECT]]     # aliased link (display text after \|)
[[LOG]]                               # relative link from same folder
```

**Navigation arrows** — use `→` for inline pointer links:
```markdown
→ [[02-GSD/Tasks/Active]]
→ [[Tasks/Waiting]]
```

**External links** — standard Markdown format:
```markdown
[Link Text](https://url)
```

**Image embeds** — Obsidian embed syntax:
```markdown
![[Pasted image YYYYMMDDHHMMSS.png]]
```

---

## Content Style

**Headings:**
- H1 (`#`) — document title only, one per file
- H2 (`##`) — major sections
- H3 (`###`) — subsections within a section (used in Active.md for project groupings under priority levels)

**Bold key-value pairs** for project metadata:
```markdown
**Status:** active
**Goal:** Olympic distance — first race
```

**Blockquotes** for meta-instructions or prompts to fill in:
```markdown
> Check in: how's the energy? How's the mood?
> Run every Sunday. Takes ~30 min.
```

**Tables** for structured data (gear lists, project status, waiting items, decisions).

**Emoji status indicators** in Dashboard tables:
- `🟢` — active/on track
- `🟡` — needs attention / stalled
- `🔵` — waiting / blocked externally

---

## Immutability Rules

- **Never delete** — move dormant content to `06-Archive/` instead
- **LOG.md files are append-only** — new entries at the bottom, old entries never edited
- **Archive pattern:** move file or section to `06-Archive/` with original name preserved

---

## Skill File Conventions

Skills in `.claude/skills/` are imperative instructions directed at Claude. They use:
- `{{YYYY-MM-DD}}` — date template placeholder
- `{{args}}` — pass-through argument placeholder
- `{{project-name}}` — named argument placeholder
- Present tense, imperative mood: "Read...", "Create...", "Append..."
- End with a confirmation statement: "Tell me when it's ready" or "Confirm it was added."

---

*Convention analysis: 2026-03-24*
