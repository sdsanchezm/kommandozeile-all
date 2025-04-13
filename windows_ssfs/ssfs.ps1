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
