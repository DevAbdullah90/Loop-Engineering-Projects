# Fix and Connect

## What This Does
Fixes bugs and connects to the real world (file system, GitHub, Slack).

## Flow
1. Run tests to find failing tests
2. Fix the bugs in the source code
3. Run tests again to verify fixes work
4. Connect to the real world:
   - Write report to reports/ directory (file system)
   - Create git commit (GitHub)
   - Send notification message (Slack simulation)

## Connectors Used
1. **File System** — Write report to reports/ directory
2. **Git** — Create commit with changes
3. **Slack** — Send notification (simulated with file)

## Rules
- Always run tests first
- Fix bugs, don't change tests
- Use connectors AFTER fixes are verified
- Log all connector actions
