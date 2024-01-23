# posh scripting

## Principle

- write a plain text file with a `.ps1` extension and save.

- Execution Policy:
   - By default, PowerShell restricts the execution of scripts
   - Might need to adjust the execution policy to run your script:

   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```
   - Select 'Y' when prompted to confirm

- Run the Script:

   ```powershell
   .\script.ps1
   ```
    - confirm if required: (to run scripts in your sys)
        - 'R' for Run Once
        - 'A' for Always


## Script

### Script counting files recursively
- to execute: `.\script.ps1`
- or indicating the folder path: `.\script.ps1 -folderPath "C:\your\folder"`

    ```powershell
    param (
        [string]$folderPath = "C:\your\path"
    )

    function Count-Files {
        param (
            [string]$folder
        )

        $fileCount = 0
        $files = Get-ChildItem -File -Path $folder
        $fileCount += $files.Count

        foreach ($subfolder in (Get-ChildItem -Directory -Path $folder)) {
            $fileCount += Count-Files -folder $subfolder.FullName
        }
        return $fileCount
    }

    $fileCount = Count-Files -folder $folderPath
    Write-Host "Number of files in $folderPath and subfolders is: $fileCount"

    ```
- Get all files in the current folder
    - `$files = Get-ChildItem -File -Path $folder`
- Recursively count files in subfolders
    ```powershell
        foreach ($subfolder in (Get-ChildItem -Directory -Path $folder)) {
            $fileCount += Count-Files -folder $subfolder.FullName
        }
    ```


### Script finding text recursively

- to run: `.\script.ps1 -folderPath "C:\your\folder" -searchString "searchString"`
- or `.\script.ps1`
    ```powershell
    param (
        [string]$folderPath = "C:\your\folder",
        [string]$searchString = "searchString"
    )

    function Search-StringInFiles {
        param (
            [string]$folder,
            [string]$search
        )

        $files = Get-ChildItem -File -Path $folder

        foreach ($file in $files) {
            $content = Get-Content -Path $file.FullName -Raw
            if ($content -match $search) {
                Write-Host "Found in file: $($file.FullName)"
            }
        }

        foreach ($subfolder in (Get-ChildItem -Directory -Path $folder)){
            Search-StringInFiles -folder $subfolder.FullName -search $search
        }
    }

    # call the function 
    Search-StringInFiles -folder $folderPath -search $searchString
    ```

    - get files in the current folder `$files = Get-ChildItem -File -Path $folder`

    - Search for the string provided in each file
    ```powershell
    foreach ($file in $files) {
        $content = Get-Content -Path $file.FullName -Raw
        if ($content -match $search) {
            Write-Host "Found in file: $($file.FullName)"
        }
    }
    ```

    - search in subfolders recursively 
    ```powershell
        foreach ($subfolder in (Get-ChildItem -Directory -Path $folder)) {
            Search-StringInFiles -folder $subfolder.FullName -search $search
        }
    ```

### get all files in a Uri

- 
```powershell
param (
    [string]$webUri = "https://example.com"
)

function Get-FilesFromWebUri {
    param (
        [string]$uri
    )

    # Download the HTML content of the web page
    $webContent = Invoke-WebRequest -Uri $uri

    # Extract links to files from the HTML content
    $fileLinks = $webContent.Links | Where-Object { $_.href -match '\.pdf$|\.doc$|\.txt$' }

    # Display the file links
    $fileLinks | ForEach-Object {
        Write-Host "File: $($_.href)"
    }
}

    # call the function 
Get-FilesFromWebUri -uri $webUri
```

### download all files from a link

- script to download all files from a link
```powershell
param (
    [string]$downloadLink = "https://example.com/files"
)

function Download-Files {
    param (
        [string]$link
    )

    # create a folder
    $outputFolder = "DownloadedFiles"
    if (-not (Test-Path -Path $outputFolder)) {
        New-Item -ItemType Directory -Path $outputFolder | Out-Null
    }

    $webContent = Invoke-WebRequest -Uri $link
    $fileLinks = $webContent.Links | Where-Object { $_.href -match '\.pdf$|\.doc$|\.txt$' }

    foreach ($fileLink in $fileLinks) {
        $fileName = [System.IO.Path]::GetFileName($fileLink.href)
        $filePath = Join-Path -Path $outputFolder -ChildPath $fileName
        Invoke-WebRequest -Uri $fileLink.href -OutFile $filePath
        Write-Host "Downloaded: $fileName"
    }
}

# call the function 
Download-Files -link $downloadLink


## Network

- view 
    - `netsh wlan show networks`
    - `Get-NetWiFiProfile`

- connect
    - `netsh wlan connect name="WiFiNetworkName" ssid="WiFiNetworkName"`
    - 

- pwrt
    - `netsh wlan connect name="WiFiNetworkName" ssid="WiFiNetworkName" keyMaterial="pwrtHier"`
    - `Connect-NetWiFi -Name "YourWiFiNetworkName"`

- disconnect
    - `netsh wlan disconnect`
    - `Disconnect-NetWiFi`

- script.ps1
    - 
    ```
    $networkName = "WiFi name"
    $securityKey = "WiFi pwrt"

    netsh wlan connect name="$networkName" ssid="$networkName"

    Start-Sleep -Seconds 5

    $connectedNetwork = netsh wlan show interfaces | Select-String -Pattern "SSID"
    if ($connectedNetwork -like "*$networkName*") {
        Write-Host "Connected to $networkName."
    } else {
        Write-Host "Failed to connect to $networkName."
    }

    ```




