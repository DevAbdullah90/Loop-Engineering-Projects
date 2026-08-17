# Project 12: Connect to the World

**What it teaches:** How to connect your loop to the real world — file system, GitHub, Slack, and APIs.

---

## Learning Objectives

- Understand what connectors are and why they matter
- See the difference between read and write connectors
- Learn the connector safety hierarchy
- Watch a loop connect to multiple real-world tools

---

## The Problem: Loop Works in Terminal Only

Without connectors:
```
Loop runs in terminal
Agent fixes bugs
Agent reports results in terminal
Result: Nothing happens in the real world
```

**The loop is useful, but it doesn't do anything outside the terminal.**

---

## The Solution: Connectors

With connectors:
```
Loop runs
Agent fixes bugs
Connector writes report to file system
Connector creates git commit
Connector sends Slack notification
Result: Real world sees the changes
```

**Now the loop is useful in the real world.**

---

## What You'll Build

| Component | Description |
|-----------|-------------|
| Buggy Code | String utilities with 3 bugs |
| File System Connector | Write reports to files |
| Git Connector | Create commits with changes |
| Slack Connector | Send notifications (simulated) |

---

## How to Run

### Step 1: Run the fix-and-connect loop

```powershell
opencode run "run the fix-and-connect skill"
```

**What happens:**
1. Agent reads progress.md (spine)
2. Agent runs tests to find bugs
3. Agent fixes the bugs
4. Agent runs tests to verify fixes
5. **Agent writes report to reports/ directory** (file system connector)
6. **Agent creates git commit** (git connector)
7. **Agent sends Slack notification** (slack connector)
8. Agent updates progress.md

### Step 2: Check the outputs

```powershell
# List reports
Get-ChildItem reports/

# Check git log
git log --oneline -3

# Check Slack notification
Get-Content reports/slack-notification.md
```

---

## The Connector Safety Hierarchy

```
Safest → Most Dangerous

File System Write → Slack Message → GitHub PR → Database Write
     Low              Low            Medium         High
```

| Connector | Risk | Safeguard |
|-----------|------|-----------|
| **File System Write** | Low | Can undo, not production |
| **Slack Message** | Low | Just a message, no data loss |
| **GitHub PR** | Medium | Requires review before merge |
| **Database Write** | High | Need approval, logging, rollback |

---

## Files

| File | Purpose |
|------|---------|
| `src/strings.py` | Buggy codebase (3 bugs) |
| `tests/test_strings.py` | Tests that fail |
| `.opencode/skills/fix-and-connect/SKILL.md` | Fix bugs + connect to world |
| `reports/` | Where reports are written (connector output) |
| `AGENTS.md` | This rules file |

---

## Summary

| Concept | What It Means |
|---------|---------------|
| **Connector** | Bridge between agent and real world |
| **Read connector** | Safe, can't harm anything |
| **Write connector** | Dangerous, needs safeguards |
| **File system** | Simplest connector (no auth needed) |
| **GitHub** | Open PRs, commit code |
| **Slack** | Send messages, notifications |
| **Database** | Most dangerous, needs approval |
