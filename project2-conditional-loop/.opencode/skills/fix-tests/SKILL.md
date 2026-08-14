---
name: fix-tests
description: Fixes failing tests in the calculator module. Use when tests are failing.
allowed-tools: [Read, Edit, Bash]
---

# Fix Tests

Fix the failing tests in the calculator module.

## Steps

1. Run the tests to see what's failing:
   ```bash
   python -m pytest tests/test_calculator.py -v
   ```

2. Read the calculator module at `src/calculator.py`

3. Read the failing test output to understand what's wrong

4. Fix the bugs in `src/calculator.py` - do NOT change the tests

5. Run the tests again to verify all pass:
   ```bash
   python -m pytest tests/test_calculator.py -v
   ```

## Rules

- Only fix `src/calculator.py`, never the tests
- Make the smallest change that fixes each bug
- Keep all existing function signatures unchanged
