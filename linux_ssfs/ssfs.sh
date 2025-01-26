#!/bin/bash

pm="dnf"

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

#create_folders
# install_ssfs
pm_update
