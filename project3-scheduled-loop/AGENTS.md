# Project 3: Scheduled Loop with Memory

This project demonstrates a scheduled loop with the spine pattern using OpenCode.

## Purpose

Scan the codebase for TODO comments, report what's new, and remember findings across runs.

## How to Run

```powershell
.\run-loop.ps1
```

Or manually (run twice to see the spine in action):

```powershell
opencode run "run the morning-brief skill"
# Wait a minute, then run again
opencode run "run the morning-brief skill"
```

## Key Concept

This is a **scheduled loop with memory**. The `progress.md` file is the **spine** — it remembers what happened so the next run builds on it instead of starting from zero.

## The Spine Pattern

1. **Read progress.md first** — know what was already found
2. **Do the work** — find new TODOs
3. **Update progress.md last** — save what you found

Without the spine, the loop would report the same TODOs every time. With it, each run only reports what's new.

## Project Structure

- `src/` - Sample codebase with TODO comments
- `progress.md` - The spine (memory between runs)
- `.opencode/skills/morning-brief/SKILL.md` - Agent skill definition
- `run-loop.ps1` - The loop script
- `AGENTS.md` - This rules file

## What to Watch For

Run the loop twice. Notice:
- **First run**: finds all TODOs, reports them as "new"
- **Second run**: finds same TODOs, reports "no new TODOs since last run"

That's the spine working. The second run read progress.md and knew what was already found.
