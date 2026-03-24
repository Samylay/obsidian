# Codebase Concerns

**Analysis Date:** 2026-03-24

---

## Tech Debt

**Duplicate Directory Structure — Areas:**
- Issue: Two parallel "Areas" directories exist with overlapping purposes. `04-Areas/` contains `Dev/`, `Health/`, `School/` (all with content). `05-Areas/` contains only an empty `Health/` subdirectory.
- Files: `04-Areas/`, `05-Areas/`
- Impact: Ambiguity about which directory is canonical. The vault spec in `CLAUDE.md` only defines `04-Areas/`. `05-Areas/` is a ghost directory.
- Fix approach: Confirm `04-Areas/` is canonical, delete `05-Areas/` (or move to `06-Archive/` per the no-delete convention).

**Duplicate Archive Directories:**
- Issue: Two archive directories exist — `06-Archive/` (referenced in `CLAUDE.md` as the archive location) and `08-Archives/` (unspecified). Both exist at the vault root.
- Files: `06-Archive/`, `08-Archives/`
- Impact: Inconsistent archival — future items may be placed in either directory by mistake. `08-Archives/` is completely empty.
- Fix approach: Delete `08-Archives/` (empty). Establish `06-Archive/` as the single archive.

**Undocumented Top-Level Directories:**
- Issue: Several directories exist that are not in the vault spec defined in `CLAUDE.md`: `04-Goals/`, `06-Resources/`, `07-Templates/`, `08-Archives/`.
- Files: `04-Goals/`, `06-Resources/`, `07-Templates/`, `08-Archives/`
- Impact: Jarvis and future agents operate from the spec in `CLAUDE.md`. Files placed in these directories will not be discovered or referenced correctly.
- Fix approach: Audit each directory. If empty, remove it. If it has content, either integrate into the numbered spec or add it explicitly to `CLAUDE.md`.

**Duplicate CLAUDE.md:**
- Issue: `CLAUDE.md` exists at both the vault root (`/CLAUDE.md`) and at `00-System/CLAUDE.md`. Both files contain identical content.
- Files: `CLAUDE.md`, `00-System/CLAUDE.md`
- Impact: If either copy diverges, Jarvis will receive conflicting identity/context instructions. Claude Code loads the root `CLAUDE.md`; the `00-System/` copy is never loaded automatically.
- Fix approach: Delete `00-System/CLAUDE.md` and treat the root `CLAUDE.md` as the single source of truth. Note in `00-System/` README where the config lives.

**Raw Notes Stranded in Archive:**
- Issue: `06-Archive/GameDev-raw-notes.md` (4 lines) and `06-Archive/Ject-raw-notes.md` (48 lines) contain unprocessed raw capture content — not actually archived material. The GameDev file contains JECT and game design content mixed together.
- Files: `06-Archive/GameDev-raw-notes.md`, `06-Archive/Ject-raw-notes.md`
- Impact: Useful information is buried in the archive and will never surface during normal vault operation. Ject-raw-notes in particular contains significant operational knowledge about pricing, conventions, and tooling.
- Fix approach: Process `06-Archive/Ject-raw-notes.md` — extract JECT-specific items into `03-Projects/JECT/README.md` or `03-Projects/JECT/LOG.md`. Move game design idea to `03-Projects/Synthscape/`. Then archive the emptied file.

---

## Known Bugs

**Broken Wikilink Syntax in Dashboard:**
- Symptoms: Aliased wikilinks in `02-GSD/Dashboard.md` use `[[path\|alias]]` with a backslash before the pipe. Obsidian expects `[[path|alias]]`. The backslash causes link resolution to fail — links will not navigate to their targets.
- Files: `02-GSD/Dashboard.md` lines 19–24
- Trigger: Every time Dashboard is opened in Obsidian. The Project Status table shows 6 broken links covering all active projects.
- Workaround: None. Users must manually navigate to project files.
- Fix: Replace `\|` with `|` in each wikilink: `[[03-Projects/JECT/README|JECT]]`, etc.

**Daily Note Frontmatter Left Blank:**
- Symptoms: `Daily/2026-03-23.md` has `mood:`, `energy:`, and `focus:` frontmatter fields with no values.
- Files: `Daily/2026-03-23.md` lines 3–5
- Impact: Any future automation or query that reads these fields (e.g., mood-tracking, weekly energy averages) will return empty data. Establishes a bad convention for future daily notes.
- Fix approach: Populate these fields at note creation time, or update the `daily-brief` skill to prompt for values before writing the note.

---

## Security Considerations

