Initialize a new coding project with the GSD framework.

Steps:
1. Ask for the project name and path if not provided as args
2. Copy the `.planning/` template from `[vault-path]/00-System/GSD-Template/.planning/` into the target project directory
3. Update `.planning/config.json` with the project name
4. Ask: "What are you building? Give me a 2-3 sentence description and the core value (the one non-negotiable priority)."
5. Fill in PROJECT.md with the answers
6. Ask: "List your v1 requirements — what must exist for this to be usable?"
7. Fill in REQUIREMENTS.md
8. Ask: "How many phases roughly? (coarse: 3-5, standard: 5-8, fine: 8-12)"
9. Draft ROADMAP.md with phase breakdown
10. Confirm STATE.md is initialized with Phase 1 as current focus

Vault template location: C:/Users/layai/Documents/Obsidian Vault/00-System/GSD-Template/

When done, tell the user to run `/gsd:plan-phase 1` to begin.
