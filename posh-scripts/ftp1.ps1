param (
    [string]$ftpServer = "ftp://example.com",
    [string]$ftpUsername = "the_username",
    [string]$ftpPassword = "the_password",
    [string]$localFolderPath = "C:\path\to\the\Files",
    [string]$remoteFolderPath = "/remote/path"
)

# Convert the username and password to Base64 for FTP authentication
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("${ftpUsername}:${ftpPassword}")))

# Get all files in the local folder
$files = Get-ChildItem -Path $localFolderPath

foreach ($file in $files) {
    
    # Create the FTP request
    $ftpRequest = [System.Net.WebRequest]::Create("$ftpServer$remoteFolderPath/$($file.Name)")
    $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
    $ftpRequest.Credentials = New-Object System.Net.NetworkCredential($ftpUsername, $ftpPassword)
    $ftpRequest.UseBinary = $true

    # Read the file content
    $fileContent = [System.IO.File]::ReadAllBytes($file.FullName)

    # Upload the file
    $ftpStream = $ftpRequest.GetRequestStream()
    $ftpStream.Write($fileContent, 0, $fileContent.Length)
    $ftpStream.Close()

    Write-Host "Uploaded: $($file.Name)"
}

Write-Host "Upload complete."
