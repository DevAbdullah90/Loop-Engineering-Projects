# run-loop.ps1 - Conditional loop that stops when tests pass
# This is the "run-until-done" pattern for OpenCode

$maxTries = 8
$passed = $false

for ($i = 1; $i -le $maxTries; $i++) {
    Write-Host "`n--- Try $i of $maxTries ---" -ForegroundColor Cyan
    
    # Run the agent to fix tests
    opencode run "run the fix-tests skill"
    
    # Check if tests pass (the command decides "done", not the agent)
    $testOutput = python -m pytest tests/test_calculator.py -v 2>&1
    $testOutput | Write-Host
    
    if ($testOutput -match "8 passed") {
        Write-Host "`nAll tests passed on try $i!" -ForegroundColor Green
        $passed = $true
        break
    }
    
    Write-Host "`nTests still failing. Retrying..." -ForegroundColor Yellow
}

if (-not $passed) {
    Write-Host "`nHit max tries ($maxTries). Tests still failing." -ForegroundColor Red
    Write-Host "Check what the agent tried in its output above."
}
