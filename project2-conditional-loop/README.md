# Project 2: Conditional Loop (Fix Tests Until Pass)

**Type:** Conditional loop | **Difficulty:** Easy-Medium | **Time:** 30-45 minutes

## What This Demonstrates

A loop that stops when a **command** proves the work is done — not when you manually stop it.

## Key Learning

- **Conditional loop** — stops because the work is complete
- **Command as checker** — pytest decides "done", not the agent
- **Cap on tries** — max attempts to prevent runaway costs
- **No memory** — each run starts fresh

## How to Run

```bash
cd project2-conditional-loop
.\run-loop.ps1
```

Or manually:

```powershell
for ($i = 1; $i -le 8; $i++) {
    opencode run "run the fix-tests skill"
    $result = python -m pytest tests/test_calculator.py -v 2>&1 | Select-String "passed"
    if ($result) {
        Write-Host "All tests passed on try $i!"
        break
    }
}
```

## The Loop Shape

```
┌─────────────────────────────────────┐
│  Heartbeat: Command (pytest)        │
│  ┌───────────────────────────────┐  │
│  │  Beat: opencode run           │  │
│  │  ├─ Read failing tests        │  │
│  │  ├─ Fix bugs in calculator    │  │
│  │  └─ Run tests again           │  │
│  └───────────────────────────────┘  │
│  Check: pytest exit code            │
│  ├─ PASS → break                    │
│  └─ FAIL → retry (up to 8)         │
└─────────────────────────────────────┘
```

## Project Structure

```
project2-conditional-loop/
├── AGENTS.md                  # Rules file
├── src/calculator.py          # Module with 3 intentional bugs
├── tests/test_calculator.py   # Tests (3 fail, 4 pass)
├── .opencode/skills/
│   └── fix-tests/
│       └── SKILL.md           # Agent skill definition
└── run-loop.ps1               # Loop script
```

## The Bugs

The calculator has 3 bugs in `src/calculator.py`:
- `subtract()` uses `+` instead of `-`
- `multiply()` uses `+` instead of `*`
- `modulus()` uses `/` instead of `%`

## Test It

1. Run tests: `python -m pytest tests/ -v` (3 fail)
2. Start the loop
3. Watch the agent fix all 3 bugs
4. Tests pass → loop stops automatically

## What's Next?

Project 3 shows how to add **memory** between runs.
