# Project 6: Add a Spine

**What it teaches:** How to turn a one-shot workflow into a real loop by adding a spine (memory).

---

## Learning Objectives

- Understand the loop formula: **Heartbeat + Workflow + Spine = Loop**
- See that a loop without a spine is just a repeated workflow
- Learn the "read first, write last" pattern
- Watch a loop stop when there's nothing to do

---

## The Loop Formula

```
Heartbeat (timer) + Workflow (loop-body) + Spine (progress.md) = Loop
```

| Component | What It Does | Example |
|-----------|--------------|---------|
| **Heartbeat** | Starts each run | Timer every 30 seconds |
| **Workflow** | Does the work | Read → check → work → write |
| **Spine** | Carries memory | progress.md |

---

## What You'll Build

| Component | Description |
|-----------|-------------|
| Buggy Code | Shopping cart with discount bug |
| Spine | progress.md that tracks what's fixed |
| Workflow | One command that reads spine, does work, writes spine |
| Heartbeat | Timer that runs the workflow repeatedly |

---

## How to Run

### Step 1: Run the loop

```powershell
.\run-loop.ps1
```

**What happens:**
1. Timer starts (heartbeat)
2. Agent reads progress.md (spine)
3. Agent sees open issues
4. Agent fixes the bug (workflow)
5. Agent updates progress.md (write last)
6. Timer waits, then runs again

### Step 2: Watch it stop

After the bug is fixed, the loop will:
1. Read progress.md
2. See all issues are marked as done
3. **Stop** — no more work to do

---

## The "Read First, Write Last" Pattern

| Step | What Happens | Why |
|------|--------------|-----|
| **1. Read first** | Agent reads progress.md | Knows what happened before |
| **2. Do work** | Agent fixes bug | Makes changes |
| **3. Write last** | Agent updates progress.md | Records what happened this run |

**Why write last?**
- If agent crashes mid-run, progress.md still has the old state
- Next run sees work needs to be done and does it again
- **No data corruption** — crash safe

---

## What Happens When the Loop Runs

### Beat 1 (First Run)

```
progress.md says: [ ] BUG: apply_discount() is broken
Agent runs tests → finds bug
Agent fixes bug
Agent updates progress.md → [x] BUG: apply_discount() is fixed
Agent writes progress.md LAST
```

### Beat 2 (Second Run)

```
progress.md says: [x] BUG: apply_discount() is fixed
Agent reads progress.md → sees all issues fixed
Agent says: "Nothing to do"
Agent STOPS
```

---

## The Key Insight

> A loop isn't just "run forever." A loop is "run until the work is done, then stop." The spine tells the agent what's left to do.

---

## Files

| File | Purpose |
|------|---------|
| `src/cart.py` | Buggy shopping cart |
| `tests/test_cart.py` | Tests that fail |
| `progress.md` | The spine (memory between runs) |
| `.opencode/skills/loop-body/SKILL.md` | The workflow (read → check → work → write) |
| `run-loop.ps1` | The heartbeat (timer) |
| `AGENTS.md` | This rules file |

---

## Summary

| Concept | What It Means |
|---------|---------------|
| **Heartbeat** | What starts each run (timer, schedule, event) |
| **Workflow** | What does the work (read → check → work → write) |
| **Spine** | What carries memory (progress.md) |
| **Read first** | Know what happened before |
| **Write last** | Record what happened this run |
| **Crash safe** | Writing last prevents data corruption |
| **Loop stops** | When spine says no work is done |
