# Project 5: Codify the Body

**What it teaches:** How to turn a step-by-step orchestration into one re-runnable command, and prove that workflow alone is not a loop.

---

## Learning Objectives

- Understand the difference between a **workflow** and a **loop**
- See that a workflow has **no memory** between runs
- Know what makes a loop: **heartbeat + spine**
- Recognize that a workflow is just the **body** of a loop

---

## The Key Insight

> A workflow is the **engine**, not the **car**.
> The loop is the car: a heartbeat turns the key, the workflow is the engine that runs, and a progress file carries information to the next trip.

---

## What You'll Build

| Component | Description |
|-----------|-------------|
| Buggy Code | Shopping cart with discount bug |
| Workflow | One command that runs: find → fix → review → verdict |
| Proof | Run it twice and see it forget everything |

---

## How to Run

### Step 1: Run the workflow once

```powershell
opencode run "run the full-fix-workflow skill"
```

**What happens:**
1. Maker runs tests → finds failing test
2. Maker reads error → finds bug in `apply_discount()`
3. Maker implements fix
4. Checker reviews fix
5. Checker gives PASS verdict

### Step 2: Run it again and see it forget

```powershell
opencode run "run the full-fix-workflow skill"
```

**What happens:**
1. Maker runs tests → finds... wait, the fix is already there!
2. But the workflow doesn't know that
3. It starts from scratch anyway
4. That's the proof: **no memory = not a loop**

### Step 3: Use the PowerShell script

```powershell
# Run the workflow and prove it forgets
.\run-workflow.ps1 -ProveForgetfulness
```

---

## Workflow vs Loop

| Component | Workflow | Loop |
|-----------|----------|------|
| **Runs** | Once | Repeatedly |
| **Remembers** | No | Yes (spine) |
| **Starts itself** | No | Yes (heartbeat) |
| **Purpose** | Do a task | Do a task repeatedly |

---

## What's Missing for a Real Loop

| Missing Component | What It Does |
|-------------------|--------------|
| **Heartbeat** | Timer that starts the workflow automatically |
| **Spine** | File that carries memory between runs |

### The Analogy

Think of a **workflow** as a **car engine**:
- It can run
- It does work
- But it doesn't go anywhere by itself

A **loop** is the **whole car**:
- Heartbeat = key that turns the engine on
- Workflow = engine that runs
- Spine = dashboard that remembers speed, fuel, destination

---

## Files

| File | Purpose |
|------|---------|
| `src/cart.py` | Buggy shopping cart (same as Project 4) |
| `tests/test_cart.py` | Tests that fail |
| `.opencode/skills/full-fix-workflow/SKILL.md` | One command, whole body |
| `.opencode/skills/implement-fix/SKILL.md` | Maker skill |
| `.opencode/agents/reviewer.md` | Checker agent |
| `run-workflow.ps1` | Run the workflow and prove it forgets |
| `AGENTS.md` | This rules file |

---

## The Bug (Same as Project 4)

In `src/cart.py`, the `apply_discount()` function has an off-by-one error:

```python
# BUG: Should be (1 - percent / 100), not (percent / 100)
discount_multiplier = percent / 100
```

A 10% discount should multiply by 0.9, but it multiplies by 0.1.

---

## What You Learn

1. **Workflow ≠ Loop**: A workflow runs once and forgets; a loop runs repeatedly and remembers
2. **One command = whole body**: The workflow runs the entire maker-checker flow in one command
3. **No spine = no memory**: Without a progress file, the workflow can't know what happened before
4. **No heartbeat = manual**: Without a timer, the workflow doesn't start on its own

---

## Summary

| Concept | What It Means |
|---------|---------------|
| **Dynamic workflow** | One command runs the whole body |
| **Workflow ≠ loop** | Workflow runs once, then forgets everything |
| **No spine** | Workflow has no memory between runs |
| **No heartbeat** | Workflow doesn't start on its own |
| **Engine vs car** | Workflow is the engine; loop is the car |
