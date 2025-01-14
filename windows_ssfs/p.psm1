Function p
{
	clear;
	ls;
	# pwd;
 	(pwd).Path;
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
	(pwd).Path;
}

Function o
{
	git status;
}

Function oo
{
	git log --oneline;
}

Function ooo
{
	git log;
}

Function i
{
	git pull;
}

Function lsp
{
	get-childitem -directory | ForEach-Object { ls $_; }
}

Function pullall
{
	# requires i
	get-childitem -directory | ForEach-Object { cd $_; (pwd).Path + "--------------"; i; cd.. }
}

Function statusall
{
	# requires o
	get-childitem -directory | ForEach-Object { cd $_; (pwd).Path + "--------------"; o; cd.. }
}

Export-ModuleMember -Function p;
Export-ModuleMember -Function pp;
Export-ModuleMember -Function o;
Export-ModuleMember -Function oo;
Export-ModuleMember -Function ooo;
Export-ModuleMember -Function i;
Export-ModuleMember -Function lsp;
Export-ModuleMember -Function progs;
Export-ModuleMember -Function statusall;
Export-ModuleMember -Function pullall;
