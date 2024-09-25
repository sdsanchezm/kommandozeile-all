$text = @"
Yrvdu3748 asd
Hdb3695ddas
Hhdu  asd
Gdurh ### SomeText1 #: 9981
Vduf SomeText2 #: 76531
#### hheveu
Gsuvdh SomeText1 #: 9982
Udbdbbd ####
#### hdudb
Hdudbdh SomeText2 #: 76531
## SADFASD SomeText1 #: 9983
asd #### hdudb
jkhasbdf SomeText2 #: 76533
"@

$tranPattern = "SomeText1\s*#:\s*(\d+)"
$operatorPattern = "SomeText2\s*#:\s*(\d+)"

# $tranMatches = $text | Select-String -Pattern $tranPattern -AllMatches | ForEach-Object { $_.Matches.Groups[1].Value }
# $operatorMatches = $text | Select-String -Pattern $operatorPattern -AllMatches | ForEach-Object { $_.Matches.Groups[1].Value }
$tranMatches = $text | Select-String -Pattern $tranPattern -AllMatches | ForEach-Object { $_.Matches }
$operatorMatches = $text | Select-String -Pattern $operatorPattern -AllMatches | ForEach-Object { $_.Matches }

$tranMatches
Write-Output "--"

$results = @()

for ($i = 0; $i -lt [Math]::Max($tranMatches.Count, $operatorMatches.Count); $i++)
{
    $result = [PSCustomObject]
    @{
        "SomeText1" = if ($i -lt $tranMatches.Count) { $tranMatches[$i] } else { $null }
        "SomeText2" = if ($i -lt $operatorMatches.Count) { $operatorMatches[$i] } else { $null }
    }
    $results += $result
}

$results | Export-Csv -Path "data.csv" -NoTypeInformation
