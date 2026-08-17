# Parallel Fix

## What This Does
This skill demonstrates parallel work with worktrees.
Two agents work in isolation on different bugs, then results are merged.

## Instructions
1. Read progress.md to see what bugs need fixing
2. Create worktree for Agent A (fix BUG 1)
3. Create worktree for Agent B (fix BUG 2)
4. Both agents work in parallel (isolation)
5. Merge results into main source
6. Run tests to verify both fixes work
7. Update progress.md
8. Clean up worktrees

## Rules
- Always create worktrees before parallel work
- Each agent works in its own worktree
- Never edit the same file from two agents
- Merge results after work is done
- Clean up worktrees after merging
