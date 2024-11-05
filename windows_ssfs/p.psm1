Function p
{
	clear;
	ls;
	pwd;
}

Function pp
{
	clear;
	ls -directory;
	pwd;
}

Function progs
{
	clear;
	cd C:\progs;
	ls;
	pwd;
}

Function o
{
	git status;
}

Function i
{
	git pull;
}

Function lsp
{
	get-childitem -directory | ForEach-Object { ls $_; }
}

Export-ModuleMember -Function p;
Export-ModuleMember -Function pp;
Export-ModuleMember -Function o;
Export-ModuleMember -Function i;
Export-ModuleMember -Function lsp;
Export-ModuleMember -Function progs;