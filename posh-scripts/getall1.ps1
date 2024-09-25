# Script have not worked yet
# need to be fixed 

$url = "http://example.com/VIDEO/temp/"
$localDirectory = "C:\temp\COURSE_TEMP"

if (-not (Test-Path -Path $localDirectory -PathType Container)) {
    New-Item -Path $localDirectory -ItemType Directory | Out-Null
}

function Download-FilesRecursively {
    param (
        [string]$url,
        [string]$localDirectory
    )

    $content = Invoke-WebRequest -Uri $url
    $links = $content.Links | Where-Object { $_.href -notlike "../" }

    foreach ($link in $links) {
        $newUrl = Join-Path $url $link.href
        $newLocalPath = Join-Path $localDirectory $link.href

        if ($link.rel -eq "directory") {
            Download-FilesRecursively -url $newUrl -localDirectory $newLocalPath
        } else {
            Invoke-WebRequest -Uri $newUrl -OutFile $newLocalPath
        }
    }
}

Download-FilesRecursively -url $url -localDirectory $localDirectory
