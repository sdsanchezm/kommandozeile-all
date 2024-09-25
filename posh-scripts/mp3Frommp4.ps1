param (
    [string]$inputFilePath = "C:\Path\To\Your\InputVideo.mp4",
    [string]$outputFilePath = "C:\Path\To\Your\OutputAudio.mp3"
)

# Check if FFmpeg is available in the system
if (-not (Test-Path -Path "ffmpeg.exe")) {
    Write-Host "Error: FFmpeg is not installed or not in the system PATH."
    exit
}

# Use FFmpeg to extract audio in MP3 format
& ffmpeg.exe -i $inputFilePath -vn -acodec libmp3lame -ab 192k -ar 44100 -y $outputFilePath

Write-Host "Audio extraction complete."
