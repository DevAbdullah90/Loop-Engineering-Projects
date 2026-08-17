# Project 9: Subagents

This project demonstrates the **subagent pattern** — splitting work across multiple agents.

## Key Concept

Subagents are agents that do specific tasks:
- **Maker**: Writes code and implements fixes
- **Reviewer**: Reviews code changes and gives verdict
- **Tester**: Runs tests independently (no bias)

## How to Run

```powershell
# Run the full subagent flow
.\run-subagents.ps1

# Run individual skills
opencode run "run the tester skill"
opencode run "run the maker skill"
opencode run "run the reviewer skill"
```

## What This Teaches

1. **Independent verification** — Tester runs tests without bias
2. **Separation of duties** — Each agent has a specific role
3. **Chain of trust** — Maker → Tester → Reviewer → Verdict
4. **No conflict of interest** — Tester doesn't care who wrote the code

## Files

- `src/calculator.py` - Buggy calculator (3 bugs)
- `tests/test_calculator.py` - Tests that fail
- `.opencode/skills/maker/SKILL.md` - Writes code
- `.opencode/skills/reviewer/SKILL.md` - Reviews code
- `.opencode/skills/tester/SKILL.md` - Runs tests
- `.opencode/skills/subagent-flow/SKILL.md` - Coordinates agents
- `run-subagents.ps1` - Run the subagent flow
- `AGENTS.md` - This rules file
