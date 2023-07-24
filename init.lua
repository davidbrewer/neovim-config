-- A few handy aliases
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local api = vim.api -- to access Vim API

-- disabling netrw at the recommendation of nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set Leader
g.mapleader = "\\"

-- Enable python support
g.python3_host_prog = "/Users/davidbrewer/.pyenv/shims/python3"

local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load("my.helpers")
load("my.plugins")
-- load('my.coc-config')
load("my.lsp-config")

-- Quickly edit/reload the vimrc file
nmap("<leader>ev", ":e ~/.config/nvim/init.lua<cr>")
nmap("<leader>sv", ":so ~/.config/nvim/init.lua<cr>")

-- Interface Options
opt.number = true -- line numbers
-- opt.mouse = ''              -- mouse support off
-- opt.clipboard = 'unnamed'   -- use system clipboard when yanking
opt.cursorline = true -- highlight current line
opt.title = true -- set terminal title
opt.linebreak = true -- soft wrapping of text
opt.scrolloff = 4 -- scroll offset (show this many lines ahead)
opt.sidescrolloff = 5 -- horizontal scroll offset
opt.confirm = true -- prompt to save before quitting
opt.wrap = false -- Do not wrap long lines
opt.autoindent = true -- Indent at the same level of the previous line
opt.smartindent = true -- Attempt to autoindent following code syntax
opt.joinspaces = false -- Prevents inserting two spaces after
-- punctuation on a join (J)
opt.virtualedit = "onemore" -- Allow for cursor beyond last character
opt.history = 1000 -- Store a ton of history (default is 20)
opt.updatetime = 300 -- refresh time in ms (after done typing)
-- opt.lazyredraw = true    -- postpone redraw on macro execution for perf
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- search ignores case unless terms have uppercase

-- Better Unix / Windows compatibility
opt.viewoptions = "folds,options,cursor,unix,slash"

-- Highlight invisible characters using these defined options
opt.list = true
opt.listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·"

-- Add support for 'paste mode', which allows you to mass paste text
-- without it getting munged.
opt.pastetoggle = "<F2>"

-- Let's highlight column 80 (but gray, to be subtle)
-- TODO: figure out what is wrong with this after getting color scheme setup
opt.colorcolumn = "80"
cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])

-- Color Scheme Options
opt.termguicolors = true
cmd("colorscheme NeoSolarized")
g.neosolarized_contrast = "high"
g.neosolarized_bold = 1
g.neosolarized_underline = 2
g.neosolarized_utalic = 1
opt.background = "dark"

-- Spelling
opt.spelllang = "en_us"

-- Buffers
opt.hidden = true -- enable use of background buffers
opt.autoread = true -- autoload external changes

-- Indentation
opt.tabstop = 4 -- number of spaces that a tab displays as
opt.shiftwidth = 4 -- number of spaces that a tab inserts
opt.expandtab = true -- convert typed types to spaces
opt.shiftround = true -- use multiples of shiftwidth when indenting

-- Session
opt.backup = false -- Keep no backup files
opt.writebackup = true --... except while saving over a file
opt.undofile = true -- Track undos
opt.undolevels = 1000 -- Maximum number of changes that can be undone
opt.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

-- Easy window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Copy and paste to system clipboard
vim.keymap.set({ "n", "x" }, "cy", '"+y')
vim.keymap.set({ "n", "x" }, "cp", '"+p')

-- Configure NERDCommenter
g.NERDDefaultAlign = "left"
g.NERDCommentEmptyLines = 1
g.NERDTrimTrailingWhitespace = 1
g.NERDSpaceDelims = 1

-- Telescope configuration
-- Other picker suggestions can be found here: https://github.com/nvim-telescope/telescope.nvim#pickers
require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {}) -- find any file
vim.keymap.set("n", "<leader>g", builtin.git_files, {}) -- find file in git
vim.keymap.set("n", "<leader>c", builtin.git_bcommits, {}) -- interact with buffer git commits
vim.keymap.set("n", "<leader>C", builtin.git_commits, {}) -- interact with git commits
vim.keymap.set("n", "<leader>ag", builtin.live_grep, {}) -- grep through all files
vim.keymap.set("n", "<leader>b", builtin.buffers, {}) -- navigate buffers
vim.keymap.set("n", "<leader>h", builtin.help_tags, {}) -- search help tags

-- Treesitter configuration
-- If you find yourself wanting more textobjects:
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
local ts = require("nvim-treesitter.configs")
ts.setup({
	ensure_installed = "all",
	highlight = { enable = true },
	indent = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = true

-- reload folds when entering files; this is necessary to work around
-- bug where files opened via telescope don't have working folds:
-- https://github.com/nvim-telescope/telescope.nvim/issues/699
api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	command = "normal zx",
})

-- Windows
-- Open new split window to the right for vertical and below for horizontal.
opt.splitbelow = true
opt.splitright = true

