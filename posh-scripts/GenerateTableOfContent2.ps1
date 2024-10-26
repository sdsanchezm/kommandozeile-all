Function GenerateMarkdownTableOfContent
{
    param
    (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $content = Get-Content -Path $FilePath -Raw

    $headings = @()

    $pattern = '^(#+)\s+(.*)$'

    $content -split "`r`n" | ForEach-Object
    {
        if ($_ -match $pattern)
        {
            $level = $matches[1].Length
            $text = $matches[2].Trim()
            $headings += [PSCustomObject]@{
                Level = $level
                Text = $text
            }
        }
    }

    $toc = @()
    foreach ($heading in $headings)
    {
        $indent = '  ' * ($heading.Level - 2)
        $tocLine = "$indent- [$($heading.Text)](#" + $heading.Text.ToLower().Replace(' ', '-') + ")"
        $toc += $tocLine
    }

    # uncomment to print output
    # $toc
}

# to use:
# $markdownFilePath = "./README.md"
$markdownFilePath = "./README.md"
$toc = Generate-MarkdownTOC -FilePath $markdownFilePath
$toc
