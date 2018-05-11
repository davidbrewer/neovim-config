neovim-config
=============

My configuration files for neovim.

This is a pretty rough, disorganized, mixed-bag of settings. But it's 
working for me so far and is a good upgrade from what I was doing before,
which was entirely based on the excellent (but getting outdated) spf13-vim 
distribution. 

Thanks to @valignatev, whose nvim configuration I used as a starting point.

Basic install instructions:

    sudo aptitude install silversearcher-ag neovim
    git clone https://github.com/davidbrewer/neovim-config ~/.config/nvim
    nvim
    # Within nvim, run :PlugInstall
