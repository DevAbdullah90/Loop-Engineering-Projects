# Project 1: ISS Watch Loop

**Type:** In-session loop | **Difficulty:** Easy | **Time:** 15 minutes

## What This Demonstrates

The simplest loop type — a timer that fires every minute while the terminal is open.

## Key Learning

- **In-session loop** only runs while you're watching
- **Shell as heartbeat** — `while` loop + `sleep` is the timer
- **Fresh sessions** — each `opencode run` starts with no memory
- **The limitation** — close the terminal and the loop dies

## How to Run

```bash
cd project1-iss-watch
opencode run "run the iss-watch skill"
```

### Loop it manually:

```powershell
while ($true) { 
    opencode run "run the iss-watch skill"
    Start-Sleep -Seconds 60 
}
```

Press `Ctrl+C` to stop.

## The Loop Shape

```
┌─────────────────────────────────────┐
│  Heartbeat: Shell while-loop        │
│  ┌───────────────────────────────┐  │
│  │  Beat: opencode run           │  │
│  │  ├─ Fetch ISS location        │  │
│  │  └─ Display result            │  │
│  └───────────────────────────────┘  │
│  Sleep 60 seconds                   │
│  Repeat                             │
└─────────────────────────────────────┘
```

## Project Structure

```
project1-iss-watch/
├── AGENTS.md                  # Rules file
├── iss-location.py            # Fetches ISS position
├── .opencode/skills/
│   └── iss-watch/
│       └── SKILL.md           # Agent skill definition
└── run-loop.ps1               # Loop script
```

## Test It

1. Run the script: `python iss-location.py`
2. See the ISS position on a map
3. Start the loop
4. Close the terminal — the loop dies
5. That's the concept

## What's Next?

Project 2 shows how to make a loop stop **on its own** when the work is done.
