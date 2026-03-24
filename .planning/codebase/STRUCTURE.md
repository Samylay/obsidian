# Codebase Structure

**Analysis Date:** 2026-03-24

## Directory Layout

```
obsidian/                          # Vault root
├── CLAUDE.md                      # Jarvis AI identity + vault conventions (loaded every session)
├── 00-System/                     # AI system layer — agents, skills, templates
│   ├── CLAUDE.md                  # Duplicate of root CLAUDE.md
│   ├── Agents/                    # Agent definition files (.md)
│   │   ├── README.md
│   │   ├── agent-template.md      # Template for new agents
│   │   ├── agent-daily-brief.md
│   │   ├── agent-code-reviewer.md
│   │   └── agent-ject-sales.md
│   ├── Skills/                    # Skill registry (referenced by .claude/skills/)
│   │   └── README.md
│   └── GSD-Template/              # Project scaffolding template
│       ├── README.md
│       └── .planning/             # GSD planning docs template
├── 01-Inbox/                      # Capture buffer
│   └── Inbox.md                   # Single capture file — process daily
├── 02-GSD/                        # Task management layer
│   ├── Dashboard.md               # Project overview + links to all task files
│   ├── Weekly-Review.md           # Weekly review template
│   └── Tasks/
│       ├── Active.md              # Current week tasks (the primary work list)
│       ├── Waiting.md             # Blocked/delegated items
│       └── Someday.md             # Low-priority backlog
├── 03-Projects/                   # Active projects
│   ├── JECT/
│   │   ├── README.md              # Project context + strategy + links
│   │   └── LOG.md                 # Append-only progress log
│   ├── Synthscape/
│   │   ├── README.md
│   │   └── LOG.md
│   ├── Triathlon/
│   │   ├── README.md
│   │   └── LOG.md
│   ├── Neolia/
│   │   ├── README.md
│   │   ├── Tasks.md               # Project-specific task backlog
│   │   └── LOG.md
│   ├── Japan-Summer/
│   │   ├── README.md
│   │   └── LOG.md
│   └── Personal-Brand/
│       ├── README.md
│       └── LOG.md
├── 04-Areas/                      # Ongoing responsibilities (no end date)
│   ├── Dev/
│   │   └── README.md              # Stack, standards, dev notes
│   ├── Health/
│   │   └── README.md
│   └── School/
│       ├── EPITA-S07.md
│       ├── DOR-DOD.md
│       └── UXUI/
├── 05-Knowledge/                  # Reference material (not actionable)
│   ├── README.md
│   ├── Books/
│   │   └── README.md
│   └── Clippings/                 # Saved web articles (.md files)
├── 06-Archive/                    # Done or dormant — nothing deleted
│   ├── GameDev-raw-notes.md
│   └── Ject-raw-notes.md
├── Daily/                         # Daily notes — one file per day
│   └── YYYY-MM-DD.md              # e.g., 2026-03-23.md
├── Attachments/                   # Images and binary attachments
├── .claude/                       # Claude Code configuration
│   └── skills/                    # Slash command skill files
│       ├── daily-brief.md
│       ├── weekly-review.md
│       ├── new-project.md
│       └── capture.md
├── .planning/                     # GSD planning documents (this system)
│   └── codebase/
│       ├── ARCHITECTURE.md
│       └── STRUCTURE.md
└── .obsidian/                     # Obsidian app configuration (auto-managed)
    ├── app.json
    ├── appearance.json
    ├── community-plugins.json
    └── plugins/
        └── github-sync/           # Auto-commit plugin
```

**Legacy directories (preserved, not active):**
- `04-Goals/` — superseded by `03-Projects/` + GSD
- `05-Areas/Health/` — duplicate of `04-Areas/Health/`
- `06-Resources/` — superseded by `05-Knowledge/`
- `07-Templates/` — superseded by `00-System/GSD-Template/`
- `08-Archives/` — superseded by `06-Archive/`

## Directory Purposes

**`00-System/`:**
- Purpose: AI assistant configuration and vault automation tooling
- Contains: Agent definitions, skill registry README, project template, vault-level CLAUDE.md
- Key files: `00-System/Agents/agent-daily-brief.md`, `00-System/Agents/agent-template.md`

**`01-Inbox/`:**
- Purpose: Single-file capture buffer for all incoming ideas and tasks
- Contains: One file only — `Inbox.md`
- Key files: `01-Inbox/Inbox.md`

**`02-GSD/`:**
- Purpose: Get Stuff Done task management — the operational core of the vault
- Contains: Dashboard, weekly review template, task sub-files
- Key files: `02-GSD/Dashboard.md`, `02-GSD/Tasks/Active.md`

**`03-Projects/`:**
- Purpose: Active projects with outcomes, context, and progress history
- Contains: One subdirectory per project, each with README + LOG
- Key files: `03-Projects/[project]/README.md`, `03-Projects/[project]/LOG.md`

**`04-Areas/`:**
- Purpose: Ongoing areas of responsibility that don't have a completion date
- Contains: Area READMEs and relevant reference notes
- Key files: `04-Areas/Dev/README.md`, `04-Areas/School/EPITA-S07.md`

**`05-Knowledge/`:**
- Purpose: Reference-only material — articles, book notes, technical guides
- Contains: Clippings (saved articles), Books subdirectory
- Key files: `05-Knowledge/Clippings/*.md`

