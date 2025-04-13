## WSL 

### Install ubuntu
- `wsl --install -d ubuntu`

### Set default wsl version
- `wsl --set-default-version 2`

### list distros
- `wsl --list --online`
- `wsl -l` or `wsl --list`

### login in
- using user ss
    - `wsl -d fedora -u ss`
- default login:
    - `wsl -d fedora`
- defaul user in distro when logged in
    - edit/create `/etc/wsl.conf`
        - 
        ```
        [user]
        default = ss
        ```
- init `systemd` at boot time
    - edit/create `/etc/wsl.conf`
        - 
        ```
        [boot]
        systemd=true
        ```

### wsl update restart
- `wsl -h` => help
- `wsl --update` => just update
- `wsl --shutdown` => restart wsl

### import a distro from local file
- `wsl --import <name> <location> <image>`
- `wsl --import fedoracloud C:\VMsAll\wsl\fedora C:\apps_VMs\fedoraCloudTar\fedora-20240929.tar`
- run the above:
    - `wsl -d fedoracloud`
- validate
    - `wsl -l`
- file source:
    - [https://github.com/fedora-cloud/docker-brew-fedora/tree/40/x86_64]

### import and export
- `wsl --export <distro> <fedora.tar>`
    - `wsl --export fedoracloud C:\VMsAll\fc.tar`
- `wsl --import <name> <destination> <tar file location>`
    - `wsl --import fc C:\VMsAll\wsl\fc\ C:\VMsAll\fc.tar`

### once in
- install libs to create secure pass, create user and change pass
    - `sudo dnf install -y util-linux passwd cracklib-dicts`
    - `useradd -G wheel ss`
    - `passwd ss`
- install sw all
    - `sudo dnf install git curl wget vim neovim zsh`
- Start wsl fedora w/ new user:
    - `wsl -d fedora -u ss`

### Remove a distro from wsl
- `wsl --unregister <name>`
    - `wsl --unregister fedora`

### wsl version
- `wsl -v`

### Documentation
- [https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-1---enable-the-windows-subsystem-for-linux](https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-1---enable-the-windows-subsystem-for-linux)
- [https://dev.to/bowmanjd/install-fedora-on-windows-subsystem-for-linux-wsl-4b26]

