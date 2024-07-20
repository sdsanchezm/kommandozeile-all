
function ChangePassword
{
    $User = Get-LocalUser -Name "username"
    $NewPassword = Read-Host "Enter new pass: " -AsSecureString
    Set-LocalUser -Name $User.Name -Password $NewPassword
}

function ChangePasswordActiveDirectory
{
    Import-Module ActiveDirectory
    $User = Get-ADUser -Identity "username"
    $NewPassword = Read-Host "Enter new pass: " -AsSecureString
    Set-ADAccountPassword -Identity $User.SamAccountName -NewPassword $NewPassword -Reset    
}

function CreateNewUser
{
$username = "jamecho"
$fullname = "Jamecho Sanc"
$password = Read-Host "Enter pass: " -AsSecureString

# create new user
New-LocalUser -Name $username -FullName $fullname -Password $password -Description "New user was created" -PasswordNeverExpires:$true

# add user to a group (Admins group in this case)
Add-LocalGroupMember -Group "Admins" -Member $username

}


function FunctionName {
    Import-Module ActiveDirectory

    $username = "jamecho"
    $fullname = "Jamecho Sanc"
    $password = Read-Host "Enter pass: " -AsSecureString

    # add new Active Dir user
    New-ADUser -Name $fullname -GivenName "Jamecho" -Surname "Sanc" -SamAccountName $username -UserPrincipalName "$username@example.com" -AccountPassword $password -Enabled $true
    Add-ADGroupMember -Identity "Domain Admins" -Members $username
}

function viewWlanPwrt
{
    netsh wlan show profile oak1 key=clear
}