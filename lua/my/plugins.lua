
return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'scrooloose/nerdcommenter'
    use 'overcache/NeoSolarized'
    use 'tpope/vim-fugitive'

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'  " vim-markdown dependency
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax'
" Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-rooter'
Plug 'wlangstroth/vim-racket'
Plug 'leafgarland/typescript-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-dotenv'
Plug 'lambdatoast/elm.vim'

Plug 'lukas-reineke/indent-blankline.nvim'


-- Skipped these for now, maybe don't include?
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
--]]



