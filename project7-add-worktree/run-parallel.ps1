# run-parallel.ps1 - Parallel work with worktrees
# This demonstrates how worktrees isolate agents working in parallel

param(
    [switch]$ShowConflict
)

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  PARALLEL WORK WITH WORKTREES" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan

# ============================================
# STEP 1: Create worktrees for each agent
# ============================================
Write-Host "`n--- [1/4] Creating worktrees ---" -ForegroundColor Yellow

$worktreeDir = "worktrees"
$agentA = "$worktreeDir/agent-a"
$agentB = "$worktreeDir/agent-b"

# Create worktree directories
New-Item -ItemType Directory -Path $agentA -Force | Out-Null
New-Item -ItemType Directory -Path $agentB -Force | Out-Null

# Copy source files to each worktree
Copy-Item -Path "src/cart.py" -Destination "$agentA/cart.py" -Force
Copy-Item -Path "src/cart.py" -Destination "$agentB/cart.py" -Force

Write-Host "Created worktree for Agent A: $agentA" -ForegroundColor Green
Write-Host "Created worktree for Agent B: $agentB" -ForegroundColor Green

# ============================================
# STEP 2: Agents work in parallel (isolation)
# ============================================
Write-Host "`n--- [2/4] Agents working in parallel ---" -ForegroundColor Yellow

Write-Host "Agent A: Fixing BUG 1 (apply_discount)" -ForegroundColor Magenta
Write-Host "Agent B: Fixing BUG 2 (apply_tax)" -ForegroundColor Magenta

# Agent A fixes BUG 1 in its worktree
$cartA = Get-Content "$agentA/cart.py" -Raw
$cartA = $cartA -replace "discount_multiplier = percent / 100", "discount_multiplier = 1 - percent / 100"
Set-Content -Path "$agentA/cart.py" -Value $cartA

# Agent B fixes BUG 2 in its worktree
$cartB = Get-Content "$agentB/cart.py" -Raw
$cartB = $cartB -replace 'item\["price"\] = item\["price"\] \+ tax_rate', 'item["price"] = item["price"] * (1 + tax_rate / 100)'
Set-Content -Path "$agentB/cart.py" -Value $cartB

Write-Host "Agent A: Fixed apply_discount()" -ForegroundColor Green
Write-Host "Agent B: Fixed apply_tax()" -ForegroundColor Green

# ============================================
# STEP 3: Merge results
# ============================================
Write-Host "`n--- [3/4] Merging results ---" -ForegroundColor Yellow

# Take Agent A's fix for BUG 1
$mergedCart = Get-Content "$agentA/cart.py" -Raw

# Take Agent B's fix for BUG 2
$agentBCart = Get-Content "$agentB/cart.py" -Raw

# Extract Agent B's apply_tax fix
if ($agentBCart -match '(    def apply_tax.*?    def clear)' -match '(    def apply_tax.*?    def clear)') {
    $agentBTaxFix = $Matches[1]
    # Replace in merged cart
    $mergedCart = $mergedCart -replace '(    def apply_tax.*?    def clear)', $agentBTaxFix
}

Set-Content -Path "src/cart.py" -Value $mergedCart

Write-Host "Merged fixes into src/cart.py" -ForegroundColor Green

# ============================================
# STEP 4: Cleanup worktrees
# ============================================
Write-Host "`n--- [4/4] Cleaning up worktrees ---" -ForegroundColor Yellow

Remove-Item -Path $agentA -Recurse -Force
Remove-Item -Path $agentB -Recurse -Force

Write-Host "Removed worktree directories" -ForegroundColor Green

# ============================================
# STEP 5: Run tests to verify
# ============================================
Write-Host "`n--- [5/5] Running tests ---" -ForegroundColor Yellow

python -m pytest tests/test_cart.py -v

# ============================================
# DEMONSTRATE CONFLICT (if requested)
# ============================================
if ($ShowConflict) {
    Write-Host "`n=====================================" -ForegroundColor Red
    Write-Host "  DEMONSTRATING WRITE CONFLICT" -ForegroundColor Red
    Write-Host "=====================================" -ForegroundColor Red
    
    Write-Host "`nWithout worktrees, both agents edit the same file:" -ForegroundColor Gray
    Write-Host "Agent A changes line 42: discount_multiplier = 1 - percent / 100" -ForegroundColor Magenta
    Write-Host "Agent B changes line 42: discount_multiplier = 0.9" -ForegroundColor Magenta
    Write-Host "Result: Agent B's fix WINS, Agent A's fix is LOST" -ForegroundColor Red
    Write-Host "That's why we need worktrees!" -ForegroundColor Yellow
}

Write-Host "`n=====================================" -ForegroundColor Cyan
Write-Host "  PARALLEL WORK COMPLETE" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
