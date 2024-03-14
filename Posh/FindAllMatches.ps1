$text = @"
qweqwe
asdasd
zxczxc
123123
"@

# $pattern = "\b(?:someText1\s*#:\s*|someText2#:\s*)(\d+)"
# $pattern = "\b(?:someText1\s*#:\s*(\d*))"
$pattern = "\b(?:someText2\s*#:\s*(\d*))"

$matches = $text | Select-String -Pattern $pattern -AllMatches | ForEach-Object { $_.Matches }

# these are the resulted objects
$matches

foreach ($match in $matches) {
    # here I extract data from matches
    $match.Value
}
