neovim-config
=============

My configuration files for neovim. This is a Lua based config.

Basic install instructions on Mac:

```
brew install fzf ripgrep fd
git clone https://github.com/davidbrewer/neovim-config ~/.config/nvim

# Install packer
mkdir -p ~/.config/nvim/pack/packer/start 
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.config/nvim/pack/packer/start/packer.nvim

# Run nvim and install packages
nvim
# run :PackerCompile
# run :PackerInstall
# close and reopen nvim
```

Installation should be similar on other platforms, but using package
management and config locations appropriate for your platform.

Note that things may be pretty slow at first while nvim downloads and compiles
dependencies such as treesitter languages.
