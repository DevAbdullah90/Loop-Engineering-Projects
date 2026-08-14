# run-loop.ps1 - Scheduled loop with memory (the spine)
# This demonstrates the "morning brief" pattern for OpenCode

param(
    [int]$MaxRuns = 5,
    [int]$IntervalSeconds = 60
)

Write-Host "=== Morning Brief Loop ===" -ForegroundColor Cyan
Write-Host "Runs: $MaxRuns, Interval: $IntervalSeconds seconds" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop early`n" -ForegroundColor Gray

for ($i = 1; $i -le $MaxRuns; $i++) {
    Write-Host "--- Run $i of $MaxRuns at $(Get-Date -Format 'HH:mm:ss') ---" -ForegroundColor Yellow
    
    # Run the agent with the morning-brief skill
    opencode run "run the morning-brief skill"
    
    # Show the current state of the spine
    Write-Host "`nCurrent progress.md:" -ForegroundColor Gray
    Get-Content progress.md | Write-Host
    
    if ($i -lt $MaxRuns) {
        Write-Host "`nWaiting $IntervalSeconds seconds before next run...`n" -ForegroundColor Gray
        Start-Sleep -Seconds $IntervalSeconds
    }
}

Write-Host "`n=== Loop complete ===" -ForegroundColor Green
Write-Host "Check progress.md to see how the spine tracked findings across runs." -ForegroundColor Green
