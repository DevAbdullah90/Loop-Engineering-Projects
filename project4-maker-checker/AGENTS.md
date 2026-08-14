# Project 4: Fix Loop with Real Checker

This project demonstrates the maker-checker pattern using OpenCode.

## Purpose

Fix a bug with a separate reviewer that grades the work. Only PASS opens a PR.

## How to Run

```powershell
.\run-loop.ps1
```

Or run each step manually:

```powershell
# Step 1: Maker implements the fix
opencode run "run the implement-fix skill"

# Step 2: Checker reviews the fix
opencode run "review the fix that was just implemented"
```

## Key Concept

This is a **maker-checker** loop. The agent that writes the code (maker) is NOT the agent that approves it (checker). This prevents the model from approving its own work too easily.

## The Pattern

```
Maker (implementer)          Checker (reviewer)
      │                           │
      ├─ Reads the bug            ├─ Runs tests independently
      ├─ Creates branch           ├─ Reads the diff
      ├─ Implements fix           ├─ Grades: PASS or FAIL
      ├─ Runs tests              │
      ├─ Commits fix             │
      │                          │
      └─────── PASS? ────────────┘
                │
                ├─ PASS → Open PR
                └─ FAIL → Flag for human
```

## Project Structure

- `src/cart.py` - Shopping cart with discount bug
- `tests/test_cart.py` - Tests that fail until bug is fixed
- `.opencode/skills/implement-fix/SKILL.md` - Maker skill
- `.opencode/agents/reviewer.md` - Checker agent (read-only)
- `run-loop.ps1` - The maker-checker loop script
- `AGENTS.md` - This rules file

## What to Watch For

The reviewer agent:
- Is **read-only** (cannot edit files)
- **Runs tests itself** (doesn't trust the maker's claim)
- Grades PASS or FAIL with specific reasons

This is the core safety pattern in loop engineering.
