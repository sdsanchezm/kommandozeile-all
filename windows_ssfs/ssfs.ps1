# To run: ./ssFS.ps1
# In case errors with Execution Policy, gotta run the underneath commands in posh
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Set-ExecutionPolicy Restricted -Scope CurrentUser

$machineName = "redenhaput"

$folders = @(
    "apps",
    "apps_portable",
    "bilder",
    "books_all",
    "cygwin64",
    "cygwin64Packages",
    "musik", 
    "progs",
    "temp",
    "shared_ss_${machineName}",
    "VMsAll",
    "ssfs",
    "ssfs\Modules"
    )

foreach ($folder in $folders)
{
    $folderPath = Join-Path -Path "C:\" -ChildPath $folder
    New-Item -Path $folderPath -ItemType Directory
    Write-Host "Created folder: $folderPath"
}
