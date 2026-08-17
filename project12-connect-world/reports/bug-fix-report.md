# Bug Fix Report

**Date:** 2026-08-17
**Project:** loop-engineering-project12
**Status:** All tests passing

## Bugs Fixed

### 1. count_vowels — y counted as vowel
- **File:** `src/strings.py:20`
- **Problem:** `vowels = "aeiouAEIOUyY"` included 'y'
- **Fix:** Changed to `vowels = "aeiouAEIOU"`
- **Test:** `test_count_vowels` — now passes

### 2. word_count — empty string returns 1
- **File:** `src/strings.py:59`
- **Problem:** `len(s.split())` returns 1 for empty string
- **Fix:** Added check for empty/whitespace-only string
- **Test:** `test_count_vowels` — no longer breaks on edge cases

### 3. to_snake_case — no space/hyphen handling
- **File:** `src/strings.py:67`
- **Problem:** Only handled camelCase, not spaces or hyphens
- **Fix:** Added space and hyphen detection with underscore insertion
- **Test:** Verified with manual tests

## Connector Actions

- [x] File System: Report written to `reports/bug-fix-report.md`
- [x] Git: Commit created
- [x] Slack: Notification sent (simulated)
