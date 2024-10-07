# nvim general config

## Install
- Paste to the nvim folder into: `~/.config/nvim`
- Run `PackerSync`

## Dependencies:
- Could be more but there are the ones identified:
  - Run `checkhealth`
  - Identy from the report
    - gcc-g++
    - pynvim
    - packer nvim
    - neovim

### Documentation

- [https://github.com/nvim-treesitter/nvim-treesitter] 
- [https://github.com/nvim-lualine/lualine.nvim]
- [https://github.com/Shatur/neovim-ayu]
- [https://github.com/nvim-lualine/lualine.nvim]
- [https://github.com/wbthomason/packer.nvim#bootstrapping]
- [https://github.com/nvim-lua/kickstart.nvim]

### Packages 

- Packages `use` are installed on `nvim/packer-plugins.lua`
- "PackerSync" command might be required in nvim after.
- Packages configuration under `lua/nvim/plugins_config`.

### Keymaps

- Keymaps under `lua/keymaps`

### Toggles

- Ctrl + n - to toggle the folder preview 

### To add a new language

- Edit `tressitter.lua` under `lua/plugins_config`
