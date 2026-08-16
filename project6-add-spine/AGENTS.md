# Project 6: Add a Spine

This project demonstrates how **Heartbeat + Workflow + Spine = Loop**.

## Key Concept

A loop needs three things:
1. **Heartbeat** — what starts each run (timer, schedule, event)
2. **Workflow** — what does the work (read → check → work → write)
3. **Spine** — what carries memory (progress.md)

## How to Run

```powershell
# Run the loop (5 beats, 30 seconds apart)
.\run-loop.ps1

# Run with custom settings
.\run-loop.ps1 -MaxBeats 10 -IntervalSeconds 15
```

## What This Teaches

1. **Read first, write last** — The spine must be read at the start and written at the end
2. **Loop stops when done** — The agent checks the spine and stops if no work is needed
3. **Memory between runs** — The spine carries what happened in previous runs
4. **Crash safety** — Writing last means a crash doesn't corrupt the spine

## The Formula

```
Heartbeat (timer) + Workflow (loop-body) + Spine (progress.md) = Loop
```

## Files

- `src/cart.py` - Buggy shopping cart
- `tests/test_cart.py` - Tests that fail
- `progress.md` - The spine (memory between runs)
- `.opencode/skills/loop-body/SKILL.md` - The workflow (read → check → work → write)
- `run-loop.ps1` - The heartbeat (timer that starts each run)
- `AGENTS.md` - This rules file
