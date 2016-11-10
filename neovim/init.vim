"
"  PLUGIN INSTALLATION
"
filetype off
set nocompatible
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/nerdcommenter'

call plug#end()
filetype plugin indent on

" -------------
"  BASIC SETUP
" -------------
set encoding=utf8
syntax on
set autoindent
let mapleader=","

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif

" Remember info about open buffers on close
set viminfo^=%

" fuck yeah!
command! W :w
command! Q :q

" No toolbar in the gui.
set guioptions-=T

set number
set numberwidth=3
highlight LineNr ctermbg=darkgrey

set title
set ruler
set virtualedit=block
set backspace=2             " Allow backspacing over autoindent, EOL, etc.
set showmatch               " Match parentheses
set matchpairs+=<:>         "   - also for angle bracket pairs
set nowrap
set foldlevel=99
set ww=<,>,[,],h,l,b,s,~

" Default tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround              " Rounds indent to multiple of shiftwidth

" Don't autosave anything
set noautowrite
set noautowriteall
set noswapfile
set nobackup
set nowb
set autoread                " Automatically read saved files

" Status line
set laststatus=2            " Always show it
set statusline=%<%f\ %y

" Tab completion in command mode
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.pdf
set wildignore+=*.dat
set wildignore+=*.o,*.so
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.DS_Store?
set wildignore+=venv
set wildignore+=*.fits,*.hdf5,*.h5

" Show invisibles
set listchars=tab:▸\ ,eol:¬
set list

" Color column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

" Searching
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Spell check
set spell
setlocal spell spelllang=en_us

" Un-highlight search when we hit enter
autocmd BufRead,BufNewFile * nnoremap <buffer><cr> :nohlsearch<cr>

" Clean up whitespace at the ends of lines before writing
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.less set filetype=css

" Edit and source .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move a line up/down in a file
nnoremap - ddp
nnoremap _ ddkkp

" Surround a word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hviwo<esc>i"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hviwo<esc>i'<esc>lel

" A better mapping for leaving insert mode
inoremap jk <esc>

" Jump to beginning/end of lines
noremap H ^
noremap L g_

" Save current file with ,.
nnoremap <leader>. :w<cr>
" Make with ,m
nnoremap <leader>m :make<cr>

" Window resizing
noremap <C-h> <C-w>>
noremap <C-j> <C-W>-
noremap <C-k> <C-W>+
noremap <C-l> <C-w><

" Yank, comment, paste.
nmap <leader>y Y\\\P
vmap <leader>y ygv\\P

" Copy/paste from Micha
vmap <leader>c ! pbcopy<CR>u
nmap <leader>v :set paste<CR>! pbpaste<CR>:set nopaste<CR>

" Wrap prose the way I want it.
" Ref: http://contsys.tumblr.com/post/491802835/vim-soft-word-wrap
noremap <leader>w vasgq
noremap <leader>W vipJ
function Prose ()
  set formatoptions+=t
  set linebreak
  set wrap
  set nolist
  set display=lastline
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk
endfunction

" Solarized colorscheme
set t_Co=256
set background=light
let g:solarized_termtrans=1
colorscheme solarized
highlight Normal ctermbg=none

" Fortran
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" --------------
"  PLUGIN SETUP
" --------------

"
"  DEOPLETE
"
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"
"  NEOMAKE
"
autocmd! BufReadPost,BufWritePost * Neomake
let g:neomake_python_flake8_args=['--ignore=E302,E226,E731',]

"
"  ULTISNIPS
"
let g:UltiSnipsExpandTrigger="<leader>m"
let g:snippets_dir='~/.config/nvim/snippets'

"
"  NERD COMMENTER
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'


" ----------------
"  FILETYPE SETUP
" ----------------

augroup filetypes
  autocmd!

  " LaTeX
  autocmd FileType tex setlocal wrap textwidth=78 noai
  autocmd FileType tex call Prose()

  " Documentation
  autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
  autocmd FileType md setlocal wrap textwidth=78
  autocmd FileType markdown setlocal wrap textwidth=78
  autocmd FileType rst setlocal wrap textwidth=78

  " Javascript
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

  " Fortran
  autocmd BufRead,BufNewFile *.f,*.f96,*.f90,*.f66,*.f77 setlocal filetype=fortran
  autocmd FileType fortran setlocal tabstop=2 shiftwidth=2 softtabstop=2

  " Julia
  autocmd BufRead,BufNewFile *.jl setlocal filetype=julia

  " C/C++
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType cc setlocal shiftwidth=2 tabstop=2
  autocmd FileType hpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType h setlocal shiftwidth=2 tabstop=2
augroup end
