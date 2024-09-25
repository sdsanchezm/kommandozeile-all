param (
    [string]$folderPath = "C:\dir\here",
    [string]$searchString = "stringToFind"
)

function Search-StringInFiles {
    param (
        [string]$folder,
        [string]$search
    )

    $files = Get-ChildItem -File -Path $folder

    foreach ($file in $files) {
        $content = Get-Content -Path $file.FullName
        if ($content -like "*$search*") {
            Write-Host "Found '$search' in file: $($file.FullName)"
        }
    }

    foreach ($subfolder in (Get-ChildItem -Directory -Path $folder)) {
        Search-StringInFiles -folder $subfolder.FullName -search $search
    }
}

Search-StringInFiles -folder $folderPath -search $searchString
