$servicesToCheck = @(
    "wuauserv",
    "wscsvc",
    "spooler"
)

function Test-ServiceRunning {
    param (
        [string]$serviceName
    )

    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($service -ne $null) {
        if ($service.Status -eq 'Running') {
            Write-Host "$serviceName is running."
            return $true
        } else {
            Write-Host "$serviceName is not running. Current status: $($service.Status)"
        }
    } else {
        Write-Host "Service $serviceName not found on this system."
    }

    return $false
}

foreach ($service in $servicesToCheck) {
    Test-ServiceRunning -serviceName $service
}

Write-Host "Service verification complete."
