# To run: ./ssFS.ps1
# In case errors with Execution Policy, gotta run the underneath commands in posh
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Set-ExecutionPolicy Restricted -Scope CurrentUser
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;
# powershell.exe -noprofile -executionpolicy bypass -file .\ssfs.ps1

$mainFolder = "ssfs"

$folders = @(
    "${mainFolder}\apps_downs",
    "${mainFolder}\apps_portable",
    "${mainFolder}\apps_installed",
    "${mainFolder}\bilder",
    "${mainFolder}\books_all",
    "${mainFolder}\cygwin64",
    "${mainFolder}\cygwin64Packages",
    "${mainFolder}\DriversForThisComputer",
    "${mainFolder}\musik", 
    "${mainFolder}\progs",
    "${mainFolder}\temp",
    "${mainFolder}\shared_folder",
    "${mainFolder}\VMsAll",
    "${mainFolder}\xampp",
    "${mainFolder}\MegaSyncAll",
    "${mainFolder}\GoogleDriveAll",
    "${mainFolder}\DropboxSyncAll",
    "${mainFolder}\modulesandscripts"
    )

foreach ($folder in $folders) {
    # New-Item -Path "C:\${mainFolderName}" -ItemType Directory
    $folderPath = Join-Path -Path "C:\" -ChildPath $folder
    # New-Item -Path $folderPath -ItemType Directory
    if (-Not (Test-Path -Path $folderPath)) { New-Item -Path $folderPath -ItemType Directory }
    Write-Host "Created folder: $folderPath"
}

# winget install
# https://learn.microsoft.com/en-us/windows/package-manager/winget/
# Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

# bloatware
# Remove Game Bar on Windows 11
# Get-AppxPackage -PackageTypeFilter Bundle -Name "*Microsoft.XboxGamingOverlay*" | Remove-AppxPackage

# powershell
# https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5#install-powershell-using-winget-recommended
# winget install --id Microsoft.PowerShell --source winget

