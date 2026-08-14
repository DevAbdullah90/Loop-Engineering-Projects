---
name: implement-fix
description: Implements a fix for a failing test. Creates a branch, makes the fix, and runs tests. Use when you need to fix a bug.
allowed-tools: [Read, Edit, Bash]
---

# Implement Fix

You are the maker. Your job is to fix the bug, not to approve the fix.

## Steps

1. Run the tests to understand what's failing:
   ```bash
   python -m pytest tests/ -v
   ```

2. Read the failing test output to understand what's expected

3. Read the source file with the bug (`src/cart.py`)

4. Create a new branch for the fix:
   ```bash
   git checkout -b fix/discount-bug
   ```

5. Fix the bug in `src/cart.py` — make the smallest change possible

6. Run the tests to verify your fix works:
   ```bash
   python -m pytest tests/ -v
   ```

7. If all tests pass, commit the fix:
   ```bash
   git add -A
   git commit -m "fix: correct discount multiplier calculation"
   ```

## Rules

- Only fix the bug, do not change anything else
- Make the smallest change that fixes the problem
- Run tests before and after your fix
- If tests still fail after your fix, uncommit and report what you tried
