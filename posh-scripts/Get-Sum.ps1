# For the error: The file C:\Get-Sum.ps1 is not digitally signed
# Solution (carefull):
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# byteinthesky(dot)com/powershell/how-to-fix-error-file-is-not-digitally-signed-in-powershell/
#
# Remove the Command
# Remove-Item Function:\Get-Sum
# ls Functions:

Function Get-Sum {

    [CmdletBinding()]
    Param(
        [int]$num1,
        [int]$num2
    )
    Write-Host "$num1 + $num2 = " ($num1 + $num2)
}