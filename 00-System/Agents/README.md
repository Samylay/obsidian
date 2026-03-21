# Custom Dev Agents

This folder contains your custom AI agents — each one is a specialized assistant tuned for a specific job.

## What's an agent here?
Each `.md` file in this folder defines an agent:
- **System prompt** — the persona and instructions
- **Tools** — what it can access (files, APIs, web, etc.)
- **Trigger** — when/how to invoke it
- **Examples** — sample prompts to use with it

## Active Agents

| Agent | Purpose | File |
|-------|---------|------|
| code-reviewer | Reviews PRs and diffs for quality + security | [[agent-code-reviewer]] |
| ject-sales | Helps draft client proposals and outreach for JECT | [[agent-ject-sales]] |
| daily-brief | Generates your morning brief from vault context | [[agent-daily-brief]] |

## How to invoke
From Claude Code in your vault:
```bash
# Reference an agent by pasting its system prompt, or
claude "Act as my code-reviewer agent (see 00-System/Agents/agent-code-reviewer.md) and review this diff: ..."
```

Or set up a Claude Code skill that loads the agent file automatically — see `00-System/Skills/`.

## Adding a new agent
Copy `agent-template.md`, fill it in, add it to the table above.