**No .gitignore — Everything Commits to GitHub:**
- Risk: The vault has no `.gitignore`. All files, including `.planning/`, `Daily/` notes, and any future sensitive captures are committed (or will be committed) to the public/private GitHub repo.
- Files: Entire vault root — no `.gitignore` present
- Current mitigation: None. `Daily/` and `.planning/` are currently untracked (`??` in git status) but only because they haven't been committed yet — not because they are excluded.
- Recommendations: Create a `.gitignore` that at minimum excludes `.planning/`, `Daily/`, `.obsidian/workspace*`, and any file containing credentials or personal health data. Evaluate whether daily notes (which may contain personal health/mood data) should ever be committed.

---

## Fragile Areas

**Active.md as Single Task Store for All Projects:**
- Files: `02-GSD/Tasks/Active.md`
- Why fragile: All 5 non-Synthscape projects redirect tasks to `02-GSD/Tasks/Active.md` with no project-level filtering. As task count grows, the file becomes a flat list with no way to filter by project without reading the whole file. Weekly reviews already require manually scanning every project section.
- Safe modification: Synthscape has its own `03-Projects/Synthscape/Tasks.md` as a working model. Add per-project `Tasks.md` files to other projects and update `Active.md` to hold only the current week's cross-project top priorities.
- Test coverage: Not applicable (no tests in this vault).

**Weekly Review as Template Only — No Filled Instances:**
- Files: `02-GSD/Weekly-Review.md`
- Why fragile: `Weekly-Review.md` is a template, not a living document. The template instructs users to copy it to `Weekly-Review-YYYY-MM-DD.md`, but no completed weekly review notes exist anywhere in the vault. The system has never been exercised.
- Safe modification: On first use, copy the template to `02-GSD/Weekly-Review-2026-03-30.md` and fill it in. Do not modify the template itself.

**Synthscape Tasks Misaligned with README Design:**
- Files: `03-Projects/Synthscape/Tasks.md`, `03-Projects/Synthscape/README.md`
- Why fragile: `README.md` describes a 3D arena shooter / roguelike (Unity, WASD movement, blaster weapons, room-based). `Tasks.md` describes a 2D stealth platformer (2D character controller, stealth crouching, cover system, visibility meter). These are two different game designs.
- Impact: If development begins from `Tasks.md`, the work will not match the vision in `README.md`. Significant rework risk.
- Fix approach: Reconcile the two documents. Either rewrite `Tasks.md` to match the arena shooter design, or update `README.md` to reflect a pivot.

---

## Missing Critical Features

**No Process for Completing/Archiving Tasks:**
- Problem: `Active.md` has no completed tasks — only open checkboxes. No completed tasks have been moved to archive. The `Weekly-Review.md` instructs "Archive completed items" but no archive location for completed tasks is defined.
- Blocks: The task backlog cannot be used to assess progress over time. Velocity is invisible.
- Fix: Define a `06-Archive/Tasks-YYYY-WW.md` convention, or add a `## Done` section to `Active.md` with a weekly flush cadence.

**No .gitignore for Vault:**
- Problem: No `.gitignore` file exists at the vault root.
- Blocks: Cannot safely commit the vault to git without risking personal daily notes, health data, and planning artifacts going public. Also makes `.obsidian/workspace` cache files pollute git history.
- Fix: Create `.gitignore` before next commit.

**Skills Registered in README but Not Validated:**
- Problem: `00-System/Skills/README.md` lists 4 skills (`daily-brief`, `weekly-review`, `new-project`, `capture`), but only the `.claude/skills/` versions matter at runtime. The `00-System/Skills/` directory contains only `README.md` — no actual skill files. The actual skills live in `.claude/skills/` (5 files including `init-gsd.md` which is not in the README).
- Files: `00-System/Skills/README.md`, `.claude/skills/`
- Blocks: If a user reads `00-System/Skills/README.md` to understand available skills, the list is inaccurate (`init-gsd` is missing).
- Fix: Update `00-System/Skills/README.md` to reflect actual skills in `.claude/skills/`, including `init-gsd`.

---

## Test Coverage Gaps

**No Automated Validation of Vault Structure:**
- What's not tested: Wikilink integrity, frontmatter completeness, file naming conventions, required files per directory.
- Files: Entire vault — no linting or validation tooling present
- Risk: Broken links accumulate silently (as seen in `Dashboard.md`). Convention drift goes undetected (as seen in the duplicate directories).
- Priority: Low — a shell script or Dataview query in Obsidian could catch broken links, but this is optional for a personal vault.

---

*Concerns audit: 2026-03-24*
