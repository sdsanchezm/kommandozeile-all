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