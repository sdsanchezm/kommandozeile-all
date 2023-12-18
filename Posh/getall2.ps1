# Script have not worked yet
# need to be fixed 

$url = "https://example.com/some/folder/my/dir-1/"

$localDirectory = "C:\Path\To\Your\Local\Directory"

if (-not (Test-Path -Path $localDirectory -PathType Container)) {
    New-Item -Path $localDirectory -ItemType Directory | Out-Null
}

Invoke-WebRequest -Uri $url -OutFile (Join-Path $localDirectory "downloaded-files") -Recursive -Directory -WebSession $WebSession

$WebSession | Remove-WebSession
