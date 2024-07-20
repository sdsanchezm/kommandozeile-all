function Generate-MarkdownTableOfContent
{
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath,
        [Parameter(Mandatory=$true)]
        [string]$OutputFilePath
    )

    if (-Not (Test-Path -Path $FilePath))
    {
        Write-Error "File not found: $FilePath"
        return
    }

    $content = Get-Content -Path $FilePath
    $headings = @()
    $pattern = '^(#+)\s+(.*)$'

    foreach ($line in $content)
    {
        if ($line -match $pattern)
        {
            Write-Host $line
            $level = $matches[1].Length
            Write-Host $level
            $text = $matches[2].Trim()
            Write-Host $text
            $headings += [PSCustomObject]@{
                Level = $level
                Text = $text
            }
        }
    }

    $toc = @()
    
    foreach ($heading in $headings)
    {
        $indent = '  ' * ($heading.Level - 1)
        $tocLine = "$indent- [$($heading.Text)](#" + $heading.Text.ToLower().Replace(' ', '-').Replace("'", '').Replace('.', '') + ")"
        $toc += $tocLine
    }

    $toc | Out-File -FilePath $OutputFilePath -Encoding utf8
    Write-Output "Table of content was generate."
}

$mdFile = 'C:\progs\AA_REPO_ALL\kommandozeile-all\README.md'
$table = 'C:\progs\AA_REPO_ALL\kommandozeile-all\out.md'

Generate-MarkdownTableOfContent -FilePath $mdFile -OutputFilePath $table

