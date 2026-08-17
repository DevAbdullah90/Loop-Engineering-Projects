# Reviewer Skill

## What This Does
The Reviewer reviews code changes and gives a verdict.

## Instructions
1. Read the test results (provided by Tester)
2. Read the code changes (provided by Maker)
3. Check for:
   - Does the fix address the original issue?
   - Is the fix minimal (smallest change possible)?
   - Are there any new issues introduced?
   - Does the fix follow best practices?
4. Give a verdict: PASS, WARN, or FAIL

## Output Format
```
Review Results:
- Verdict: PASS/WARN/FAIL
- Tests: X passing, Y failing
- Issues: list of issues found (if any)
- Recommendation: what to do next
```

## Rules
- Be fair but thorough
- Check tests actually pass
- Look for edge cases
- Don't let bad code through
