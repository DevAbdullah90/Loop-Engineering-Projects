# Project 4: Fix Loop with Real Checker (Maker-Checker)

**Type:** Maker-checker | **Difficulty:** Medium-Hard | **Time:** 45-60 minutes

## What This Demonstrates

The most important safety pattern — **two agents**: one writes the code, one grades it.

## Key Learning

- **Maker-checker split** — agent that writes code must NOT approve it
- **Read-only reviewer** — checker cannot edit files, only read and run tests
- **Independent verification** — checker runs tests itself, doesn't trust the maker
- **PASS/FAIL verdict** — clear output the loop can act on
- **Branch isolation** — fix happens on `fix/discount-bug` branch

## How to Run

```bash
cd project4-maker-checker
.\run-loop.ps1
```

Or run each step manually:

```powershell
# Step 1: Maker implements the fix
opencode run "run the implement-fix skill"

# Step 2: Checker reviews the fix
opencode run "review the fix that was just implemented"
```

## The Loop Shape

```
┌─────────────────────────────────────┐
│                                     │
│  MAKER (implementer)                │
│  ├─ Reads the bug                   │
│  ├─ Creates branch                  │
│  ├─ Implements fix                  │
│  ├─ Runs tests                      │
│  └─ Commits fix                     │
│                                     │
│  CHECKER (reviewer)                 │
│  ├─ Runs tests independently        │
│  ├─ Reads the diff                  │
│  └─ Grades: PASS or FAIL            │
│                                     │
│  DECISION                           │
│  ├─ PASS → Open PR                  │
│  └─ FAIL → Flag for human           │
│                                     │
└─────────────────────────────────────┘
```

## Project Structure

```
project4-maker-checker/
├── AGENTS.md                      # Rules file
├── src/cart.py                    # Shopping cart with discount bug
├── tests/test_cart.py             # Tests (2 fail until bug is fixed)
├── .opencode/
│   ├── skills/implement-fix/
│   │   └── SKILL.md               # Maker skill
│   └── agents/
│       └── reviewer.md            # Checker agent (read-only)
└── run-loop.ps1                   # Maker-checker loop script
```

## The Bug

The `apply_discount()` method has an off-by-one error:
- **Bug:** `discount_multiplier = percent / 100` (gives 0.1 for 10%)
- **Fix:** `discount_multiplier = 1 - percent / 100` (gives 0.9 for 10%)

## The Checker Agent

```markdown
You are a strict, read-only code reviewer. You never edit files.

Reply with EXACTLY one of:
PASS — followed by one line saying what you verified.
FAIL — followed by the specific reasons, one per line.

A change that only "looks fine" is not a PASS. 
The tests must actually pass.
```

## Test It

1. Run tests: `python -m pytest tests/ -v` (2 fail)
2. Run the maker: implements fix, all tests pass
3. Run the checker: grades PASS
4. Notice: checker ran tests itself, didn't trust the maker

## Why Two Agents?

> "A model that checks its own output often approves it too easily."

The maker might say "Done! All fixed." without actually running tests. The checker is a separate agent that:
- Has different instructions
- Can use a different (cheaper) model
- Is read-only (can't change the code to make tests pass)
- Runs tests independently

## What's Next?

This completes the core loop patterns. You now have:
- Timer loops (Project 1)
- Conditional loops (Project 2)
- Memory/spine (Project 3)
- Maker-checker safety (Project 4)
