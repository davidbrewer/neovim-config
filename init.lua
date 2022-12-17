-- A few handy aliases
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Set Leader
g.mapleader = "\\"

local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('my.helpers')
load('my.plugins')
load('my.coc-config')

-- Quickly edit/reload the vimrc file
nmap("<leader>ev", ":e ~/.config/nvim/init.lua<cr>")
nmap("<leader>sv", ":so ~/.config/nvim/init.lua<cr>")

-- Interface Options
opt.number = true           -- line numbers
opt.mouse = ''              -- mouse support off
opt.cursorline = true       -- highlight current line
opt.title = true            -- set terminal title
opt.linebreak = true        -- soft wrapping of text
opt.scrolloff = 3           -- scroll offset (show this many lines ahead)
opt.sidescrolloff = 5       -- horizontal scroll offset
opt.confirm = true          -- prompt to save before quitting
opt.wrap = false            -- Do not wrap long lines
opt.autoindent = true       -- Indent at the same level of the previous line
opt.joinspaces = false      -- Prevents inserting two spaces after 
                                -- punctuation on a join (J)
opt.virtualedit = 'onemore' -- Allow for cursor beyond last character
opt.history = 1000          -- Store a ton of history (default is 20)
-- opt.updatetime = 250     -- refresh time in ms (after done typing)
-- opt.lazyredraw = true    -- postpone redraw on macro execution for perf

-- Better Unix / Windows compatibility
opt.viewoptions = 'folds,options,cursor,unix,slash'

-- Highlight invisible characters using these defined options
opt.list = true
opt.listchars = 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·'

-- Add support for 'paste mode', which allows you to mass paste text 
-- without it getting munged.
opt.pastetoggle = '<F2>'

-- Let's highlight column 80 (but gray, to be subtle)
-- TODO: figure out what is wrong with this after getting color scheme setup
opt.colorcolumn = '80'
cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]]

-- Color Scheme Options
opt.termguicolors = true
cmd 'colorscheme NeoSolarized'
g.neosolarized_contrast = 'high'
g.neosolarized_bold = 1
g.neosolarized_underline = 2
g.neosolarized_utalic = 1
opt.background = 'dark'

-- Spelling
opt.spelllang = 'en_us'

-- Buffers
opt.hidden = true     -- enable use of buffers
opt.autoread = true   -- autoload external changes

-- Indentation
opt.tabstop = 4       -- number of spaces that a tab displays as
opt.shiftwidth = 4    -- number of spaces that a tab inserts
opt.expandtab = true  -- convert typed types to spaces

-- Session
opt.backup = false     -- Keep no backup files
opt.writebackup = true --... except while saving over a file
opt.undofile = true    -- Track undos
opt.undolevels = 1000  -- Maximum number of changes that can be undone
opt.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

-- Configure NERDCommenter
g.NERDDefaultAlign = 'left'
g.NERDCommentEmptyLines = 1
g.NERDTrimTrailingWhitespace = 1
g.NERDSpaceDelims = 1

-- Telescope configuration
-- Other picker suggestions can be found here: https://github.com/nvim-telescope/telescope.nvim#pickers
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})     -- find any file
vim.keymap.set('n', '<leader>g', builtin.git_files, {}) -- find file in git
vim.keymap.set('n', '<leader>c', builtin.git_bcommits, {}) -- interact with buffer git commits
vim.keymap.set('n', '<leader>C', builtin.git_commits, {}) -- interact with git commits
vim.keymap.set('n', '<leader>ag', builtin.live_grep, {})  -- grep through all files
vim.keymap.set('n', '<leader>b', builtin.buffers, {})    -- navigate buffers
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})  -- search help tags

-- Treesitter configuration
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = 'all',
    highlight = {enable = true},
    indent = {enable = true}
}
opt.foldmethod="expr"
opt.foldexpr="nvim_treesitter#foldexpr()"
opt.foldenable=false


