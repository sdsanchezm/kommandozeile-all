# kommandozeile-all

_Description:_ Summary of command Line and helpful tools to improve efficiency and enablers to deploy and abstract even more.

## Table of Contents

- [kommandozeile-all](#kommandozeile-all)
  - [Table of Contents](#table-of-contents)
  - [vim editor](#vim-editor)
  - [Linux Terminal](#linux-terminal)
    - [plugins and stuff](#plugins-and-stuff)
    - [LazyVim](#lazyvim)
- [From the course](#from-the-course)
    - [utilidades batch:](#utilidades-batch:)
    - [advanced bash utilities](#advanced-bash-utilities)
    - [sed](#sed)
    - [awk](#awk)
    - [user linux](#user-linux)
  - [Data processing](#data-processing)
    - [terminal data flow](#terminal-data-flow)
    - [users in linux o unix](#users-in-linux-o-unix)
    - [operations](#operations)
    - [permissions](#permissions)
    - [find files](#find-files)
    - [Find directories in a series of criteria](#find-directories-in-a-series-of-criteria)
    - [Multiple web pages intaraction](#multiple-web-pages-intaraction)
- [Markdown Cheatsheet](#markdown-cheatsheet)
- [npm common commands](#npm-common-commands)
- [Github](#github)
    - [Initialize git (locally) the correct way](#initialize-git-(locally)-the-correct-way)
- [hexdump](#hexdump)
- [hexedit](#hexedit)
- [Adding Repos to Fedora 36](#adding-repos-to-fedora-36)
  - [ytb-dl](#ytb-dl)
    - [ffmpeg mp4 extract mp3](#ffmpeg-mp4-extract-mp3)
    - [Regex](#regex)
    - [oh my zsh](#oh-my-zsh)
    - [curl](#curl)
    - [fish shell](#fish-shell)
    - [nvm (nodejs management)](#nvm-(nodejs-management))
    - [apache 2 in Fedora](#apache-2-in-fedora)
    - [Fedora Linux Network Manager (DOWN and UP) restarting a Net interface](#fedora-linux-network-manager-(down-and-up)-restarting-a-net-interface)
    - [oh-my-posh Powershell and windows Terminal](#oh-my-posh-powershell-and-windows-terminal)
    - [Windows ip addresses](#windows-ip-addresses)
      - [posh usefull data](#posh-usefull-data)
    - [wget](#wget)
    - [Docker](#docker)
    - [dos2unix and unix2dos](#dos2unix-and-unix2dos)
  - [SSH Server](#ssh-server)
    - [SCP](#scp)
  - [PowerShell](#powershell)


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

9. the "\* and "+ paste the clipboard into the insert mode

10. undo
- `u`
- or: `:u`
- or: `:undo`
- or: `:undo 3`

11. Go to the beggining of the file
    - `gg`

12. Delete the whole text file
    - `dG`

## Linux Terminal 

### plugins and stuff

-   This is an example of .vimrc

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

-   To install plugins at:

```
:PlugInstall
```

-   To Update, maybe:

```
:PlugUpdate
```

-   The repo to get all plugin, is:

```
sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

-   Instructions at:

```
https://github.com/junegunn/vim-plug
```

### LazyVim 

- [https://www.lazyvim.org/installation]
- [https://github.com/LazyVim/starter]
- quick start:
    - `git clone https://github.com/LazyVim/starter ~/.config/nvim`
    - `rm -rf ~/.config/nvim/.git`
    - `nvim`

# From the course

##

### utilidades batch:

-   cat // mostrar contenido completo
-   head // mostrar la cabeza del archivo, first 10 lines
-   tail // last 10 lines
-   $ tail -n 20 file.txt // last 20 lines

### advanced bash utilities

-   grep // permite trabajar con archivos regulares, busca lineas
-   $ grep -i "hanks'),$" dump1.sql // aca el $ quiere decir, el resto
-   $ grep "^keyword" file.txt // todo lo que esta al inicio
-   $ grep "keyword$" file.txt // todo lo que esta al final

### sed

-   sed // sed is stream editor, usa mucho expresiones regulares
-   sed 's/Hanks/Selleck/g' dump1.sql // no modifica el archivo, solo crea un nuevo flujo
-   $ sed '$d' nuevasPelis.csv // borra la ultima linea
-   $ sed 's/USER_NAME/ana10/' file.txt
-   $ sed 's/USER_NAME/ana10/; s/USER_POINTS/34' file.txt
-   $ echo "the new car is the most incredible machine in a town" | sed 's/a town/the world/'
-   $ sed -f myfileWithCommands myFile // to use a file with commands
-   $ s/pattern/replacement/flags // the flags could be g, A, p, w
-   si el flag es un numero, entonces ese es el numero de ocurrencia;
-   g es global, todas las ocurrencias
-   p imprime patron original, cada linea que tiene una coincidencia
-   w, guarda en un file especifico
-   more info at: https://likegeeks.com/es/sed-de-linux/

### awk

-   awk // sirve para trabajar con textos estructurados, como csv, o separados por tabs o similares
-   $ awk -F ';' '{ print $1}' nuevasPelis.csv // esto imprime la primera columna
-   $ awk -F ';' 'NR > 1 && $3 > 0 { print $1, $3 * $4 }' nuevasPelis.csv // imprime number row mayor que 1, y columna 3, $3 es mayor que 0, e imprime con esa condicion, la columna 1 ($1) y la columna 3 por la 4 ($ \* $4)

### user linux

-   Change owner and group of a file:
    ```sh
    	sudo chown 1001:1002 example.txt
    	sudo chown username example.txt
    	sudo chgrp groupname example.txt
    	sudo chown aspen:seamus /var/opt/test
    ```

## Data processing

### terminal data flow

-   entrada estandar
-   salida estandar
-   error estandar

-   Los flujos estan conectados a los perifericos

-   redireccion: cambiar la entrada del teclado a un archivo:

```
$ mysql -h 127.0.0.1 -u root -p1234 < dump1.sql // usando el menor que
```

-   Redireccionamiento de salida, de pantalla a un archivo:

```
$ ls > file_ls.txt // guarda la salida en un archivo
```

-   Con >> agrego el resultado al qarchivo que ya tenia;

-   pipes: |; toma lasalida de un proceso y se lo pasa a otro

```
$ ls -l | more
$ ls -l | wc // wc es word count
$ ls -l | wc -l // muestra cuantas lineas
```

-   Proceso en background:
    se pone un ampersan al final

```
$ ls -l > asd &
$ php infitine_loop.php & // se manda al backgound
```

-   Hay servicios que corren en el background, se llaman daemons
-   con Ctrl + z, se manda al background (segundo plano)
-   con Ctrl + c, lo cancelo (se interrumpe)
-   ps es para ver los pids y poder terminar servicios; ps es un proceso batch (or bash, idk)

```
$ ps ax
$ ps ax | grep init
```

-   top
    `$ top`

-   Para matar procesos:

```
$ kill -9 [pin number] // mata un proceso por pid
$ killall
```

### users in linux o unix

u - Owner of the file
g - Grups
o - Others
a - all

### operations

-   r - Leer, Read
-   w - Escribir, Write
-   x - ejecutar, Execute
- `+ agregar`
- `quitar`

### permissions

-   chmod (change mode):

```
$ chmod o-w file.txt
```

chown (change owner):
chgrp (change group):

-   Permisos Binarios (numeros en lugar de numeros):

-   Hay 10 columnas:
-   -rw-rw-r--. 1 ss ss 450 Nov 11 10:44 index.html

-   La primera es el tipo de archivo, esos tipos son:

-   archivo regular: -
-   Directorio: d
-   Archivo especial como dispositivo de bloque: b
-   Archivo de caracter especial: c
-   Enlace simbolico: l
-   Tuberia nombreada (FIFO): p
-   Zocalo de cominio (socket): s

-   El siguiente grupo de 3 caracteres es de: propietario del archivo
-   Permisos del grupo
-   los ultimos 3: Permisos del resto de usuarios del sistema

### find files

-   $ locate file.text // antes de usarlo, se debe updatear la base de datos:
-   $ sudo updatedb // ahora si se puede usar el comando locate

-   $ whereis echo // se usa para encontrar archivos binarios del sistema
    `$ whereis python`

### Find directories in a series of criteria

-   $ find . -user ss -perm 644 // busca en el directorio actual, que pertenecan a ss y que tengan permisos 644
-   $ find . -user ss // busca desde el directorio actual (.) todos los archivos que pertenezcan al usuario ss
-   $ find . -type f -mtime +7 // buscan solo files (f) modificados hace mas de 7 dias (+7)
-   // con find, tambien se puede ejecutar comandos adicionales, en este caso, cp (copy), los curly brackets son para indicar donde debe ir el nombre del archivo encontrado;
-   // Se debe cerrar el comando con \; ... tal cual, see example as follows:

```$
find . -type f -mtime +7 -exec cp {} ./backup/ \;
```

### Multiple web pages intaraction

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

# npm common commands

1. 

# Github

1. https://docs.github.com/en/get-started/quickstart/fork-a-repo

2. Setup a ssh key: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent]

    - Linux
        - `$ ssh-keygen -t ed25519 -C "your_favorite_name@example.com"`
        - `$ eval "$(ssh-agent -s)"`
        - `$ ssh-add ~/.ssh/id_ed25519`
        - the `.pub` to github; the private key to: `~/.ssh`
    - Windows (normally under `C:\Users\<ryzUser>\.ssh>`)
        - Generate the key
            - `ssh-keygen -t ed25519 -C "your_email@example.com"`
        - Make sure the service is up and set to manual
            - `Get-Service -Name ssh-agent | Set-Service -StartupType Manual`
            - `Start-Service ssh-agent`
        - Add the generated key
            - `ssh-add c:\Users\<USER>\.ssh\YourKeyFile`

3. Git stop asking for credentials:
    - `git remote set-url origin git@github.com:username/repo.git`
    - `git config --global credential.helper store`
    - `git config --global credential.helper cache`

    - Examples:
        - `git remote set-url origin git@github.com:sdsanchezm/kommandozeile-all.git`
        - `git remote set-url origin git@github.com:sdsanchezm/typescript-all.git`

    - List all config:
        - `git config --list --show-origin`
        - `git config --list`

4. get the actual list of remotes:
    - `git remote -v`
    - `git branch -r`
    - `git branch --all`
    - `git branch -a`

5. undo `add` in git:
    - `git restore --staged pFinal/migrations/0001_initial.py`
        - `git remote set-url origin git@github.com:sdsanchezm/kommandozeile-all.git`

6. restore previously added file:
    - `$ git restore --staged directory_uild/maininUnit/.vscode/`
    - Restore not stated file:
        - `git restore <file>`

7. to show you the difference between that COMMIT's ancestor and the COMMIT
    - `git diff COMMIT~ COMMIT`
    - To show the COMMITs data
        - `git show COMMIT`
    - simply to show waht will be included (**before push**)
        - `git show`
    - also
        - `git diff COMMIT`

8. return the initial state before making changes (careful, no undo)
    - `git checkout -- .`

9. list files commited so far
    - `git ls-tree --name-only -r <branch_name>`
    - `git ls-tree --name-only <branch> <dir>`
        - example: 
            - `git ls-tree --name-only main ./`

10. return committed file to stage (no losing changes)
    - `git reset --soft HEAD^` or `git reset --soft HEAD~1`
    - since git 2.23 
        - `git restore --staged ./file`

11. git stash changes
- Examples
    - `git stash` - save in stash
    - `git checkout other-branch` - checkout a different branch
    - `git stash apply` - bring up those changes 
    - `git stash apply <name>` - or (from above) indicate the stash name
    - `git stash drop` - drop the stash changes
    - `git stash list` - list stash
    - `git stash clear` - removes all stashes
    - `git stash pop` - brings changes from specific stash
    - `git stash push -m "message"` - save stash with a message


### Initialize git (locally) the correct way

- `git init .`
- `git commit --allow-empty -m "Initial commit"`

- the default name is in field "init.defaultbranch=main" in:
    - `git config -l`

- Check the config list:
    - `git config --list`

- Create a new branch
    - `git branch branch1`

- List all branches and check where are now
    - `git branch -a`
    - `git branch -l`
    - `git branch --list`

- Change branch
    - `git checkout main`
    - `git checkout branch1`

- Create and change branch in 1 command
    - `git checkout -b my-new-branch`

- Delete a branch
    - `git branch -d <branchName>`
    - Force:
        - `git branch -D <branchName>`

- Global git configuration
    - `$ git config --global user.name "sdsanchezm" (sdsanchezm is my name)`
    - `$ git config --global user.email "mySuperEmailExample@example.com" `

- The ".git" folder in a repository represents the local repository itself, not the staging area.

- correct a mistake overwriting history
    - `git add [FILE]`
    - `git commit --amend`
    - `git push --force`

# hexdump

- get the first hex digits of a file
    - `hexdump -n 3 -e'3/1 "%02X"'`
    - `hexdump -n 4 -e '4/1 "%02X"'`
    - `hexdump -C -n 160 filename`

    - MP3:
        - Hex: 49 44 33
        - ASCII: ID3
    - M4A (MPEG-4 Part 14 Audio):
        - Hex: 66 74 79 70
        - ASCII: ftyp
    - WAV (Waveform Audio File Format):
        - Hex: 52 49 46 46
        - ASCII: RIFF
    - FLAC (Free Lossless Audio Codec):
        - Hex: 66 4C 61 43
        - ASCII: fLaC
    - OGG (Ogg Vorbis):
        - Hex: 4F 67 67 53
        - ASCII: OggS
    - AAC (Advanced Audio Coding):
        - Hex: FF F1
        - ASCII: N/A (Starts with a syncword)
    - AIFF (Audio Interchange File Format):
        - Hex: 46 4F 52 4D
        - ASCII: FORM
    - WMA (Windows Media Audio):
        - Hex: 30 26 B2 75
        - ASCII: N/A (Starts with a GUID)
    - APE (Monkey Audio):
        - Hex: 4D 41 43 20
        - ASCII: MAC
    - ALAC:
        - Hex: 00 00 00 14 66 74 79 70
        - ASCII: ....ftyp

# hexedit

-   official page: [https://linux.die.net/man/1/hexedit#:~:text=COMMANDS%20(full%20and%20detailed),move%20n%20times%20the%20cursor.](<https://linux.die.net/man/1/hexedit#:~:text=COMMANDS%20(full%20and%20detailed),move%20n%20times%20the%20cursor.>)[]

-   to find:
    -   `/`
-   look for a sector
    -   `[enter]
-   save
    -   F2
-   undo all
    -   Ctrl + u
-   close
    -   Ctrl + c
-   navigate
    -   PgUp and PgDown
-   open with sectors and colors
    -   hexedit -s --color [file]

# Adding Repos to Fedora 36

-   The file extension should be `.repo`
-   Commands:

    -   `dnf config-manager --add-repo repository`
        -   OR
    -   `dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo`

-   And then install (or update and install):

    -   `sudo dnf install <package-name>`

-   In Linux Fedora 36, repos are installed under:

    -   `/etc/yum.repos.d/`

-   Source:
    -   [https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/]
    -   [https://copr.fedorainfracloud.org/coprs/mbriza/recordmydesktop/]

## ytb-dl

-   Command:
    -   `ytb-dl -x --audio-format mp3 vURL`

### ffmpeg mp4 extract mp3

-   Option 1:
    -   `ffmpeg -i video.mp4 -b:a 192K -vn music.mp3`
    -   This option may also work:
        -   `ffmpeg -i filename.mp4 filename.mp3`

### Regex

-   Regex nice documentatioin: [https://jdhao.github.io/2019/02/28/sublime_text_regex_cheat_sheet/]
-   To Replace:
    -   `^([A-Za-z]+)$`
    -   `"$1",`

### oh my zsh

-   Link: [https://ohmyz.sh/#install]

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
            ```
                curl -X POST https://reqbin.com/echo/post/json
                -H "Content-Type: multipart/form-data"
                -d '[post data]'
            ```
    - code
        ```
            curl -X POST -H "Content-Type: application/json" -d '{
            "name": "Jamecho",
            "schools": [1, 2, 3]
            }' http://localhost:8081/teachers/
        ```

    - Post Request using CURL Example:
        ```curl
        curl --location --request POST 'http://localhost:8081/student/school' \
        --header 'Content-Type: application/json' \
        --data-raw '{
            "name": "ticheMaria",
            "number": 21,
            "department": "Accounting",
            "courses": [
                {
                    "title": "Taxes",
                    "shortname": "tx1",
                    "modulenumber": 2,
                    "value": 1000
                },
                {
                    "title": "React JS",
                    "abbreviation": "RJS",
                    "modules": 11,
                    "fee": 1600
                }
            ]
        }'
        ```
    - GET method to obtain raw data
        ```curl
        curl --location --request GET 'http://localhost:8081/dept/1' \
        --data-raw ''
        ```


- Summary of the most used/important/relevant CURL commands:

    1. **Sending a GET Request**:
        ```
        curl https://example.com
        ```
    This command sends a GET request to the specified URL and prints the response to the console.

    2. **Sending a POST Request**:
        ```
        curl -X POST -d "key1=value1&key2=value2" https://example.com
        ```
    Use this command to send a POST request with data to a web server.

    3. **Adding Headers**:
        ```
        curl -H "Authorization: Bearer <token>" https://example.com
        ```
        Can add custom headers to your HTTP request, such as authorization headers.

    4. **Downloading a File**:
        ```
        curl -O https://example.com/file.zip
        ```
        This command downloads a file from the given URL and saves it with the same name locally.

    5. **Following Redirects**:
        ```
        curl -L https://example.com
        ```
        Use the `-L` option to instruct `curl` to follow redirects to their final destination.

    6. **Output to a File**:
        ```
        curl -o output.html https://example.com
        ```
        Save the content of the URL to a local file with a specific name.

    7. **Uploading a File**:
        ```
        curl -F "file=@localfile.txt" https://example.com/upload
        ```
        Upload a local file to a server using a multipart form POST request.

    8. **Authentication**:
        ```
        curl --user username:password https://example.com
        ```
        Include basic authentication credentials in your request.

    9. **Set a Timeout**:
        ```
        curl --connect-timeout 10 https://example.com
        ```
        Specify a maximum time for the request to complete.

    10. **Verbose Output**:
        ```
        curl -v https://example.com
        ```
        Get detailed verbose output, including request and response headers.

    11. **Ignore SSL Certificate Errors**:
        ```
        curl -k https://example.com
        ```
        Use the `-k` option to ignore SSL certificate verification (not recommended for production use).

    12. **HTTP PUT Request**:
        ```
        curl -X PUT -d "data" https://example.com/resource
        ```
        Send an HTTP PUT request with data to update a resource.

    13. **HTTP DELETE Request**:
        ```
        curl -X DELETE https://example.com/resource
        ```
        Send an HTTP DELETE request to delete a resource.

    14. **Performing Multiple Requests**:
        ```
        curl -sS "url1" -o "file1" "url2" -o "file2"
        ```
        Execute multiple requests in a single command.

    15. **Testing API Endpoints**:
        ```
        curl -X GET https://api.example.com/endpoint
        ```
        Useful for testing and troubleshooting APIs.

    16. **Using a Proxy**:
        ```
        curl -x proxy-server:port https://example.com
        ```
        Send requests through a proxy server.

        

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

-   [https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-apache-http-server/]

### Fedora Linux Network Manager (DOWN and UP) restarting a Net interface

- Install net-tools
	- `$ sudo dnf install net-tools`
- validate adapter name
	- `$ ifconfig`
	- `$ ip link`
	- `ip a`
	- `$ ifconfig enp0s3` // `enp0s3` is the adapter name in this case

- Put it down
	- `$ ifconfig enp0s3 down`
- validate
	- `$ ip a`
	- `$ ifconfig enp0s3` 
	- `$ ip link` // it should say `state DOWN`
- Put it up (might need sudo)
	- `$ ifconfig enp0s3 up`
- validate
	- `$ ip a`
	- `$ ifconfig enp0s3` 
	- `$ ip a | grep -A 1 "enp0s3"` 
	- `$ ip link` // it should say `state UP`
- Validate Network daemon
	- `$ systemctl status NetworkManager`
    

### oh-my-posh Powershell and windows Terminal

-   install Powershell:

    -   Get it: [https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3)

-   Install Windows Terminal:

    -   Get it: [https://github.com/microsoft/terminal/releases](https://github.com/microsoft/terminal/releases)

-   New Colors:

    -   General: [https://windowsterminalthemes.dev/](https://windowsterminalthemes.dev/)
    -   Dracula dark theme: [https://draculatheme.com/windows-terminal](https://draculatheme.com/windows-terminal)
    -   Material Theme: [https://github.com/julianlatest/material-windows-terminal](https://github.com/julianlatest/material-windows-terminal)
    -   to install: in WT > Settings > Open Json

-   Nerd fonts:

    -   fonts: [https://github.com/ryanoasis/nerd-fonts/](https://github.com/ryanoasis/nerd-fonts/)
    -   Releases: [https://github.com/ryanoasis/nerd-fonts/releases](https://github.com/ryanoasis/nerd-fonts/releases)
    -   extract qand instal in windows

-   Oh-My-Posh:
    -   Oh my posh site: [https://ohmyposh.dev/docs/](https://ohmyposh.dev/docs/)
    -   (make sure winget is installed)
    -   To Install `winget install JanDeDobbeleer.OhMyPosh -s winget`
    -   to update: `winget upgrade JanDeDobbeleer.OhMyPosh -s winget`
    -   Enable the defaul setup `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"`
        -   The result after this can be run to get the theme
    -   Run `Get-PoshThemes` to get themes and examples and instructions in what ps1 variable should change
    -   Include the name of the theme under `C:\Users\ss\Documents\PowerShell`
        -   It should look like this:
        ```
        & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\blue-owl.omp.json" --print) -join "`n"))
        ```
    -   get the shell what you are in: `oh-my-posh get shell`
    -   Edit the profile script: `notepad $PROFILE`
        -   If the above error, then `New-Item -Path $PROFILE -Type File -Force`
    -   To Reaload: `. $PROFILE`
    -   Path to themes: `C:\Users\<uruser>\AppData\Local\Programs\oh-my-posh\themes\unicorn.omp.json` or `$env:POSH_THEMES_PATH` (and press enter)
-   wget like in posh:

    -   Example:

    ```
    $client = new-object System.Net.WebClient
    $client.DownloadFile("http://www.example.com/file.txt","C:\temp\file.txt")
    or
    (new-object System.Net.WebClient).DownloadFile('http://www.example.com/file.txt','C:\temp\file.txt')
    ```

-   Install fonts (must be admin):

    -   `oh-my-posh font install`

-   directory, (cariable $PROFILE)

    -   `C:\Users\thereisalotofrice\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

-   ps1 file:

    -   \"& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\unicorn.omp.json" --print) -join "`n"))\"

-   variable `$env:POSH_THEMES_PATH`

    -   value: `C:\Users\ss\AppData\Local\Programs\oh-my-posh\themes\unicorn.omp.json`

-   theme name: `unicorn.omp.json`

    -   in folder `posh-theme` in this repo

-   font: `FiraCode Nerd Font`

### Windows ip addresses

- cd and cp to 'win/sys32/drivers/etc'
    ```
    127.0.0.1       localhost
    ::1             localhost
    127.0.0.1  activity.windows.com
    127.0.0.1  data.microsoft.com
    127.0.0.1  scorecardresearch.com
    127.0.0.1  azureedge.net
    127.0.0.1  msftconnecttest.com
    127.0.0.1  bingapis.com
    127.0.0.1  assets.msn.com
    127.0.0.1  data.msn.com
    127.0.0.1  edge.microsoft.com
    127.0.0.1  msedge.net
    ```

#### posh usefull data

- from: [https://ohmyposh.dev/docs/installation/windows]

- Install
    - `winget install JanDeDobbeleer.OhMyPosh -s winget`

- Update
    - `winget upgrade JanDeDobbeleer.OhMyPosh -s winget`

- Themes environment variable:
    - `POSH_THEMES_PATH`
- show the variable:
    - $env:POSH_THEMES_PATH
- Result:
    - `C:\Users\dieBesteMusikHinzufugen\AppData\Local\Programs\oh-my-posh\themes`

- Install Powershell 7
    - `Install Windows Terminal`

- Initialization in PowerShell
    - `use oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression `

- Set the env
    - `$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"`

- Install fonts
    - `oh-my-posh font install`

- get shell
    - `oh-my-posh get shell`

- create the profile file
    - `New-Item -Path $PROFILE -Type File -Force`

- Themes are at:
    - `C:\Users\dieBesteMusikHinzufugen\AppData\Local\Programs\oh-my-posh\themes`



### wget

-   wget all files in a folder:
    -   `wget -r -nH --cut-dirs=1 --no-parent --reject "index.html*" https://example.com/some/folder/my/dir-1/`
        -   `-r`: recursive
        -   `-nH`: avoid creating a host directory
        -   `--cut-dirs=1`: ignore the first directory folder in the url
        -   `--no-parent`: avoid ascending to parent dir
        -   `--reject "index.html*"`: exclude the "index.html\*" file

### Docker

-   this is a structure basic of the `.dockerignore` file
    ```
    **/.env
    **/.classpath
    **/.git
    **/.gitignore
    **/.settings
    **/.project
    **/.toolstarget
    **/.vs
    **/.vscode
    **/*.*proj.user
    **/*.dbmdl
    **/*.jfm
    **/.dockerignore
    **/Dockerfile*
    **/obj
    **/bin
    **/charts
    **/docker-compose*
    **/node_modules
    **/secrets.dev.yaml
    **/npm-debug.log
    **/azds.yaml
    **/values.dev.yaml
    LICENSE
    README.md
    ```


### dos2unix and unix2dos

- `dos2unix` transforms from \r ending to \n ending (codification for ending files in unix)
- `unix2dos` transforms from \n ending to \r ending (codification for ending files in win)


## SSH Server 

- sources: 
    - [https://linuxconfig.org/how-to-install-start-and-connect-to-ssh-server-on-fedora-linux]
    - [https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/OpenSSH/]
    - [https://www.digitalocean.com/community/tutorials/how-to-use-ssh-to-connect-to-a-remote-server]

- // install openssh server
    - `sudo dnf install openssh-server`

- // edit port 
- // uncomment line
`nvim /etc/ssh/sshd_config`

- // check
    - `sudo systemctl enable sshd`
    - `sudo systemctl start sshd`
    - `sudo systemctl status sshd`
    - `sudo ss -lt`

- // connect
    - `ssh username@fedora-ip-or-hostname`

### SCP 
- `scp ./data.txt kraus@192.168.100.123:/home/kraus/`

## PowerShell

- scripts at [./Posh]

- wget 
    - `Invoke-WebRequest -Uri <URL> -OutFile <OutputFile>`
    - `Invoke-WebRequest -Uri "https://example.com/file.zip" -OutFile "C:\path\to\save\file.zip"`
    - `Invoke-WebRequest -Uri "https://example.com/file.zip" -OutFile "C:\path\to\save\file.zip" -ShowProgress $true`

- rm
    - `Remove-Item -Path <Path> [-Recurse] [-Force]`
    - `Remove-Item -Path "C:\path\to\file.txt"`
    - `rm -rf`
        - `Remove-Item -Path "C:\path\to\directory" -Recurse -Force`

    - `-Path`: Specifies the path of the item (file or directory) to be removed.
    - `-Recurse`: Removes items in the specified directory and all its subdirectories. Use this parameter if you need to delete a - directory and its contents.
    - `-Force`: Allows the cmdlet to remove items that cannot otherwise be changed, such as read-only files or hidden files.

- grep
    - `Get-Content "C:\path\to\file.txt" | Select-String "search_pattern"`
    - `Get-Content "C:\path\to\file.txt" | Select-String "pattern"`
    - `Get-ChildItem -Recurse -Filter *.txt | Get-Content | Select-String "pattern"`

- `Get-Content`: This cmdlet reads the content of a file and sends it to the pipeline.
- `Select-String`: This cmdlet searches for text patterns in the input, which, in this case, is the content of the file.
- "C:\path\to\file.txt": Replace this with the path to the file you want to search.
- "search_pattern": Replace this with the pattern you want to search for. You can use regular expressions or simple strings.

- `"grep -IR 'NODE'"`
    - `Get-ChildItem -Recurse | Select-String -Pattern 'NODE'`
    - `Get-ChildItem -Recurse -Filter *.txt | Select-String -Pattern 'NODE'`







