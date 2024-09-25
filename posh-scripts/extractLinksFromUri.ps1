param (
    [string]$webUri = "https://example.com"
)

function Get-FilesFromWebUri {
    param (
        [string]$uri
    )

    $webContent = Invoke-WebRequest -Uri $uri

    $fileLinks = $webContent.Links | Where-Object { $_.href -match '\.pdf$|\.doc$|\.txt$' }
    
    $fileLinks | ForEach-Object {
        Write-Host "File: $($_.href)"
    }
}

Get-FilesFromWebUri -uri $webUri
