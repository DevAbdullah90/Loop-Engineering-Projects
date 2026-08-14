# Project 3: Scheduled Loop with Memory (Morning Brief)

**Type:** Scheduled loop | **Difficulty:** Medium | **Time:** 45-60 minutes

## What This Demonstrates

A loop that runs on a schedule AND remembers what it did — the **spine** pattern.

## Key Learning

- **The spine** — `progress.md` that survives between runs
- **Read first, write last** — every run reads progress.md, does work, updates it
- **No spine, no loop** — without memory, the loop repeats step 1 forever
- **Scheduled loop** — runs on a timer (simulated here with `Start-Sleep`)

## How to Run

```bash
cd project3-scheduled-loop
.\run-loop.ps1
```

Or manually (run twice to see the spine):

```powershell
# First run — finds all TODOs
opencode run "run the morning-brief skill"

# Wait a minute, then run again
opencode run "run the morning-brief skill"
# → Reports "No new TODOs since last run"
```

## The Loop Shape

```
┌─────────────────────────────────────┐
│  Heartbeat: Clock (every 60 sec)   │
│                                     │
│  1. READ progress.md (spine)        │
│     └─ Know what was already found  │
│                                     │
│  2. FIND work (grep for TODOs)      │
│     └─ Compare with previous list   │
│                                     │
│  3. REPORT new findings             │
│     └─ Only items not in spine      │
│                                     │
│  4. WRITE progress.md (spine)       │
│     └─ Save what was found          │
└─────────────────────────────────────┘
```

## Project Structure

```
project3-scheduled-loop/
├── AGENTS.md                  # Rules file
├── progress.md                # THE SPINE (memory between runs)
├── src/
│   ├── auth.py                # 2 TODOs
│   ├── api/users.py           # 5 TODOs
│   └── utils/helpers.py       # 3 TODOs
├── .opencode/skills/
│   └── morning-brief/
│       └── SKILL.md           # Agent skill definition
└── run-loop.ps1               # Loop script
```

## The Spine

```markdown
# progress.md

## Last Run
- Fri Aug 14 2026

## Findings
- First run: discovered 10 TODOs across 3 files

## TODOs Found
- src/utils/helpers.py:6 TODO: Handle malformed CSV
- src/api/users.py:11 TODO: Add pagination
- src/auth.py:8 TODO: Add salt to password hashing
...
```

## Test It

1. Run once → finds 10 TODOs
2. Run again → reports "No new TODOs since last run"
3. Delete `progress.md` → loop starts from zero again
4. That's the spine working

## What's Next?

Project 4 shows why the **checker** must be a separate agent from the maker.
