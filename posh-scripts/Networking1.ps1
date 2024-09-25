# Test-connection
Test-Connection kop.lat
Test-Connection 8.8.8.8
Test-Connection -ComputerName 8.8.8.8, 8.8.4.4
Test-Connection -ComputerName 8.8.8.8, 8.8.4.4 -Delay 5 #in secs

# Test-NetConnection
Test-NetConnection kop.lat
Test-NetConnection kop.lat -InformationLevel "Detailed"
$testConnection1 = Test-NetConnection kop.lat -InformationLevel "Detailed"
$testConnection1.ComputerName
$testConnection1.PingReplyDetails
$testConnection1.PingReplyDetails.Buffer
$testConnection1.PingReplyDetails.Address
$testConnection1.PingReplyDetails.Options

# tracing
## old: tracert kop.lat
Test-NetConnection udemy.com -TraceRoute
$test2 = Test-NetConnection udemy.com -TraceRoute
$test2.RemoteAddress
$test2.TraceRoute
$test2.TraceRoute[0]

$test3 = Test-NetConnection udemy.com -TraceRoute -Hops 3
$test3

# port scanning

Test-NetConnection kop.lat -CommonTCPPort "http"
Test-NetConnection udemy.com -CommonTCPPort "http"

Test-NetConnection kop.lat -Port 80
Test-NetConnection kop.lat -Port 21
Test-NetConnection wikipedia.org -Port 21

$ports = 22,80
$ports | ForEach-Object { $port = $PSItem; if(Test-NetConnection kop.lat -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue) { Write-Host "Port $port open" } else { Write-Host "Port $port closed" } }

$ports = 22,80 | ForEach-Object { $port = $PSItem; if(Test-NetConnection kop.lat -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue) { Write-Host "Port $port open" } else { Write-Host "Port $port closed" } }


# Adapters
$netadapters = Get-NetAdapter
$netadapters

Get-NetAdapter | Format-List

$netadapters[0].MacAddress


# Ip configuration

Get-NetIPConfiguration
$ipinfo = Get-NetIPConfiguration
$ipinfo[0].IPv4Address
$ipinfo[0].DNSServer
## old: ipconfig /all


# DNS
Resolve-DnsName kop.lat | Format-List

Get-DnsClientServerAddress -InterfaceAlias Ethernet
$dnsserv = Get-DnsClientServerAddress -InterfaceAlias Ethernet
$dnsserv.Count
$dnsserv[0].ServerAddresses
$dnsserv[1].ServerAddresses

Clear-DnsClientCache
Get-Help Clear-DnsClientCache
Clear-DnsClientCache -Confirm









