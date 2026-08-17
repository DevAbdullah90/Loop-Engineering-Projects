# run-subagents.ps1 - Coordinates three subagents: Maker, Reviewer, Tester
# This demonstrates the subagent pattern

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  SUBAGENT FLOW" -ForegroundColor Cyan
Write-Host "  Maker → Reviewer → Tester" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# ============================================
# STEP 1: Tester runs tests independently
# ============================================
Write-Host "`n--- [1/4] TESTER: Running tests ---" -ForegroundColor Yellow
Write-Host "Tester runs tests independently (no bias)" -ForegroundColor Gray

$testResult = opencode run "run the tester skill"

# ============================================
# STEP 2: Maker implements fixes
# ============================================
Write-Host "`n--- [2/4] MAKER: Implementing fixes ---" -ForegroundColor Yellow
Write-Host "Maker reads test failures and implements fixes" -ForegroundColor Gray

$makerResult = opencode run "run the maker skill"

# ============================================
# STEP 3: Tester runs tests again
# ============================================
Write-Host "`n--- [3/4] TESTER: Verifying fixes ---" -ForegroundColor Yellow
Write-Host "Tester runs tests again to verify fixes work" -ForegroundColor Gray

$verifyResult = opencode run "run the tester skill"

# ============================================
# STEP 4: Reviewer reviews code changes
# ============================================
Write-Host "`n--- [4/4] REVIEWER: Reviewing changes ---" -ForegroundColor Yellow
Write-Host "Reviewer reviews test results + code changes" -ForegroundColor Gray

$reviewResult = opencode run "run the reviewer skill"

# ============================================
# VERDICT
# ============================================
Write-Host "`n=====================================" -ForegroundColor Cyan
Write-Host "  FINAL VERDICT" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

if ($reviewResult -match "PASS") {
    Write-Host "VERDICT: PASS" -ForegroundColor Green
    Write-Host "All tests pass, code reviewed, no issues found." -ForegroundColor Green
} elseif ($reviewResult -match "WARN") {
    Write-Host "VERDICT: WARN" -ForegroundColor Yellow
    Write-Host "Tests pass but there are warnings." -ForegroundColor Yellow
} else {
    Write-Host "VERDICT: FAIL" -ForegroundColor Red
    Write-Host "Tests fail or code review found issues." -ForegroundColor Red
}

Write-Host "`n=====================================" -ForegroundColor Cyan
Write-Host "  SUBAGENT FLOW COMPLETE" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
