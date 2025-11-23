#!/bin/bash

# package manager
pm="dnf"

# command line short
rclines="
alias p='clear;exa -l;pwd'\n
alias o='git status'\n
alias oo='git log'\n
alias ooo='git log --oneline'\n
alias i='git pull'
mkcd() { mkdir -p "$1" && cd "$1" }
"

# ssfs/Files structure
folders=(
    "progs"
    "temp"
    "bilder"
    "apps"
    )

# apps/packages list
apps=(
    "git"
    "zsh"
    "vim"
    "ssh"
    "terminator"
    "guake"
    "gcc"
    "make"
    "perl"
    "wget"
    "pgp"
    "gnupg"
    "curl")


create_ssfs(){
    for folder in ${folders[@]}; do
        mkdir ~/$folder
    done
}

install_apps(){
    sudo ${pm} update 
    for app in ${apps[@]}; do
        sudo ${pm} install $app -y
    done
}

install_apps2(){
    sudo ${pm} update && sudo ${pm} install ${apps[@]}
}

pm_update(){
    sudo ${pm} update
}

generate_alias(){
    echo -e ${rclines} >> ~/.zshrc
}

#create_folders
# install_ssfs
generate_alias
# pm_update
