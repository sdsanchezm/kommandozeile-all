
param(
    [string]$githubuser = "<reporUserHere>",
    [string]$OutputDirectory = ".",
    [bool]$IncludeForks = $false
)

try {
    $null = git --version
}
catch {
    Write-Error "install git first"
    exit 1
}

if (-not (Test-Path -Path $OutputDirectory)) {
    New-Item -ItemType Directory -Path $OutputDirectory | Out-Null
}

$apiUrl = "https://api.github.com/users/$githubuser/repos"

try {
    Write-Host "getting data..."
    $repositories = Invoke-RestMethod -Uri $apiUrl -Method Get
}
catch {
    Write-Error "failed to fetch repositories: $_"
    exit 1
}

foreach ($repo in $repositories) {
    $repoName = $repo.name
    $cloneUrl = $repo.clone_url
    $targetPath = Join-Path -Path $OutputDirectory -ChildPath $repoName
    
    if (Test-Path -Path $targetPath) {
        Write-Host "repo '$repoName' already here: $targetPath "
        continue
    }
    
    Write-Host "cloning $repoName..."
    try {
        git clone $cloneUrl $targetPath
        Write-Host "cloned ok $repoName" -ForegroundColor Green
    }
    catch {
        Write-Error "failed clonning $repoName : $_"
    }
}

Write-Host "`n process completed ok" -ForegroundColor Cyan