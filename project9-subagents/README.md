# Project 9: Subagents

**What it teaches:** How to split work across multiple agents, each with its own skill and role.

---

## Learning Objectives

- Understand the subagent pattern (Maker, Reviewer, Tester)
- See why independent verification matters
- Learn the chain of trust: Maker → Tester → Reviewer → Verdict
- Watch three agents coordinate to fix bugs

---

## The Problem: One Agent Does Everything

Without subagents:
```
One agent writes code
One agent reviews code
One agent tests code
Result: Bias, conflicts of interest, bugs slip through
```

**The agent reviewing its own work always says "looks good."**

---

## The Solution: Subagents

With subagents:
```
Maker writes code
Tester runs tests (independent, no bias)
Reviewer reviews code (sees test results)
Verdict: PASS or FAIL
```

**Each agent is an expert at one thing. No conflicts of interest.**

---

## What You'll Build

| Agent | Role | What It Does |
|-------|------|--------------|
| **Maker** | Writes code | Implements the fix |
| **Tester** | Runs tests | Verifies the fix works (independent) |
| **Reviewer** | Reviews code | Grades: PASS/FAIL |

---

## How to Run

### Step 1: Run the full subagent flow

```powershell
.\run-subagents.ps1
```

**What happens:**
1. Tester runs tests independently (no bias)
2. Maker reads test failures and implements fixes
3. Tester runs tests again to verify fixes work
4. Reviewer reviews the code changes
5. Reviewer gives verdict: PASS or FAIL

### Step 2: Run individual skills

```powershell
# Run just the tester
opencode run "run the tester skill"

# Run just the maker
opencode run "run the maker skill"

# Run just the reviewer
opencode run "run the reviewer skill"
```

---

## The Chain of Trust

```
Maker writes code
       ↓
Tester runs tests (independent, no bias)
       ↓
Reviewer reviews the diff (sees test results)
       ↓
Verdict: PASS or FAIL
```

**Why this works:**
- **Tester** has no bias — just runs tests and reports facts
- **Maker** can't cheat — Tester verifies independently
- **Reviewer** sees both test results AND code changes
- **No conflict of interest** — each agent has one job

---

## The Bias Problem

| Agent | Bias Risk | Why |
|-------|-----------|-----|
| **Maker** | High | Wrote the code, wants it to pass |
| **Tester** | **None** | Just runs tests, reports facts |
| **Reviewer** | Medium | Might not run tests, just reads code |

**The tester is the "most honest checker" because it has no bias.**

---

## Files

| File | Purpose |
|------|---------|
| `src/calculator.py` | Buggy calculator (3 bugs) |
| `tests/test_calculator.py` | Tests that fail |
| `.opencode/skills/maker/SKILL.md` | Writes code |
| `.opencode/skills/reviewer/SKILL.md` | Reviews code |
| `.opencode/skills/tester/SKILL.md` | Runs tests |
| `.opencode/skills/subagent-flow/SKILL.md` | Coordinates agents |
| `run-subagents.ps1` | Run the subagent flow |
| `AGENTS.md` | This rules file |

---

## Summary

| Concept | What It Means |
|---------|---------------|
| **Subagent** | Agent that does a specific task |
| **Maker** | Writes code and implements fixes |
| **Tester** | Runs tests independently (no bias) |
| **Reviewer** | Reviews code and gives verdict |
| **Chain of trust** | Maker → Tester → Reviewer → Verdict |
| **Independent verification** | Tester runs tests without bias |
| **No conflict of interest** | Each agent has one job |