-- Configuration for nvim-tree
require("nvim-tree").setup({
	renderer = { icons = { show = { file = true, folder = true, git = true } } },
	filters = {
		custom = {
			"\\.py[cd]$",
			"\\~$",
			"\\.swo$",
			"\\.swp$",
			"^\\.git$",
			"^\\.hg$",
			"^\\.svn$",
			"\\.bzr$",
		},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

nmap("<leader>e", ":NvimTreeToggle<CR>")
nmap("<leader>t", ":NvimTreeToggle<CR>")
nmap("<leader>tf", ":NvimTreeFindFile<CR>")

-- Gitsigns configuration
require("gitsigns").setup()

-- Toggle line numbers and signs column
opt.signcolumn = "number"
local function toggle_number_column()
	opt.signcolumn = opt.signcolumn:get() == "number" and "no" or "number"
	opt.number = not opt.number:get() and true or false
end
vim.keymap.set("n", "<leader>l", function()
	toggle_number_column()
end) -- search help tags

-- Fugitive configuration
nmap("<leader>gs", ":Git<CR>")
nmap("<leader>gd", ":Gdiff<CR>")
nmap("<leader>gc", ":Git commit<CR>")
nmap("<leader>gb", ":Git blame<CR>")
nmap("<leader>gl", ":Gclog<CR>")
nmap("<leader>gp", ":Git push<CR>")
nmap("<leader>ga", ":Git add .<CR>")
nmap("<leader>gr", ":Gread<CR>")
nmap("<leader>gw", ":Gwrite<CR>")
nmap("<leader>ge", ":Gedit<CR>")
-- Mnemonic _i_nteractive
nmap("<leader>gi", ":Git add -p %<CR>")
nmap("<leader>gg", ":SignifyToggle<CR>")

-- Lualine config
local lualine_theme = require("lualine.themes.base16")
require("lualine").setup({
	options = {
		theme = lualine_theme,
	},
	sections = {
		lualine_a = { {
			"mode",
			fmt = function(str)
				return str:sub(1, 1)
			end,
		} },
		lualine_b = { "filename" },
		lualine_c = { "branch", "diff", "diagnostics" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})

-- indent-blankline config
-- cmd[[highlight IndentBlanklineChar guifg=#364246 gui=nocombine]]
-- cmd[[highlight IndentBlanklineContextChar guifg=#657b83 gui=nocombine]]

-- require("indent_blankline").setup {
--  show_current_context = true,
--  show_trailing_blankline_indent = false,
--  show_first_indent_level = false,
--  show_current_context_start = false,
--  use_treesitter = true,
--  use_treesitter_scope = true,
--  char_blankline = '',
-- }

-- vim-closetag config
g.closetag_xhtml_filenames = "*.html,*.xhtml,*.jsx,*.jinja2"

-- tidy config
-- require('tidy').setup()

-- bufferline config
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})

-- Applying indentation keeps you in Visual mode
vmap("<", "<gv")
vmap(">", ">gv")

-- custom copy'n'paste
-- slightly modified version of tip from brudermarkus on vim.wikia.com
-- use leader y to yank content to a temporary buffer file, leader p
-- to paste it. This supports pasting between instances of vim.
vmap("<leader>y", ":w! ~/.vbuf<CR>")
nmap("<leader>y", ":.w! ~/.vbuf<CR>")
nmap("<leader>p", ":r ~/.vbuf<CR>")

-- Map F1 to Esc, since that's what I'm usually reaching for when I
-- accidentally hit it!
nmap("<F1>", "<Esc>")
imap("<F1>", "<Esc>")

-- Configure lastplace (remembers where you were when reopening files)
-- require('nvim-lastplace').setup {
--  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
--  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
--  lastplace_open_folds = true
-- }

-- Set indentation preferences by filetype
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*.lua",
		"*.css",
		"*.scss",
		"*.js",
		"*.ts",
		"*.json",
		".tsx",
		"*.rb",
		"*.html",
		"*.jinja",
		"*.jinja2",
		"*.jsx",
		"*.yaml",
		"*.yml",
	},
	command = "set shiftwidth=2 softtabstop=2",
})

-- Modify keyword definitions so that motions end at ., #, and -
opt.iskeyword:remove({ "." })
opt.iskeyword:remove({ "#" })
opt.iskeyword:remove({ "-" })

-- Configure hop
-- local hop = require('hop')
-- hop.setup{ keys = 'etovxqpdygfblzhckisuran' }
-- vim.keymap.set('', '<leader>h', ':HopWord<cr>', {silent = true})
-- vim.keymap.set('', '<leader>hc', ':HopChar1<cr>', {silent = true})
-- vim.keymap.set('', '<leader>hC', ':HopChar2<cr>', {silent = true})
-- vim.keymap.set('', '<leader>hl', ':HopLineStart<cr>', {silent = true})
-- vim.keymap.set('', '<leader>hp', ':HopPattern<cr>', {silent = true})

-- Configure lightspeed (instead of hop)
-- require('lightspeed').setup{}

-- Configure leap (instead of lightspeed)
-- require('leap').add_default_mappings()

-- Configure spectre
-- require('spectre').setup{}
-- Open Spectre
-- nmap('<leader>S', '<cmd>lua require(\'spectre\').open()<CR>')
-- Open Spectre with current word
-- nmap('<leader>sw', '<cmd>lua require(\'spectre\').open_visual({select_word=true})<CR>')
-- nmap('<leader>s', '<cmd>lua require(\'spectre\').open_visual()<CR>')
-- Spectre search in current file
-- nmap('<leader>sp', '<cmd>viw:lua require(\'spectre\').open_file_search()<CR>')

-- Configure fidget, which outputs LSP progress status
-- require("fidget").setup{}

-- Configure vim-autoformat to reformat on save
api.nvim_create_autocmd({ "BufWrite" }, {
	pattern = { "*" },
	command = ":Autoformat",
})

g.autoformat_autoindent = 0
g.autoformat_retab = 0
g.autoformat_remove_trailing_spaces = 0
