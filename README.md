# Loop Engineering Projects

A hands-on learning repository for **Loop Engineering** — the skill of designing systems that prompt AI agents for you.

> "I don't prompt Claude anymore. I have loops running that prompt Claude... my job is to write loops." — Boris Cherny (Claude Code creator)

## What You'll Learn

These seven projects progress from the simplest loop to parallel work:

| Project | Loop Type | Key Concept | Difficulty |
|---------|-----------|-------------|------------|
| [Project 1](project1-iss-watch/) | In-session | Timer heartbeat | Easy |
| [Project 2](project2-conditional-loop/) | Conditional | Command decides "done" | Easy-Medium |
| [Project 3](project3-scheduled-loop/) | Scheduled | Spine (memory) | Medium |
| [Project 4](project4-maker-checker/) | Maker-checker | Two agents, PASS/FAIL | Medium-Hard |
| [Project 5](project5-codify-body/) | Workflow | One command, whole body | Medium |
| [Project 6](project6-add-spine/) | Loop | Heartbeat + Workflow + Spine = Loop | Medium |
| [Project 7](project7-add-worktree/) | Parallel | Worktrees for isolation | Medium-Hard |

## The Six Parts of Every Loop

```
1. Heartbeat    → What starts each run (timer, event, schedule)
2. Worktree     → Isolation for parallel work
3. Skill        → Project knowledge written down once
4. Subagents    → Maker-checker split
5. Connector    → Reach real tools (PRs, tickets, Slack)
6. Spine        → Memory that survives between runs
```

## Quick Start

### Prerequisites

- Python 3.10+
- OpenCode CLI
- Git

### Run Any Project

```bash
cd project1-iss-watch
opencode run "run the <skill-name>"
```

### Run the Full Loop

Each project has a `run-loop.ps1` script:

```powershell
.\run-loop.ps1
```

## Project Structure

```
Loop-Engineering-Projects/
├── project1-iss-watch/          # In-session timer loop
├── project2-conditional-loop/   # Run-until-done pattern
├── project3-scheduled-loop/     # Spine (memory between runs)
├── project4-maker-checker/      # Two-agent safety pattern
├── project5-codify-body/        # Workflow vs loop (one command, whole body)
├── project6-add-spine/          # Loop formula: Heartbeat + Workflow + Spine = Loop
├── project7-add-worktree/       # Parallel work with isolation
└── README.md                    # This file
```

## Key Concepts

### The Heartbeat Menu

| Type | When to Use | Example |
|------|-------------|---------|
| In-session | You're watching | `/loop` with timer |
| Conditional | Task has a clear "done" | "until tests pass" |
| Scheduled | Runs at set times | Daily at 9am |
| Event-driven | Reacts to something | PR opened |

### The Spine Pattern

```markdown
# progress.md — the loop's memory

## Done
- 2026-08-14: fixed flaky test

## In progress
- Dependency audit: 3 of 7 patched

## Open / needs a human
- CVE in image lib — escalating
```

Every run: **read first, write last.**

### Maker-Checker Split

```
Maker (implementer)          Checker (reviewer)
      │                           │
      ├─ Reads the bug            ├─ Runs tests independently
      ├─ Creates branch           ├─ Reads the diff
      ├─ Implements fix           ├─ Grades: PASS or FAIL
      ├─ Runs tests              │
      ├─ Commits fix             │
      │                          │
      └─────── PASS? ────────────┘
                │
                ├─ PASS → Open PR
                └─ FAIL → Flag for human
```

## Tools Used

- **OpenCode** — AI agent CLI (alternative to Claude Code)
- **Python** — Simple scripts for demonstrations
- **pytest** — Test runner (the most honest checker)
- **Git** — Version control and branch isolation

## Learning Path

1. **Start with Project 1** — Watch the ISS loop, close terminal, see it die
2. **Project 2** — See how a command decides "done" instead of a timer
3. **Project 3** — Understand why the spine matters (run twice!)
4. **Project 4** — See why the checker must be separate from the maker
5. **Project 5** — Understand that a workflow is not a loop (no memory = not a loop)
6. **Project 6** — See the loop formula: Heartbeat + Workflow + Spine = Loop
7. **Project 7** — Learn parallel work with worktrees (isolation prevents conflicts)

## Resources

- [Loop Engineering Crash Course](https://agentfactory.panaversity.org/docs/loop-engineering-crash-course)
- [OpenCode Documentation](https://opencode.ai/docs)
- [Addy Osmani: Loop Engineering](https://addyosmani.com/blog/loop-engineering/)

## License

MIT — Use these projects to learn loop engineering.
