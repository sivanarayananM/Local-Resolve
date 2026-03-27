$owner = "sivanarayananM"
$repo = "Local-Resolve"

# Get GitHub token from environment or prompt
$token = $env:GITHUB_TOKEN
if (-not $token) {
    Write-Host "GitHub token not found in GITHUB_TOKEN environment variable"
    Write-Host "Get a token from: https://github.com/settings/tokens"
    $token = Read-Host "Enter your GitHub Personal Access Token (with repo scope)"
}

$headers = @{
    "Authorization" = "Bearer $token"
    "Accept" = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

# Get all deployments sorted by created_at (newest first)
$url = "https://api.github.com/repos/$owner/$repo/deployments"
Write-Host "Fetching deployments from $url..."

try {
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get -ErrorAction Stop
    Write-Host "Found $($response.Count) deployments"
    
    if ($response.Count -le 1) {
        Write-Host "OK: Only 1 or fewer deployments. Nothing to delete."
        exit 0
    }
    
    # Keep the first (latest), delete the rest
    $deploymentsToDelete = $response[1..($response.Count - 1)]
    Write-Host "Keeping latest deployment, deleting $($deploymentsToDelete.Count) old ones..."
    
    foreach ($deployment in $deploymentsToDelete) {
        $depId = $deployment.id
        $delUrl = "https://api.github.com/repos/$owner/$repo/deployments/$depId"
        Write-Host "Deleting deployment #$depId (created: $($deployment.created_at))..."
        
        try {
            Invoke-RestMethod -Uri $delUrl -Headers $headers -Method Delete -ErrorAction Stop | Out-Null
            Write-Host "  OK: Deleted"
        }
        catch {
            Write-Host "  ERROR: $($_.Exception.Message)"
        }
    }
    
    Write-Host ""
    Write-Host "OK: Cleanup complete!"
}
catch {
    Write-Host "Error fetching deployments: $($_.Exception.Message)"
    Write-Host ""
    Write-Host "Solutions:"
    Write-Host "1. Check token: https://github.com/settings/tokens"
    Write-Host "2. Token needs 'repo' scope"
    Write-Host "3. Repo: https://github.com/$owner/$repo"
    exit 1
}
