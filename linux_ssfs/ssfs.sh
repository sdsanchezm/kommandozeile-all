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
    for app in ${apps[@]}; do
        sudo apt update && sudo apt install $app -y
    done
}

create_folders
install_ssfs