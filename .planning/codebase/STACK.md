# Technology Stack

**Analysis Date:** 2026-03-24

## Languages

**Primary:**
- Markdown - All vault content (notes, tasks, projects, daily logs)

**Secondary:**
- JSON - Obsidian configuration files (`.obsidian/*.json`)
- JavaScript - GitHub Sync community plugin (`.obsidian/plugins/github-sync/main.js`)

## Runtime

**Environment:**
- Obsidian desktop application (Electron-based)
- Minimum app version required: 0.15.0 (enforced by github-sync plugin)

**Package Manager:**
- Not applicable — no npm/pip/cargo package management
- Plugin management handled natively by Obsidian

## Frameworks

**Core:**
- Obsidian PKM - Personal knowledge management platform, hosts all vault content

**Build/Dev:**
- Claude Code - Primary AI assistant for vault operations (read/write access)
- GSD (Get Stuff Done) workflow - Task/project management methodology via `.planning/` and skills

## Key Dependencies

**Critical:**
- Obsidian application - Required to open and use the vault with full feature set
- Git - Required for version control and GitHub sync
- SSH key pair - Required for `git@github.com:Samylay/obsidian.git` remote auth

**Plugins (Community):**
- `github-sync` v1.0.6 - Auto-syncs vault to GitHub on load and every 5 minutes; desktop only

**Plugins (Core — enabled):**
- `daily-notes` - Creates `Daily/YYYY-MM-DD.md` notes
- `templates` - Note templating
- `sync` - Obsidian Sync (enabled but may be supplementary to github-sync)
- `bases` - Obsidian Bases (database-like views)
- `canvas` - Visual canvas notes
- `backlink`, `outgoing-link`, `graph` - Note linking and graph view
- `file-recovery` - Local file snapshots
- `properties` - YAML frontmatter property editor
- `bookmarks`, `global-search`, `switcher` - Navigation

## Configuration

**Vault Config:**
- Location: `.obsidian/`
- App settings: `.obsidian/app.json` (PDF export settings only)
- Appearance: `.obsidian/appearance.json` (empty — default theme)
- Plugin states: `.obsidian/core-plugins.json`, `.obsidian/community-plugins.json`
- GitHub Sync config: `.obsidian/plugins/github-sync/data.json`

**Claude Code Config:**
- Permissions: `.claude/settings.local.json` — allows Google Calendar MCP tool and `gsd:map-codebase` skill
- Skills: `.claude/skills/` — contains `capture.md`, `daily-brief.md`, `init-gsd.md`, `new-project.md`, `weekly-review.md`
- Vault instructions: `CLAUDE.md` (root) and `00-System/CLAUDE.md`

**GSD Planning Config:**
- Template: `00-System/GSD-Template/.planning/config.json`
- Workflow settings: auto_research, verification_loop, parallel_execution, atomic_commits enabled
- Context per task: 200k tokens
- Phase count target: 5–8

## Platform Requirements

**Development:**
- Linux, macOS, or Windows desktop (Obsidian is cross-platform)
- Git installed and SSH key configured for `github.com`
- Obsidian app >= 0.15.0
- Claude Code CLI for AI-assisted vault operations

**Production:**
- Same as development — this is a local-first personal vault
- Remote backup: GitHub repository `Samylay/obsidian` (private)

---

*Stack analysis: 2026-03-24*
