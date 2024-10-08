# Notes

## .vimrc location
- `~/.vimrc`


## Folder location
- `~/.vim`


## Vundle (Plugin Manager easy to install)
- [https://github.com/VundleVim/Vundle.vim/]
- requires:
    - create the folder `~/.vim/bundle`
    - clone the repo: *Vundle.vim* (from the link above)
    - paste initializer into the .vimrc file
    - run `:PluginInstall` in vim (might want to edit the file)
    - done
- Plugin command when in vim
    - :PluginList (lists configured plugins)
    - :PluginInstall (installs plugins)
    - :PluginSearch foo (searches for foo)
    - :PluginClean (confirms removal of unused plugins)


## Themes
- [https://vimcolorschemes.com/i/trending/b.dark/e.vim]
- Favorite theme compatible w/ vimrc and PluginInstall
    - [https://github.com/NLKNguyen/papercolor-theme]
        - just add *Plugin 'NLKNguyen/papercolor-theme'* to the *.vimrc* file 
        - update at the end of the *.vimrc* file
            - *set background=dark* 
            - *colorscheme PaperColor*
    - Lua theme:
        - [https://github.com/folke/tokyonight.nvim]


### Source
- [https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/]


