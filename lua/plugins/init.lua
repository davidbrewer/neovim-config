return {
  {
    "overcache/NeoSolarized",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme NeoSolarized]])
    end
  },
  {"neovim/nvim-lspconfig", lazy = false},
  {"ms-jpq/coq_nvim", build = "python3 -m coq deps", lazy = false },
  {"ms-jpq/coq.artifacts", branch = "artifacts", lazy = false },
  {"ms-jpq/coq.thirdparty", branch = "3p", lazy = false },
  {
     "nvimtools/none-ls.nvim",
     dependencies = { "nvim-lua/plenary.nvim" },
     lazy = false
  },
  {"scrooloose/nerdcommenter"},
  {"tpope/vim-repeat"},
  {"tpope/vim-fugitive"},
  {"tpope/vim-surround"},
  {"lukas-reineke/indent-blankline.nvim", version = "v2.20.8"},
  {"ethanholz/nvim-lastplace"},
  {"mcauley-penney/tidy.nvim"},
  {"vim-autoformat/vim-autoformat"},
  -- Requires local dependencies: ripgrep (rg) and fd
  -- Install those using homebrew: `brew install ripgrep fd`
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make" }},
  },
  -- If having issues with folders, refer to: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  {"nvim-treesitter/nvim-treesitter", version = "v0.9.3", build = ":TSUpdate", lazy = false },
  {"nvim-treesitter/nvim-treesitter-textobjects" },

  {"nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, version = "v1.6.1"},
  {"lewis6991/gitsigns.nvim"},
  {"nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons", lazy = true}},
  {"akinsho/bufferline.nvim", version = "v4.*", dependencies = {"nvim-tree/nvim-web-devicons"}},
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {}
    end,
  },
}

-- TODO: I should probably move configuration for each plugin into its own init function instead of
-- handling it in separate files as I do now. Could conceivably move plugins with more complex
-- configuration into their own files?
--
-- {
--   "dstein64/vim-startuptime",
--   -- lazy-load on a command
--   cmd = "StartupTime",
--   -- init is called during startup. Configuration for vim plugins typically should be set in an init function
--   init = function()
--     vim.g.startuptime_tries = 10
--   end,
-- },
