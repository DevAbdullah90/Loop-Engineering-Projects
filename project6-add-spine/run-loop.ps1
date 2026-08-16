# run-loop.ps1 - A loop with heartbeat, workflow, and spine
# Heartbeat: Timer (runs every 30 seconds)
# Workflow: loop-body skill (read → check → work → write)
# Spine: progress.md (carries memory between runs)

param(
    [int]$MaxBeats = 5,
    [int]$IntervalSeconds = 30
)

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  LOOP: Heartbeat + Workflow + Spine" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "Heartbeat: Every $IntervalSeconds seconds" -ForegroundColor Gray
Write-Host "Max beats: $MaxBeats" -ForegroundColor Gray
Write-Host "Spine: progress.md" -ForegroundColor Gray
Write-Host ""

$beat = 0

while ($beat -lt $MaxBeats) {
    $beat++
    Write-Host "--- Beat $beat of $MaxBeats ---" -ForegroundColor Yellow
    Write-Host "Time: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray
    
    # Read the spine FIRST
    Write-Host "`nReading progress.md (spine)..." -ForegroundColor Green
    $progress = Get-Content -Path "progress.md" -Raw
    
    # Check if work is needed
    if ($progress -match "\[ \]") {
        Write-Host "Work found! Running loop body..." -ForegroundColor Yellow
        
        # Run the loop body (workflow)
        opencode run "run the loop-body skill"
        
        Write-Host "Beat $beat complete." -ForegroundColor Green
    } else {
        Write-Host "No work to do. All issues fixed!" -ForegroundColor Green
        Write-Host "Loop stopping — spine says work is done." -ForegroundColor Green
        break
    }
    
    # Wait for next heartbeat
    if ($beat -lt $MaxBeats) {
        Write-Host "`nWaiting $IntervalSeconds seconds for next heartbeat..." -ForegroundColor Gray
        Start-Sleep -Seconds $IntervalSeconds
    }
}

Write-Host "`n=====================================" -ForegroundColor Cyan
Write-Host "  LOOP COMPLETE" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "Total beats: $beat" -ForegroundColor Gray
Write-Host "Final state:" -ForegroundColor Gray
Get-Content -Path "progress.md"