--[[

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" remap up and down so that they don't jump past wrapped lines
nnoremap j gj
nnoremap k gk


"" Windows
" Open new split window to the right for vertical
" and below for horizontal. Both for regular windows
" and for netrw.
set splitbelow
set splitright
let g:netrw_altv=1
let g:netrw_alto=1

"" Search
set ignorecase         " ignore case in searches...
set smartcase          " ...unless the search contains caps
" No search highlighting while in insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
" CTRL-L clears all search highlights
nnoremap <C-l> :nohlsearch<CR><C-l>
set gdefault           " by default, replace all cases on the line


"" Folds
let g:SimpylFold_docstring_preview = 1

"" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Defines a function which calls NERDTreeFind if we have an open
" buffer, but NERDTreeToggle if we don't. This makes it so we can
" always open NERDTree in the appropriate directory.
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

map <leader>e :call NERDTreeToggleInCurDir()<CR>
nmap <leader>nt :call NERDTreeToggleInCurDir()<CR>


" Markdown
let g:vim_markdown_folding_disabled = 1

"" NetRW
let g:netrw_banner = 0

"" Linting
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\   'python': ['flake8'],
\}

" lint when we change text in normal mode
let g:ale_lint_on_text_changed = 'normal'

" lint when we leave insert mode
let g:ale_lint_on_insert_leave = 1


" To lint python, you must execute flake8 using the version of python
" which you want to lint!
let g:ale_python_flake8_executable = 'python2'
let g:ale_python_flake8_options = '-m flake8'

"" Python
let g:python_host_prog = '/Users/davidbrewer/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/davidbrewer/.pyenv/versions/neovim3/bin/python'

"" Elm
let g:ale_elm_format_executable = 'elm-format'
let g:ale_elm_format_use_global = 1
let g:ale_elm_format_options = '--yes --elm-version=0.19'

"" Filetypes
autocmd BufRead,BufNewFile *.jinja2 setfiletype jinja2
autocmd BufRead,BufNewFile *.css,*.scss,*.js,*.ts,*.json,*.rb,*.html,*.jinja  set shiftwidth=2 softtabstop=2

"" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <C-p> :FZF<cr>
nnoremap <leader>fz :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>ag :Ag<cr>
nnoremap <leader>g :GFiles?<cr>
nnoremap <leader>t :BLines<cr>
nnoremap <leader>T :Lines<cr>
nnoremap <leader>c :BCommits<cr>
nnoremap <leader>C :Commits<cr>

"" Rooter
" When we automatically change root directory... do it silently.
let g:rooter_silent_chdir = 1

"" HTML
let g:closetag_filenames = '*.html,*.jinja2'

" Fugitive {
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Gclog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>ga :Git add .<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
"}


""
"" RESCUES: Stuff brought over from my old config
""

" custom copy'n'paste
" slightly modified version of tip from brudermarkus on vim.wikia.com
" use leader y to yank content to a temporary buffer file, leader p
" to paste it. This supports pasting between instances of vim.
vmap <silent> <leader>y :w! ~/.vbuf<CR>
nmap <silent> <leader>y :.w! ~/.vbuf<CR>
nmap <silent> <leader>p :r ~/.vbuf<CR>


" Map F1 to Esc, since that's what I'm usually reach for when I 
" accidentally hit it!
map <F1> <Esc>
imap <F1> <Esc>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Since I use an aliased grep, tell various parts of the config to 
" use a raw grep instead
let g:gitgutter_escape_grep = 1
"set grepprg=grep\ -nH

" Map F5 to a simple menu of buffers 
nnoremap <F5> :buffers<CR>:buffer<Space>

" Remove period from keyword definition, so that
" motions stop at periods.
set iskeyword-=.      " '.' is an end of word designator
set iskeyword-=#      " '#' is an end of word designator
set iskeyword-=-      " '-' is an end of word designator

" Toggle line numbers and signs column
nmap <silent> <leader>l :set invnumber<CR>:SignifyToggle<CR>

" bind leader-k to search for word under cursor
map <silent> <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Strip whitespace {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer>  call StripTrailingWhitespace()
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Easier formatting
nnoremap <silent> <leader>q gwip

" Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }
"
" vim-airline {
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.
    let g:airline_powerline_fonts=1

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'
    if !exists('g:airline_theme')
        let g:airline_theme = 'solarized'
    endif
    if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
    endif

    " ale integration with airline 
    let g:airline#extensions#ale#enabled = 1

    " replace parts of airline status bar we aren't using with information we can
    "let g:airline_section_b = '%{getcwd()}'
    "let g:airline_section_c = '%t'
" }

" Don't echo bufferline to the command bar
let g:bufferline_echo = 0

""
"" GRAVEYARD: Commented stuff I may delete
""

" start out files with all folds opened
" autocmd Syntax * normal zR
" let g:DisableAutoPHPFolding = 1

" ... add ignore rules
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" don't remember position in svn and git commit temporary files
"let g:skipview_files = ['*\.vim', 'svn-commit\.*', 'COMMIT_EDITMSG']"

"Plug 'sgur/vim-editorconfig'


" let's turn off arrow keys to get used to using the proper keys for
" navigation
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Easy window navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

--]]
