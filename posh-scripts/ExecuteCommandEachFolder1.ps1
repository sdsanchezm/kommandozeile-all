function ExecuteCustomCommandInFolders
{
    param (
        [string]$folderPath
    )

    $items = Get-ChildItem -Path $folderPath

    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            ExecuteCustomCommandInFolders -folderPath $item.FullName
        }
        elseif ($item.Extension -eq ".dat") {
            Invoke-Expression "$customCommand $($item.FullName)"
        }
    }
}

$cleanFilesCommand = "HelloCommand"
$rootFolder = "C:\temp\somewhere"
ExecuteCustomCommandInFolders -folderPath $rootFolder
