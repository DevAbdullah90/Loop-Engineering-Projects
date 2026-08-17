# Project 7: Add a Worktree

This project demonstrates **parallel work with isolation** using worktrees.

## Key Concept

A worktree is a temporary directory where an agent works in isolation.
This prevents write conflicts when multiple agents work on the same codebase.

## How to Run

```powershell
# Run parallel work with worktrees
.\run-parallel.ps1

# Show what happens without worktrees (write conflict)
.\run-parallel.ps1 -ShowConflict
```

## What This Teaches

1. **Worktree = scratch space** — Each agent gets its own copy
2. **Isolation** — Agents don't conflict with each other
3. **Parallel work** — Multiple agents work at the same time
4. **Merge and cleanup** — Combine results and remove scratch space

## The Problem Worktrees Solve

Without worktrees:
```
Agent A edits cart.py line 42
Agent B edits cart.py line 42
Agent B's fix WINS, Agent A's fix is LOST
```

With worktrees:
```
Agent A works in worktree-a/cart.py
Agent B works in worktree-b/cart.py
No conflicts. Merge results when done.
```

## Files

- `src/cart.py` - Buggy codebase (2 bugs)
- `tests/test_cart.py` - Tests that fail
- `progress.md` - The spine (memory between runs)
- `.opencode/skills/parallel-fix/SKILL.md` - Parallel work skill
- `run-parallel.ps1` - Run parallel work with worktrees
- `AGENTS.md` - This rules file
