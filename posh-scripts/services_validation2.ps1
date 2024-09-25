param (
    [string[]]$servicesToCheck = @("serv1", "serv2", "serv3")
)

foreach ($serviceName in $servicesToCheck) {
    $serviceStatus = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($serviceStatus -eq $null) {
        Write-Host "Service '$serviceName' does not exist on this system."
    }
    elseif ($serviceStatus.Status -eq 'Running') {
        Write-Host "Service '$serviceName' is already running."
    }
    else {
        Start-Service -Name $serviceName
        Write-Host "Service '$serviceName' has been started."
    }
}

Write-Host "Service validation completed."
