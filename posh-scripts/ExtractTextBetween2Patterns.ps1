

function ExtractTextBetweenPatterns1 {
    param (
        [string]$FilePathInput,
        [string]$StartPattern,
        [string]$EndPattern
    )
    
    $outputFilePath = "out1.txt";
    $inputText = Get-Content -Path $filePathInput -Raw

    $pattern = "(?s)${StartPattern}(.*?)$EndPattern"

    $matches = $inputText | Select-String -Pattern $pattern -AllMatches

    $extractedText = @()
    $tempText = "--"

    foreach ($match in $matches.Matches) {
        $extractedText += $tempText
        $textBetween = $match.Groups[0].Value.Trim()
        $extractedText += $textBetween
    }

    $extractedText | Out-File -FilePath $outputFilePath
}

ExtractTextBetweenPatterns1 -FilePathInput ".\dataTest4.txt" -StartPattern "ASD" -EndPattern "Auth#"
