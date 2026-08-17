# Project 12: Connect to the World

This project demonstrates **connecting your loop to the real world** — file system, GitHub, and Slack.

## Key Concept

Connectors are bridges between the agent and the real world.
They allow the agent to read/write files, open PRs, send messages, or call APIs.

## How to Run

```powershell
# Run the fix-and-connect loop
opencode run "run the fix-and-connect skill"
```

## What This Teaches

1. **File System Connector** — Write reports to files
2. **Git Connector** — Create commits with changes
3. **Slack Connector** — Send notifications (simulated)
4. **Safety** — Read vs write connectors, risk levels

## Files

- `src/strings.py` - Buggy codebase (3 bugs)
- `tests/test_strings.py` - Tests that fail
- `.opencode/skills/fix-and-connect/SKILL.md` - Fix bugs + connect to world
- `reports/` - Where reports are written (file system connector)
- `AGENTS.md` - This rules file
