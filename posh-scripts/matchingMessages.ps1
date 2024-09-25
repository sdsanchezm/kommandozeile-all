# option for reading a external file
$csvFilePath = "./input.csv"
$csvData1 = Import-Csv -Path $csvFilePath

# option in case internal handled XD
$csvData2 = @"
id, amount, pnumber, name, qty
1, 33.34, 2233MOD, Jamecho, 3
1, 44.34, 556HHF, Jara, 7
"@

# gotta be converted into posh objects:
$csvObjects = ConvertFrom-Csv $csvData2

$messageText = @"
Hello {0}

As follows the summary:

Amount: {1}
Product Number: {2}
Quantity: {3}

au revoir mi pez
"@

# loop for external csv data
foreach ($record in $csvData1)
{
    $name = $record.name
    $amount = $record.amount
    $pnumber = $record.pnumber
    $qty = $record.qty

    $outputLine = $messageText -f $name, $amount, $pnumber, $qty
    
    $outputFilePath = "./output_$name.txt"

    $outputLine | Out-File -FilePath $outputFilePath -Encoding utf8

    Write-Host -ForegroundColor DarkYellow "Message for " -NoNewline
    Write-Host -ForegroundColor DarkMagenta "$name " -NoNewline
    Write-Host -ForegroundColor DarkCyan "was exported to " -NoNewline
    Write-Host -ForegroundColor Yellow "$outputFilePath" 
}

# loop for internal csv data (since it got to be converted into objects)
foreach ($record in $csvObjects) {
    $name = $record.name
    $amount = $record.amount
    $pnumber = $record.pnumber
    $qty = $record.qty

    $textTemplate = @"
Hello $name

As follows the summary:

Amount: $amount
Product Number: $pnumber
Quantity: $qty

Thanks and have a good day
"@

    $outputFilePath = "./output2_$name.txt"

    $textTemplate | Out-File -FilePath $outputFilePath -Encoding utf8

    Write-Host "Text for $name has been exported to $outputFilePath"
}