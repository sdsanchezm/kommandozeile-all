class gitPullAllFolders
{
    [string]$DirectoryPath
    [string]$CommandToExecute
    
    gitPullAllFolders([string]$directoryPath, [string]$commandToExecute)
    {
        $this.DirectoryPath = $directoryPath
        $this.CommandToExecute = $commandToExecute
    }
    
    [void] ExecuteGitPull()
    {
        $folders = Get-ChildItem -Path $this.DirectoryPath -Directory

        foreach ($folder in $folders)
        {
            $this.EnterFolder($folder)
            $this.PullIfGitRepository($folder)
        }
        
        $this.ExitToParent()
    }
    
    [void] EnterFolder($folder)
    {
        Set-Location -Path $folder.FullName
        Write-Host -ForegroundColor Yellow "git pulling in >> " $folder.FullName
    }
    
    [void] PullIfGitRepository($folder)
    {
        if (Test-Path -Path ".git")
        {
            $this.ExecuteCommandFromProperty("git pull")
        }
        else
        {
            Write-Host "Not a Git repo: $($folder.Name)"
        }
    }

    [void] ExecuteCommandFromProperty($command)
    {
        Invoke-Expression -Verbose -Command $command 
    }
    
    [void] ExitToParent()
    {
        Set-Location ..
    }
}

$manager = [gitPullAllFolders]::new("./", "git pull")
$manager.ExecuteGitPull()
