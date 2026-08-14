# Project 2: Conditional Loop (Run-Until-Done)

This project demonstrates a conditional loop using OpenCode.

## Purpose

Fix failing tests until they pass, then stop automatically.

## How to Run

```bash
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
    Write-Host "Tests still failing, try $i of 8"
}
```

Press `Ctrl+C` to stop early.

## Key Concept

This is a **conditional loop**. The loop stops when a **command** (pytest) proves the work is done — not when a timer expires or you manually stop it.

## Project Structure

- `src/calculator.py` - Module with intentional bugs
- `tests/test_calculator.py` - Tests that fail until bugs are fixed
- `.opencode/skills/fix-tests/SKILL.md` - Agent skill definition
- `run-loop.ps1` - The loop script
- `AGENTS.md` - This rules file
