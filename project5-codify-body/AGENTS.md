# Project 5: Codify the Body

This project demonstrates the difference between a **workflow** and a **loop**.

## Key Concept

A **workflow** runs once and forgets everything.
A **loop** runs repeatedly and remembers.

## How to Run

```bash
# Run the workflow once
opencode run "run the full-fix-workflow skill"

# Prove it's not a loop - runs the workflow twice
.\run-workflow.ps1 -ProveForgetfulness
```

## What This Teaches

1. **One command = whole body**: The workflow runs maker, checker, and decision in one command
2. **No memory**: The workflow doesn't remember what it did last time
3. **Not a loop**: A loop needs a heartbeat (timer) and spine (memory)
4. **Dynamic workflow**: Runs once, then forgets everything

## The Difference

| Component | Workflow | Loop |
|-----------|----------|------|
| Runs | Once | Repeatedly |
| Remembers | No | Yes (spine) |
| Starts itself | No | Yes (heartbeat) |
| Purpose | Do a task | Do a task repeatedly |

## Learning Objectives

- Understand the difference between workflows and loops
- See that a workflow has no memory between runs
- Know what makes a loop: heartbeat + spine
- Recognize that a workflow is just the body of a loop

## Files

- `src/cart.py` - Buggy shopping cart
- `tests/test_cart.py` - Tests that fail (demonstrating the bug)
- `.opencode/skills/full-fix-workflow/SKILL.md` - One command, whole body
- `.opencode/agents/reviewer.md` - Checker agent
- `run-workflow.ps1` - Run the workflow and prove it forgets
- `AGENTS.md` - This rules file
