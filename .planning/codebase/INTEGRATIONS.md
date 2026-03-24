# External Integrations

**Analysis Date:** 2026-03-24

## APIs & External Services

**Version Control / Backup:**
- GitHub (`git@github.com:Samylay/obsidian.git`) - Remote vault backup and sync
  - SDK/Client: `github-sync` community plugin v1.0.6
  - Auth: SSH key pair (system-level `~/.ssh/`)
  - Sync interval: every 5 minutes + on vault load
  - Config: `.obsidian/plugins/github-sync/data.json`

**AI Assistant:**
- Claude (Anthropic) - Primary AI for vault operations via Claude Code CLI
  - Interface: Claude Code with custom skills in `.claude/skills/`
  - Vault instructions loaded from `CLAUDE.md` and `00-System/CLAUDE.md`
  - Agents defined in `00-System/Agents/` (code-reviewer, ject-sales, daily-brief)

**Calendar:**
- Google Calendar - Listed in allowed MCP tools in `.claude/settings.local.json`
  - Tool: `mcp__claude_ai_Google_Calendar__gcal_list_events`
  - Used by: `daily-brief` skill for schedule context
  - Auth: MCP server handles OAuth (external to vault)

## Data Storage

**Databases:**
- Not applicable — vault uses flat Markdown files as primary storage
- `bases` core plugin enabled — provides structured data views over existing Markdown files

**File Storage:**
- Local filesystem: `/home/samy/Documents/obsidian/` — primary storage
- GitHub (remote): `git@github.com:Samylay/obsidian.git` — backup/sync
- Obsidian Sync: `sync` core plugin enabled — may provide additional cloud backup via Obsidian's proprietary sync service

**Attachments:**
- Location: `Attachments/` at vault root — PNG images pasted from clipboard

**Caching:**
- None detected beyond Obsidian's internal cache (`.obsidian/` config files)

## Authentication & Identity

**Auth Provider:**
- SSH keys — used for GitHub remote push/pull
  - Key path: system default (`~/.ssh/id_*`)
  - Remote: `git@github.com:Samylay/obsidian.git`

**MCP (Model Context Protocol):**
- Google Calendar MCP server — OAuth-managed externally, exposed to Claude Code as tool `mcp__claude_ai_Google_Calendar__gcal_list_events`
  - Permission granted in `.claude/settings.local.json`

## Monitoring & Observability

**Error Tracking:**
- None detected

**Logs:**
- Project activity: appended to per-project `LOG.md` files in `03-Projects/*/LOG.md`
- Daily notes: `Daily/YYYY-MM-DD.md` with frontmatter (date, mood, energy, focus)
- Git commit history: via `git@github.com:Samylay/obsidian.git`

## CI/CD & Deployment

**Hosting:**
- Local-first — vault runs on Samy's machine
- No web hosting or server deployment

**CI Pipeline:**
- None — no automated test or build pipeline
- Version control via git with auto-push by `github-sync` plugin

## Environment Configuration

**Required env vars:**
- None explicitly defined in vault (no `.env` files detected)
- SSH key must be configured at OS level for GitHub sync to work

**Secrets location:**
- SSH private key: `~/.ssh/` (outside vault, not tracked by git)
- Google Calendar OAuth tokens: managed by MCP server (outside vault)

## Webhooks & Callbacks

**Incoming:**
- None detected

**Outgoing:**
- None detected — GitHub sync uses git push/pull, not webhooks

---

*Integration audit: 2026-03-24*
