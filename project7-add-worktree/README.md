# Project 7: Add a Worktree

**What it teaches:** How to run multiple agents in parallel without conflicts using worktrees.

---

## Learning Objectives

- Understand why worktrees are needed for parallel work
- See the write conflict problem without worktrees
- Learn the worktree pattern: create → work → merge → cleanup
- Watch two agents fix different bugs in parallel

---

## The Problem: Write Conflicts

Without worktrees, two agents editing the same file causes conflicts:

```
Time 1: Agent A reads cart.py (line 42)
Time 2: Agent B reads cart.py (same line)
Time 3: Agent A changes line 42 → discount_multiplier = 1 - percent / 100
Time 4: Agent B changes line 42 → discount_multiplier = 0.9
Result: Agent A's fix is GONE. Agent B's fix is there.
```

**This is called a "write conflict" or "race condition."**

---

## The Solution: Worktrees

A worktree is a **temporary directory** where an agent works in isolation.

```
Main project/
├── cart.py (original)

Agent A gets:
├── worktrees/agent-a/
│   └── cart.py (copy for Agent A)

Agent B gets:
├── worktrees/agent-b/
│   └── cart.py (copy for Agent B)

Both work in isolation. No conflicts.
When done, merge results and clean up.
```

---

## What You'll Build

| Component | Description |
|-----------|-------------|
| Buggy Code | Shopping cart with 2 bugs |
| Worktree A | Agent A fixes BUG 1 (apply_discount) |
| Worktree B | Agent B fixes BUG 2 (apply_tax) |
| Merge | Combine both fixes |
| Cleanup | Remove worktrees |

---

## How to Run

### Step 1: Run parallel work

```powershell
.\run-parallel.ps1
```

**What happens:**
1. Creates worktree for Agent A
2. Creates worktree for Agent B
3. Agent A fixes BUG 1 in its worktree
4. Agent B fixes BUG 2 in its worktree
5. Merges both fixes into main source
6. Cleans up worktrees
7. Runs tests to verify

### Step 2: See the conflict (optional)

```powershell
.\run-parallel.ps1 -ShowConflict
```

**What happens:**
- Shows what happens without worktrees
- Agent A and Agent B edit the same line
- Agent B's fix wins, Agent A's fix is lost

---

## The Worktree Pattern

```
1. Create worktree    → Copy source to temp directory
2. Work in isolation  → Agent fixes bug in its worktree
3. Merge results      → Combine fixes from all worktrees
4. Cleanup            → Remove temp directories
```

---

## Why Worktrees Matter

| Without Worktrees | With Worktrees |
|-------------------|----------------|
| Write conflicts | No conflicts |
| Last write wins | All fixes preserved |
| Chaos | Order |
| Sequential (slow) | Parallel (fast) |

---

## Files

| File | Purpose |
|------|---------|
| `src/cart.py` | Buggy codebase (2 bugs) |
| `tests/test_cart.py` | Tests that fail |
| `progress.md` | The spine (memory between runs) |
| `.opencode/skills/parallel-fix/SKILL.md` | Parallel work skill |
| `run-parallel.ps1` | Run parallel work with worktrees |
| `AGENTS.md` | This rules file |

---

## Summary

| Concept | What It Means |
|---------|---------------|
| **Worktree** | Temporary directory for agent work |
| **Isolation** | Agents don't conflict with each other |
| **Parallel work** | Multiple agents work at the same time |
| **Merge** | Combine results from all worktrees |
| **Cleanup** | Remove temp directories after use |
| **Write conflict** | Last write wins, first write is lost |
