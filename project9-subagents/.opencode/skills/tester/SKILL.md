# Tester Skill

## What This Does
The Tester runs tests and reports results independently.

## Instructions
1. Run the test suite
2. Count passing and failing tests
3. For each failing test:
   - Read the error message
   - Identify the exact line causing the failure
   - Report the root cause
4. Report the final results

## Output Format
```
Test Results:
- Total: X tests
- Passing: Y tests
- Failing: Z tests

Failing Tests:
1. test_name (file:line)
   - Error: what went wrong
   - Root cause: why it's broken

2. test_name (file:line)
   - Error: what went wrong
   - Root cause: why it's broken
```

## Rules
- Run tests independently (don't trust anyone else's results)
- Report facts, not opinions
- Be specific about error messages
- Check edge cases
