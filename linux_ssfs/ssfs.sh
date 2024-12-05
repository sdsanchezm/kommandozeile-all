#!/bin/bash

# ssfs structure
folders = (
    "progs",
    "temp"
    )

# install apps
apps = (
    "git",
    "zsh",
    "vim",
    "ssh",
    "terminator",
    "guake",
    "gcc",
    "make",
    "perl",
    "wget",
    "pgp",
    "gnupg",
    "curl"
)

create_folders(){
    foreach (folder in @folders){
        mkdir folder
    }
}

for app in apps:
do
    echo "$app"
end