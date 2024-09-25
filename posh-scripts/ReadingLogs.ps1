

class ReadingLogs {
    [string]$file = "./c.txt"
	[string]$pattern1 = 'BUTTON|MESSAGE|Print Rcpt'
    [int]$number1 = 1;

    # MyClass() {
#    }

    [void] Find1() {
		Write-Output  "Start =========" -ForegroundColor Blue
		$content = Get-Content $this.file
		$filteredLines = $content | Where-Object { $_ -match $this.pattern1 }
		$filteredLines > c_1_out.txt
		Write-Output  "End =========" -ForegroundColor Blue
    }
}

$object = [ReadingLogs]::new()
$object.Find1();

$p1 = New-Object ReadingLogs
$p1.Find1()