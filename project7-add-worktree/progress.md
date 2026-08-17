# progress.md — The Loop's Memory

## Status
🔄 Loop active — work to be done

## Known Issues
- [ ] BUG 1: apply_discount() multiplies by (percent/100) instead of (1 - percent/100)
- [ ] BUG 2: apply_tax() adds tax_rate instead of multiplying by (1 + tax_rate/100)

## Done
- (none yet)

## Next Action
1. Read this file
2. Run tests to confirm both bugs exist
3. Create worktree for Agent A to fix BUG 1
4. Create worktree for Agent B to fix BUG 2
5. Both agents work in parallel (isolation)
6. Merge results
7. Run tests to confirm both fixes work
8. Update "Done" section
9. Update "Known Issues" to mark as fixed
10. Write this file LAST
