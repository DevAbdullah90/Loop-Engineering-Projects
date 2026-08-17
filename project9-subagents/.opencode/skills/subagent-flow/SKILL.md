# Subagent Flow

## What This Does
Coordinates three subagents: Maker, Reviewer, and Tester.

## Flow
1. Tester runs tests independently
2. Maker reads test failures and implements fixes
3. Tester runs tests again to verify fixes
4. Reviewer reviews the code changes
5. Reviewer gives verdict: PASS or FAIL

## Rules
- Tester runs first (independent verification)
- Maker implements fixes (based on test results)
- Tester runs again (verifies fixes work)
- Reviewer reviews (sees test results + code changes)
- Reviewer gives final verdict
