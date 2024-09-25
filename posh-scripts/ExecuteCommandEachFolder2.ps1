$directories = Get-ChildItem -Directory
$scriptName = "syncFiles.ps1"
$actualFolder = $pwd

foreach ($item in $directories)
{
    Write-Host "Entering: $($item.FullName)"    
    Set-Location $item.FullName

    if (Test-Path $scriptName)
    {
        Write-Host "Executing: $scriptName"
        .\ $scriptName
    }
    else
    {
        Write-Host "Script $scriptName was not found at $($item.FullName)"
    }
    
    Set-Location -Path (Get-Location).Parent
}

Write-Host `Actual Folder: ${actualFolder}`
