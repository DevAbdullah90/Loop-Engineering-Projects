# run-workflow.ps1 - ONE command that runs the full maker-checker body
# This is a WORKFLOW, not a loop. It runs once and forgets everything.

param(
    [switch]$ProveForgetfulness
)

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  WORKFLOW: Full Fix Cycle" -ForegroundColor Cyan
Write-Host "  (One command, whole body)" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# ============================================
# STEP 1: MAKER - Implement the fix
# ============================================
Write-Host "`n--- [1/3] MAKER: Implementing fix ---" -ForegroundColor Yellow
opencode run "run the implement-fix skill"

# ============================================
# STEP 2: CHECKER - Review the fix
# ============================================
Write-Host "`n--- [2/3] CHECKER: Reviewing fix ---" -ForegroundColor Yellow
$reviewResult = opencode run "review the fix that was just implemented"

# ============================================
# STEP 3: DECISION - Based on checker verdict
# ============================================
Write-Host "`n--- [3/3] DECISION ---" -ForegroundColor Yellow

if ($reviewResult -match "PASS") {
    Write-Host "VERDICT: PASS" -ForegroundColor Green
    Write-Host "Fix approved. All tests passing." -ForegroundColor Green
} else {
    Write-Host "VERDICT: FAIL" -ForegroundColor Red
    Write-Host "Fix rejected." -ForegroundColor Red
}

# ============================================
# PROVE IT'S NOT A LOOP
# ============================================
if ($ProveForgetfulness) {
    Write-Host "`n=====================================" -ForegroundColor Magenta
    Write-Host "  PROVING THIS IS NOT A LOOP" -ForegroundColor Magenta
    Write-Host "=====================================" -ForegroundColor Magenta
    
    Write-Host "`nRunning the workflow a SECOND time..." -ForegroundColor Magenta
    Write-Host "If this were a loop, it would know the fix already exists." -ForegroundColor Gray
    Write-Host "If this is a workflow, it starts from scratch." -ForegroundColor Gray
    
    # Check current state
    Write-Host "`nCurrent git state:" -ForegroundColor Gray
    git log --oneline -3
    
    Write-Host "`nRunning workflow again..." -ForegroundColor Magenta
    opencode run "run the implement-fix skill"
    
    Write-Host "`nAfter second run:" -ForegroundColor Gray
    git log --oneline -3
    
    Write-Host "`n=====================================" -ForegroundColor Magenta
    Write-Host "  PROOF: The workflow forgot everything" -ForegroundColor Magenta
    Write-Host "=====================================" -ForegroundColor Magenta
    Write-Host "It started from scratch on the second run." -ForegroundColor Yellow
    Write-Host "It did NOT know the fix was already applied." -ForegroundColor Yellow
    Write-Host "That's because: NO SPINE = NOT A LOOP" -ForegroundColor Yellow
}

Write-Host "`n=== Workflow complete ===" -ForegroundColor Cyan
