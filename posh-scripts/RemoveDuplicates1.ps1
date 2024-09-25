$text = @"
SomeText1#: 34,
SomeText1#: 567,
SomeText1#: 77,
SomeText1# 34,
SomeText1#: 55,
"@

$lines = $text -split "`n" | Where-Object { $_ -ne "" }

$uniqueLines = $lines | Select-Object -Unique

$uniqueLines | Out-File -FilePath "duplicatesRemoved.txt"
