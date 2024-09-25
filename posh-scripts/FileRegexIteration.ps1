$p = Get-Content .\*.txt
$pattern = 'Tasd#:\s*(\d{4})'
$matches = [regex]::Matches($p, $pattern)
'' > x.txt
foreach($match in $matches)
{
    $x = -join($match.Groups[1].Value, ",");
    Write-Output $x >> x.txt
}
