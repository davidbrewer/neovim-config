
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
    use 'alvan/vim-closetag'

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

    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'lewis6991/spaceless.nvim'

end)

--[[

ICEBOX: plugins that I might back in later depending on how things go


Plug 'w0rp/ale'
Plug 'airblade/vim-rooter'


Plug 'godlygeek/tabular'  " vim-markdown dependency
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'

--]]



