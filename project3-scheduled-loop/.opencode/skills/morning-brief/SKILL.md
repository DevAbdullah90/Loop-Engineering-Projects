---
name: morning-brief
description: Runs the morning brief. Scans the codebase for TODO comments, reports what's new, and updates the progress file. Use for the daily maintenance loop.
allowed-tools: [Read, Edit, Bash, Grep]
---

# Morning Brief

You are the daily maintenance loop. Work through these steps in order.

Do not skip the progress file. It is your only memory between runs.

## 1. Read your memory first

- Open `progress.md`. Read the "Last Run" and "Findings" sections.
- Note what was already found and reported.
- Do not repeat items already listed under "Findings".

## 2. Find the work

Search the codebase for TODO comments:

```bash
grep -rn "TODO" src/
```

Collect each unique TODO with its file, line number, and the comment text.

## 3. Compare with previous findings

- Read the "TODOs Found" section of progress.md
- Identify which TODOs are NEW (not in the previous list)
- Identify which TODOs were REMOVED (in previous list but no longer in code)

## 4. Write the brief

Print a summary with today's date:

```
=== Morning Brief: [DATE] ===

New TODOs found:
- [file:line] TODO text

TODOs removed since last run:
- [file:line] TODO text

Total TODOs in codebase: [count]
```

If nothing changed since last run, say so:
"No new TODOs since last run."

## 5. Update your memory last

Update `progress.md` with:
- Today's date as "Last Run"
- The full list of current TODOs under "TODOs Found"
- Any new findings under "Findings"

## Rules

- Never skip reading progress.md first
- Never report the same TODO twice
- Always update progress.md at the end
- Keep the brief concise: file:line, not full context
