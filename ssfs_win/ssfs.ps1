# To run: ./ssFS.ps1
# In case errors with Execution Policy, gotta run the underneath commands in posh
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Set-ExecutionPolicy Restricted -Scope CurrentUser

$folders = @("musik", "bilder", "apps", "apps_portable", "temp", "books_all")

foreach ($folder in $folders) {
    $folderPath = Join-Path -Path "C:\" -ChildPath $folder
    New-Item -Path $folderPath -ItemType Directory
    Write-Host "Created folder: $folderPath"
}