**`06-Archive/`:**
- Purpose: Dormant or completed items — the vault's recycle bin alternative
- Contains: Raw historical notes moved here instead of deleted
- Key files: `06-Archive/GameDev-raw-notes.md`, `06-Archive/Ject-raw-notes.md`

**`Daily/`:**
- Purpose: One daily note per day for check-ins, scheduling, and open loop tracking
- Contains: `YYYY-MM-DD.md` files with YAML frontmatter
- Key files: `Daily/2026-03-23.md` (most recent)

**`.claude/skills/`:**
- Purpose: Executable slash commands for Claude Code sessions
- Contains: Imperative instruction `.md` files, one per skill
- Key files: `.claude/skills/daily-brief.md`, `.claude/skills/new-project.md`

## Key File Locations

**Entry Points:**
- `CLAUDE.md`: Jarvis AI persona and all vault conventions — loaded at every Claude Code session
- `02-GSD/Dashboard.md`: Operational home page — project statuses and links to all task files
- `02-GSD/Tasks/Active.md`: Primary work list — what to work on this week

**Configuration:**
- `CLAUDE.md`: AI behavior, conventions, GSD workflow rules
- `00-System/Agents/agent-template.md`: Template for new agent definitions
- `.obsidian/community-plugins.json`: Lists `github-sync` plugin

**Core Workflow Files:**
- `01-Inbox/Inbox.md`: All new captures land here
- `02-GSD/Tasks/Active.md`: Prioritized week tasks
- `02-GSD/Tasks/Waiting.md`: Delegated / blocked items
- `02-GSD/Tasks/Someday.md`: Low-priority backlog
- `02-GSD/Weekly-Review.md`: Sunday review template

**Project Files:**
- `03-Projects/[project]/README.md`: Project context, strategy, open questions
- `03-Projects/[project]/LOG.md`: Append-only activity log

**AI Automation:**
- `.claude/skills/daily-brief.md`: Daily note generation instructions
- `.claude/skills/new-project.md`: Project scaffolding instructions
- `00-System/Agents/agent-daily-brief.md`: Full agent definition with system prompt
- `00-System/Agents/agent-code-reviewer.md`: Code review agent definition
- `00-System/Agents/agent-ject-sales.md`: JECT proposals agent definition

## Naming Conventions

**Files:**
- Daily notes: `YYYY-MM-DD.md` (e.g., `Daily/2026-03-23.md`)
- Agent files: `agent-[name].md` (e.g., `agent-daily-brief.md`)
- Skill files: `[verb-noun].md` (e.g., `daily-brief.md`, `new-project.md`)
- Project files: `README.md` and `LOG.md` (always these exact names)
- Knowledge clippings: Saved with original title as filename

**Directories:**
- Top-level: `NN-Name/` with two-digit numeric prefix for sort order
- Projects: `PascalCase` or `Kebab-Case` (e.g., `Japan-Summer`, `Personal-Brand`)
- Areas: `PascalCase` (e.g., `Dev`, `Health`, `School`)

**Tags:**
- Priority: `#p1` (must do), `#p2` (should do), `#p3` (nice to have)

**Wikilinks:**
- Full path from vault root: `[[03-Projects/JECT/README]]`
- Display alias: `[[03-Projects/JECT/README|JECT]]`

## Where to Add New Code

**New project:**
- Use skill: `.claude/skills/new-project.md`
- Creates: `03-Projects/[project-name]/README.md` + `LOG.md`
- Updates: `02-GSD/Dashboard.md` project table

**New daily note:**
- Use skill: `.claude/skills/daily-brief.md`
- Creates: `Daily/YYYY-MM-DD.md`
- Sources: `02-GSD/Tasks/Active.md`, previous daily note, `03-Projects/Triathlon/LOG.md`

**New task:**
- Capture to: `01-Inbox/Inbox.md` (quick capture)
- Or directly to: `02-GSD/Tasks/Active.md` under correct `## #pN` and project heading
- Format: `- [ ] Description` with appropriate priority

**New agent:**
- Copy: `00-System/Agents/agent-template.md`
- Save to: `00-System/Agents/agent-[name].md`
- Register in: `00-System/Agents/README.md` table

**New skill:**
- Create: `.claude/skills/[verb-noun].md`
- Register in: `00-System/Skills/README.md` table

**New knowledge/reference:**
- Articles/clippings: `05-Knowledge/Clippings/[article-title].md`
- Book notes: `05-Knowledge/Books/[book-title].md`

**Log a project update:**
- Append to: `03-Projects/[project]/LOG.md`
- Format: Date heading + bullet points

**Archive anything:**
- Move to: `06-Archive/` — never delete

## Special Directories

**`.obsidian/`:**
- Purpose: Obsidian application configuration — workspace layout, plugin settings, appearance
- Generated: Yes (partially — by Obsidian app)
- Committed: Yes (synced via github-sync plugin)

**`.claude/`:**
- Purpose: Claude Code skill files — slash commands for vault automation
- Generated: No — manually maintained
- Committed: Yes

**`.planning/`:**
- Purpose: GSD planning documents for AI-assisted project planning
- Generated: Yes (by GSD mapping agents)
- Committed: Yes

**`Attachments/`:**
- Purpose: Images and binary files embedded in notes (Obsidian default attachment folder)
- Generated: Yes (by Obsidian on paste/drag)
- Committed: Yes

---

*Structure analysis: 2026-03-24*
