$folderPath = Get-Location

$outputCsvPath = "all.csv"

# $headers = "a", "b", "c"
# $combinedContent = @()

$csvFiles = Get-ChildItem -Path $folderPath -Filter *.csv

$allCsvContent = @()

foreach ($csvFile in $csvFiles) {

    $csvContent = Import-Csv -Path $csvFile.FullName
    $allCsvContent += $csvContent

}

$allCsvContent | Export-Csv -Path $outputCsvPath -NoTypeInformation -Force
