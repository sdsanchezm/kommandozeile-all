# Credentials of the user
$userCredentials = Get-Credential

# the command here
$userCommand = {
    Rename-Item -Path "C:\Program Files (x86)\app1" -NewName "app1.old"
}

# starting the process and including commands in here
Start-Process powershell.exe -ArgumentList "-Command $($userCommand)" -Credential $userCredentials -NoNewWindow -Wait
