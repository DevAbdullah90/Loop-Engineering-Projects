# run-loop.ps1 - Maker-Checker Loop
# This demonstrates the maker-checker pattern for OpenCode

param(
    [int]$MaxAttempts = 3
)

Write-Host "=== Maker-Checker Loop ===" -ForegroundColor Cyan
Write-Host "Implementer drafts fix, reviewer grades it, only PASS opens PR" -ForegroundColor Cyan
Write-Host "Max attempts: $MaxAttempts`n" -ForegroundColor Gray

# Step 1: Maker implements the fix
Write-Host "--- Step 1: Maker implements the fix ---" -ForegroundColor Yellow
opencode run "run the implement-fix skill"

# Step 2: Checker reviews the fix
Write-Host "`n--- Step 2: Checker reviews the fix ---" -ForegroundColor Yellow
$reviewResult = opencode run "review the fix that was just implemented"

# Step 3: Decide based on checker verdict
Write-Host "`n--- Step 3: Decision ---" -ForegroundColor Yellow

if ($reviewResult -match "PASS") {
    Write-Host "REVIEWER: PASS" -ForegroundColor Green
    Write-Host "Fix approved! Ready to open PR." -ForegroundColor Green
    
    # In a real loop, you'd open a PR here:
    # git push origin fix/discount-bug
    # gh pr create --title "fix: discount multiplier" --body "Fixes the off-by-one error"
    
    Write-Host "`nFinal state:" -ForegroundColor Gray
    git log --oneline -3
} else {
    Write-Host "REVIEWER: FAIL" -ForegroundColor Red
    Write-Host "Fix rejected. Adding to 'needs a human' list." -ForegroundColor Red
    
    # In a real loop, you'd write this to progress.md
    Write-Host "`nItem flagged for human review:" -ForegroundColor Red
    Write-Host "  - Discount bug fix was incorrect. Review manually." -ForegroundColor Red
}

Write-Host "`n=== Loop complete ===" -ForegroundColor Cyan
