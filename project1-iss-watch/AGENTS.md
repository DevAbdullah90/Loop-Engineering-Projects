# ISS Watch Loop Project

This project demonstrates an in-session loop using OpenCode.

## Purpose

Show the real-time location of the International Space Station (ISS) on a timer.

## How to Run

```bash
while true; do
  opencode run "run the iss-watch skill"
  sleep 60
done
```

Press `Ctrl+C` to stop.

## Key Concept

This is an **in-session loop**. It only runs while the terminal is open. Close the terminal and the loop stops. This is the simplest heartbeat type.

## Project Structure

- `iss-location.py` - Script that fetches ISS position from the API
- `.opencode/skills/iss-watch/SKILL.md` - Agent skill definition
- `AGENTS.md` - This rules file
