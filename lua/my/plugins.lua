
return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'scrooloose/nerdcommenter'
    use 'overcache/NeoSolarized'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'

    -- If having issues with folders, refer to: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Requires local dependencies: ripgrep (rg) and fd
    -- Install those using homebrew: `brew install ripgrep fd`
    use {
        'nvim-telescope/telescope.nvim',
         branch = '0.1.x',
         requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        tag = 'nightly',
    }

    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

end)

--[[

ICEBOX: plugins that I might back in later depending on how things go


Plug 'w0rp/ale'
Plug 'alvan/vim-closetag'
Plug 'bling/vim-bufferline'
Plug 'hail2u/vim-css3-syntax'
" Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'
Plug 'wlangstroth/vim-racket'
Plug 'leafgarland/typescript-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'lambdatoast/elm.vim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'godlygeek/tabular'  " vim-markdown dependency
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

--]]



