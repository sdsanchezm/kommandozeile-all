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
    - `netsh wlan show profiles interface="WLAN-INTERFACE-NAME"`
    - `netsh wlan show profiles interface="wi-fi"`
    - `Get-NetWiFiProfile`

- view drivers
    - `netsh wlan show drivers`

- show wireless capabilities
    `netsh wlan show wirelesscapabilities`

- show wireless interfaces
    `netsh wlan show interfaces`
    `netsh wlan show interface name="WLAN-INTERFACE-NAME"`
    `netsh wlan show interface name="Wi-Fi"`

- show wireless profiles with key
    `netsh wlan show profile name="WLAN-PROFILE-NAME" key=clear`
    `netsh wlan show profile name="mysuperwifi" key=clear`

- stop automatic connection and set it to manual
    - `netsh wlan set profileparameter name="WLAN-PROFILE-NAME" connectionmode=manual`
    - `netsh wlan set profileparameter name="mysuperwifi" connectionmode=manual`

- Set connection to automatic
    - `netsh wlan set profileparameter name="WLAN-PROFILE-NAME" connectionmode=auto`
    - `netsh wlan set profileparameter name="mysuperwifi" connectionmode=auto`

- delete a profile
    - `netsh wlan delete profile name="mysuperwifi"`
    
- export
    - `netsh wlan export profile name="WLAN-PROFILE-NAME" key=clear folder="C:\Users\<user>\wireless-backup"`
    - `netsh wlan export profile name="WLAN-PROFILE-NAME" key=clear folder="FOLDER-PATH"`

- profile order
    - `netsh wlan set profileorder name=mysuperwifi priority=1 interface="Wi-Fi"`
    - `netsh wlan set profileorder name="PROFILE-NAME" priority="PRIORITY-NUMBER" interface="ADAPTER-NAME"`

- delete profile
    - `netsh wlan delete profile name="PROFILE-NAME"`

- connect
    - `netsh wlan connect name=PROFILE-NAME`

- import or add a connection from a xml file
    - `netsh wlan add profile filename="C:\temp\w1.xml" interface="Wi-Fi 2"`
    - `netsh wlan add profile filename="C:\Users\<user>\wireless-backup\Wi-Fi-mysuperwifi.xml"`
    - `netsh wlan add profile filename="FOLDER-PATH\WLAN-EXPORTED-FILE" Interface="WLAN-INTERFACE-NAME" user=current`
    - `netsh wlan add profile filename="C:\Users\<user>\wireless-backup\Wi-Fi-mysuperwifi.xml" Interface="Wi-Fi" user=current`

- create a wlan report
    - `netsh wlan show wlanreport`
    
- disable and enable an interface
    - `netsh interface show interface`
    - `netsh interface set interface "YOUR-ADAPTER-NAME" disable`
    - `netsh interface set interface "YOUR-ADAPTER-NAME" enable`
    - `Disable-NetAdapter -Name "YOUR-ADAPTER-NAME" -Confirm:$false`
    - `Enable-NetAdapter -Name "YOUR-ADAPTER-NAME" -Confirm:$false`


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
        ```powershell
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
## Some Regex expressions

- ip regex
    ```powershell
        Get-Content .\a.txt | Select-String '\d{4}'
        "qwe123" -match '\d{2}'; $Matches[0] -replace '1','3'

        $s = "I am a secret string 10.123.4.200"
        $s -match "(\d{1,3}(\.)?){4}"

        $s -match "(\d{1,3}(\.)?){4}"; $Matches[0] >> b.txt
    ```


- Quick Process
    - view
        - `netsh wlan show profile`
    - export
        - `netsh wlan export profile name="<NAME>" key=clear folder="C:\temp"`
    - change the xml file: Update names, protected to false, pwrt on keyMaterial, delete hex;
    - validate interface name
        - `netsh wlan show interface`
    - import file
        - `netsh wlan add profile filename="C:\temp\w1.xml" interface="Wi-Fi 2"`


## Importing Modules

- Import a Module
    - `Import-Module .\Ss-Modules.psm1`

- Verify functions of a module
    - `Get-Command -Module Ss-Modules`

- If making changes to the module, gotta be removed and re-imported
    - Removing and re-importing
        - `Remove-Module Ss-Modules; Import-Module .\Ss-Modules.psm1`

- **Persistence of the module**
    - Getting path value
        - `$Path=$env:PSModulePath -split ";"`
        - `$Path[0]`

    - Adding the MyTools Folder
        - `$ModulePath=$Path[0] + "\MyTools"`
        - `$ModulePath`

    - Creating the new item of type Directory
        - `New-item $ModulePath -ItemType Directory`

    - copying item of module path
        - `Copy-Item C:\ssfs\Ss-Modules.psm1 -Destination $ModulePath -Force`

    - example of module:
        ```
        <#
        .Synopsis
        This is the Synopsis perro
        .Description
        This is the description socio
        .Parameter GetHello
        This is GetHello socio
        .Example
        Get-Hello
        .Example
        Get-Sum 1 2
        #>

        Function Get-Hello
        {
            Write-host "Hello from get-Hello"
        }

        <#
        .Synopsis
        This is the Synopsis perro
        .Description
        This is the description socio
        .Parameter GetHello
        This is Get-Sum socio
        .Example
        Get-Hello
        .Example
        Get-Sum 1 2
        #>

        Function Get-Sum
        {

            [CmdletBinding()]
            Param(
                # number 1 XD
                [int]$num1,
                # number 2 XD
                [int]$num2
            )
            Write-Host "$num1 + $num2 = " ($num1 + $num2)
        }
        ```


