# Loop Body

## What This Does
This is the body of a loop. It follows the spine pattern:
1. READ progress.md FIRST (memory from last run)
2. Check if work is needed
3. If work is done → STOP
4. If work is needed → Do the work
5. WRITE progress.md LAST (update memory for next run)

## Instructions
1. Read progress.md
2. Check the "Known Issues" section
3. If all issues are marked as done, report "Nothing to do" and STOP
4. If there are open issues, run tests to confirm the bug exists
5. Fix the bug
6. Run tests to confirm fix works
7. Update progress.md:
   - Move the issue from "Known Issues" to "Done"
   - Mark it as [x] in "Known Issues"
   - Add what you did in "Done" section
8. Write progress.md LAST (after all work is done)

## Rules
- ALWAYS read progress.md FIRST
- ALWAYS write progress.md LAST
- If no work is needed, STOP immediately
- Never skip reading progress.md
