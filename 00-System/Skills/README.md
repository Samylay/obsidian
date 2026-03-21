# Claude Code Skills

Custom skills that extend Claude Code's capabilities in this vault.

## What's a skill?
A skill is a markdown file that acts as a slash command in Claude Code.
When you type `/skill-name`, Claude loads the file and executes its instructions.

## Available Skills

| Skill | Command | Description |
|-------|---------|-------------|
| daily-brief | `/daily-brief` | Generate today's daily note |
| weekly-review | `/weekly-review` | Run the weekly GSD review |
| new-project | `/new-project` | Scaffold a new project in 03-Projects/ |
| capture | `/capture` | Quick add to 01-Inbox/Inbox.md |

## Setup
Skills need to be placed in `.claude/skills/` at your vault root for Claude Code to recognize them automatically. The files here are the source — copy them there when ready.

```bash
cp "00-System/Skills/*.md" ".claude/skills/"
```
