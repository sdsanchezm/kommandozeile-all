# kommandozeile-all

*Description:* Summary of command Line and helpful tools to improve efficiency and enablers to deploy and abstract even more.

## Table of contents

[Headers](#headers)  



## vim editor

vim Editor commands:

1. move to beginning of the current line, 0
2. move to end of line, $
3. move to the top of the current window (high), H
4. move to the middle of the current window (middle), M
5. move to the bottom line of the current window (low), L
6. move to the first line of the file, 1G
7. move to the 20th line of the file, 20G
8. move to the last line of the file, G

9. the "* and "+ paste the clipboard into the insert mode

10. undo:
`u`
- or:
` :u `
- or:
` :undo `
- or:
` :undo 3 `

### plugins and stuff

- This is an example of .vimrc
```
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'nvim-lua/completion-nvim'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'

call plug#end()
```
- To install plugins at:
```
:PlugInstall
```
- To Update, maybe:
```
:PlugUpdate
```

- The repo to get all plugin, is:
```
sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- Instructions at:
```
https://github.com/junegunn/vim-plug
```


# From the course:

##

### utilidades batch:
- cat // mostrar contenido completo
- head // mostrar la cabeza del archivo, first 10 lines
- tail // last 10 lines
- $ tail -n 20 file.txt // last 20 lines

### utilidades batch avanzadas:
- grep // permite trabajar con archivos regulares, busca lineas
- $ grep -i "hanks'),$" dump1.sql // aca el $ quiere decir, el resto
- $ grep "^keyword" file.txt // todo lo que esta al inicio
- $ grep "keyword$" file.txt // todo lo que esta al final

### sed
- sed // sed is stream editor, usa mucho expresiones regulares
- sed 's/Hanks/Selleck/g' dump1.sql // no modifica el archivo, solo crea un nuevo flujo
- $ sed '$d' nuevasPelis.csv // borra la ultima linea
- $ sed 's/USER_NAME/ana10/' file.txt
- $ sed 's/USER_NAME/ana10/; s/USER_POINTS/34' file.txt
- $ echo "the new car is the most incredible machine in a town" | sed 's/a town/the world/'
- $ sed -f myfileWithCommands myFile // to use a file with commands
- $ s/pattern/replacement/flags // the flags could be g, A, p, w
- si el flag es un numero, entonces ese es el numero de ocurrencia;
- g es global, todas las ocurrencias
- p imprime patron original, cada linea que tiene una coincidencia
- w, guarda en un file especifico
- more info at: https://likegeeks.com/es/sed-de-linux/

### awk
- awk // sirve para trabajar con textos estructurados, como csv, o separados por tabs o similares
- $ awk -F ';' '{ print $1}' nuevasPelis.csv // esto imprime la primera columna
- $ awk -F ';' 'NR > 1 && $3 > 0 { print $1, $3 * $4 }' nuevasPelis.csv // imprime number row mayor que 1, y columna 3, $3 es mayor que 0, e imprime con esa condicion, la columna 1 ($1) y la columna 3 por la 4 ($ * $4)

## Data processing

### Flujos estandar en la terminal:
- entrada estandar
- salida estandar
- error estandar

- Los flujos estan conectados a los perifericos

- redireccion: cambiar la entrada del teclado a un archivo:

```
$ mysql -h 127.0.0.1 -u root -p1234 < dump1.sql // usando el menor que
```

- Redireccionamiento de salida, de pantalla a un archivo:
```
$ ls > file_ls.txt // guarda la salida en un archivo
```

- Con >> agrego el resultado al qarchivo que ya tenia;

- pipes: |; toma lasalida de un proceso y se lo pasa a otro
```
$ ls -l | more
$ ls -l | wc // wc es word count
$ ls -l | wc -l // muestra cuantas lineas
```

- Proceso en background:
se pone un ampersan al final
```
$ ls -l > asd &
$ php infitine_loop.php & // se manda al backgound
```

- Hay servicios que corren en el background, se llaman daemons
- con Ctrl + z, se manda al background (segundo plano)
- con Ctrl + c, lo cancelo (se interrumpe)
- ps es para ver los pids y poder terminar servicios; ps es un proceso batch (or bash, idk)
```
$ ps ax
$ ps ax | grep init
```
- top
`$ top`

- Para matar procesos:
```
$ kill -9 [pin number] // mata un proceso por pid
$ killall
```

### usuarios en linux o unix:

u - Owner of the file
g - Grups
o - Others
a - all

### Operaciones:

- r - Leer, Read
- w - Escribir, Write
- x - ejecutar, Execute

```
+ agregar
- quitar
```

### Permisos (textual es cuando uso caracteres):

- chmod (change mode):
```
$ chmod o-w file.txt
```

chown (change owner):
chgrp (change group):

- Permisos Binarios (numeros en lugar de numeros):

- Hay 10 columnas:
- -rw-rw-r--. 1 ss ss  450 Nov 11 10:44 index.html

- La primera es el tipo de archivo, esos tipos son:

- archivo regular: -
- Directorio: d
- Archivo especial como dispositivo de bloque: b
- Archivo de caracter especial: c
- Enlace simbolico: l
- Tuberia nombreada (FIFO): p
- Zocalo de cominio (socket): s

- El siguiente grupo de 3 caracteres es de: propietario del archivo
- Permisos del grupo
- los ultimos 3: Permisos del resto de usuarios del sistema

### Buscar archivos


- $ locate file.text // antes de usarlo, se debe updatear la base de datos:
- $ sudo updatedb // ahora si se puede usar el comando locate

- $ whereis echo // se usa para encontrar archivos binarios del sistema
`
$ whereis python
`

### Find, busca en directorios siguiente una serie de criterios
- $ find . -user ss -perm 644 // busca en el directorio actual, que pertenecan a ss y que tengan permisos 644
- $ find . -user ss // busca desde el directorio actual (.) todos los archivos que pertenezcan al usuario ss
- $ find . -type f -mtime +7 // buscan solo files (f) modificados hace mas de 7 dias (+7)
- // con find, tambien se puede ejecutar comandos adicionales, en este caso, cp (copy), los curly brackets son para indicar donde debe ir el nombre del archivo encontrado;
- // Se debe cerrar el comando con \; ... tal cual, see example as follows:
```$
find . -type f -mtime +7 -exec cp {} ./backup/ \;
```

### Interaccion con paginas web/files en la web, desde la terminal;
```
$ curl // devuelve el codigo directamente de la pagina
$ wget // descarga arvhivos desde un servidor web
$ curl https://platzi.com
$ curl -v https://platzi.com // incluye peticiones HTTP
$ curl -v https://platzi.com > /dev/null // bota la salida estandar a /dev/null osea no la muestra
$ wget pagina.com/file.pdf // guarda el file pdf en tu laptop
```


# Markdown Cheatsheet

1. [md cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)



# npm common commands:

1.


# Github 

1. https://docs.github.com/en/get-started/quickstart/fork-a-repo

2. Setup a ssh key: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent]
	- $ ssh-keygen -t ed25519 -C "your_favorite_name@example.com"
	- $ eval "$(ssh-agent -s)"
	- $ ssh-add ~/.ssh/id_ed25519

3. Make git stop asking for credentials:
	- `git remote set-url origin git@github.com:username/repo.git`
	- `git config --global credential.helper store`
	- `git config --global credential.helper cache`
	 - Examples:
	 	- `git remote set-url origin git@github.com:sdsanchezm/kommandozeile-all.git`
		- `git remote set-url origin git@github.com:sdsanchezm/typescript-all.git` 

4. get the actual list of remotes:
	- `git remote -v`
	- `git branch -r`

5. undo `add` in git:
    - `git restore --staged pFinal/migrations/0001_initial.py`

	 	- `git remote set-url origin git@github.com:sdsanchezm/kommandozeile-all.git`

6. restore previously added file:
	- `$ git restore --staged directory_uild/maininUnit/.vscode/`

# hexedit

- official page: [https://linux.die.net/man/1/hexedit#:~:text=COMMANDS%20(full%20and%20detailed),move%20n%20times%20the%20cursor.](https://linux.die.net/man/1/hexedit#:~:text=COMMANDS%20(full%20and%20detailed),move%20n%20times%20the%20cursor.)[]

- to find:
	- `/`
- look for a sector
	- `[enter]
- save
	- F2
- undo all
	- Ctrl + u
- close
	- Ctrl + c
- navigate
	- PgUp and PgDown
- open with sectors and colors
	- hexedit -s --color [file]

## Adding Repos to Fedora 36:

- The file extension should be `.repo`
- Commands: 
	- `dnf config-manager --add-repo repository`
		- OR
	- `dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo`

- And then install (or update and install):
  - `sudo dnf install <package-name>`

- In Linux Fedora 36, repos are installed under:
	- `/etc/yum.repos.d/`

- Source: 
	- [https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/]
  - [https://copr.fedorainfracloud.org/coprs/mbriza/recordmydesktop/]


### ytb-dl

- Command:
  - `ytb-dl -x --audio-format mp3 vURL`

### ffmpeg mp4 extract mp3 

- Option 1:
  - `ffmpeg -i video.mp4 -b:a 192K -vn music.mp3`
  - This option may also work:
    - `ffmpeg -i filename.mp4 filename.mp3`

### Regex

- Regex nice documentatioin: [https://jdhao.github.io/2019/02/28/sublime_text_regex_cheat_sheet/]
- To Replace:
	- `^([A-Za-z]+)$`
	- `"$1",`

### oh my zsh

- Link: [https://ohmyz.sh/#install]

### curl

- get request:
    - `curl http://127.0.0.1:8000/test/student/ | json`
    - previous glbaly install json: `npm install -g json`

- post method:
    - documentation at: [https://curl.se/docs/httpscripting.html](https://curl.se/docs/httpscripting.html)
    - `curl --data "birthyear=1905&press=%20OK%20" http://www.example.com/api/someendpoint.cgi`
    - first send a POST and then GET:
        - `curl -d score=10 http://example.com/post.cgi --next http://example.com/results.html`
    - two GET:
        - `curl http://url1.example.com http://url2.example.com`
    - two POST:
        - `curl --data name=curl http://url1.example.com http://url2.example.com`

    - ```curl -X POST https://reqbin.com/echo/post/json 
       -H "Content-Type: multipart/form-data"
       -d '[post data]'
       ```

- Documentation
    - [https://reqbin.com/req/c-g5d14cew/curl-post-example]
    - Great examples: [https://gist.github.com/subfuzion/08c5d85437d5d4f00e58](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58)


### fish shell

- Documentation: [https://fishshell.com/docs/current/cmds/alias.html]
- Config alias dir: `~/.config/fish/config.fish`
- Alias config: `alias p="clear;ls -l;pwd"`


### nvm (nodejs management)

- Link: [https://www.freecodecamp.org/news/node-version-manager-nvm-install-guide/] 
- Some commands:
	- First: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash` or:
	- `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash` 
	- Update `~/.zshrc` or `~/.bash_profile`
	- Export the config:
		- `export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" `
	- Reload: `source ~/.bashrc` or `source ~/.zshrc`


### apache 2 in Fedora

- [https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-apache-http-server/]


### oh-my-posh Powershell and windows Terminal

- install Powershell:
	- Get it: [https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3)

- Install Windows Terminal:
	- Get it: [https://github.com/microsoft/terminal/releases](https://github.com/microsoft/terminal/releases)

- New Colors: 
	- General: [https://windowsterminalthemes.dev/](https://windowsterminalthemes.dev/)
	- Dracula dark theme: [https://draculatheme.com/windows-terminal](https://draculatheme.com/windows-terminal)
	- Material Theme: [https://github.com/julianlatest/material-windows-terminal](https://github.com/julianlatest/material-windows-terminal)
	- to install: in WT > Settings > Open Json

- Nerd fonts:
	- fonts: [https://github.com/ryanoasis/nerd-fonts/](https://github.com/ryanoasis/nerd-fonts/)
	- Releases: [https://github.com/ryanoasis/nerd-fonts/releases](https://github.com/ryanoasis/nerd-fonts/releases)
	- extract qand instal in windows

- Oh-My-Posh:
	- Oh my posh site: [https://ohmyposh.dev/docs/](https://ohmyposh.dev/docs/)
	- (make sure winget is installed)
	- To Install `winget install JanDeDobbeleer.OhMyPosh -s winget`
	- to update: [winget upgrade JanDeDobbeleer.OhMyPosh -s winget]
	- Enable the defaul setup `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"`
		- The result after this can be run to get the theme
	- Run `Get-PoshThemes` to get themes and examples and instructions in what ps1 variable should change
	- Include the name of the theme under `C:\Users\ss\Documents\PowerShell` 
		- It should look like this: 
		```
		& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\blue-owl.omp.json" --print) -join "`n"))
		```
	- get the shell what you are in: `oh-my-posh get shell`
	- Edit the profile script: `notepad $PROFILE`
		- If the above error, then `New-Item -Path $PROFILE -Type File -Force`
	- To Reaload: `. $PROFILE`
	- Path to themes: `C:\Users\<uruser>\AppData\Local\Programs\oh-my-posh\themes\unicorn.omp.json` or `$env:POSH_THEMES_PATH` (and press enter)
- wget like in posh:
	- Example:
	```
	$client = new-object System.Net.WebClient
	$client.DownloadFile("http://www.example.com/file.txt","C:\temp\file.txt")
	or
	(new-object System.Net.WebClient).DownloadFile('http://www.example.com/file.txt','C:\temp\file.txt')
	```
- pass
