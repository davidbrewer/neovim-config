"" Leader
let mapleader='\'

"" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'flazz/vim-colorschemes'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'  " vim-markdown dependency
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-rooter'
Plug 'wlangstroth/vim-racket'
Plug 'leafgarland/typescript-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-dotenv'
Plug 'lambdatoast/elm.vim'

"Plug 'easymotion/vim-easymotion'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'

call plug#end()

"" Interface Options
set number             " line numbers
set updatetime=250     " refresh time in ms (after done typing)
set mouse=            " mouse support off
set cursorline         " highlight current line
set title              " set terminal title
set linebreak          " soft wrapping of text
set scrolloff=3        " scroll offset (show this many lines ahead)
set sidescrolloff=5    " horizontal scroll offset
set confirm            " prompt to save before quitting
set lazyredraw         " postpone redraw on macro execution for performance

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)


set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)

" Highlight invisible characters using these defined options
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Add support for 'paste mode', which allows you to mass paste text without it
" getting munged.
set pastetoggle=<F2>

" Let's highlight column 80 (but gray, to be subtle)
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" remap up and down so that they don't jump past wrapped lines
nnoremap j gj
nnoremap k gk

"" Color Scheme Options
set termguicolors
colorscheme NeoSolarized
let g:neosolarized_contrast = "high"
let g:neosolarized_bold = 1
let g:neosolarized_underline = 2
let g:neosolarized_italic = 1
set background=dark

"" Spelling
set spelllang=en_us

"" Buffers
set hidden             " enable use of buffers
set autoread           " autoload external changes

"" Indentation
set tabstop=4          " number of spaces that a tab displays as
set shiftwidth=4       " number of spaces that a tab inserts
set expandtab          " convert typed types to spaces

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

"" Session
set nobackup           " Keep no backup files
set writebackup        " ... except while saving over a file
set undofile           " Track undos
set undolevels=1000    " Maximum number of changes that can be undone
set undoreload=10000   " Maximum number lines to save for undo on a buffer reload

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

"" NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

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

"" Autocompletion

" deoplete options
call deoplete#custom#option('enable_at_startup', 1)
call deoplete#custom#option('enable_smart_case', 1)

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" when hitting enter on an autocomplete, go to next line
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" disable autocomplete by default
"let b:deoplete_disable_auto_complete=1
"let g:deoplete_disable_auto_complete=1
"call deoplete#custom#buffer_option('auto_complete', v:false)

" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt -=preview

" set deoplete sources
"let g:deoplete#sources = {}
"let g:deoplete#sources.cpp = ['LanguageClient']
"let g:deoplete#sources.python = ['LanguageClient']
"let g:deoplete#sources.python3 = ['LanguageClient']
"let g:deoplete#sources.ruby = ['LanguageClient']
"let g:deoplete#sources.c = ['LanguageClient']
"let g:deoplete#sources.vim = ['vim']


"" Filetypes
autocmd BufRead,BufNewFile *.jinja2 setfiletype jinja2
autocmd BufRead,BufNewFile *.css,*.scss,*.js,*.ts,*.json,*.rb,*.html,*.jinja  set shiftwidth=2 softtabstop=2

"" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <C-p> :FZF<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>a :Ag<cr>
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
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
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

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>

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

