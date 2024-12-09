#!/bin/bash

# ssfs structure
folders=(
    "progs"
    "temp"
    )

# install apps
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


create_folders(){
    for folder in ${folders[@]}; do
        mkdir ~/$folder
    done
}

install_ssfs(){
    sudo apt update 
    for app in ${apps[@]}; do
        sudo apt install $app -y
    done
}

install_ssfs2(){
    sudo apt update && sudo apt install ${apps[@]}
}

create_folders
install_ssfs
