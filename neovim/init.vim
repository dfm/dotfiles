let g:python3_host_prog = '/Users/dforeman/anaconda3/bin/python'

"
"  PLUGIN INSTALLATION
"
filetype off
set nocompatible
call plug#begin()

" Colors
Plug 'altercation/vim-colors-solarized'

" Fuzzy finding
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'valloric/youcompleteme'
Plug 'dfm/shifttab.nvim', { 'do': ':UpdateRemotePlugins' }

" Linting
Plug 'w0rp/ale'

" Prose
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Randomness
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/nerdcommenter'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'gregsexton/MatchTag'

call plug#end()
filetype plugin indent on

" -------------
"  BASIC SETUP
" -------------
set encoding=utf8
syntax on
set autoindent
let mapleader=","

" Return to last edit position when opening files - doesn't work in neovim
" See issue: #3472
nnoremap <leader>gg g`"
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction
autocmd BufReadPost * call SetCursorPosition()

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
nnoremap <buffer><cr> :nohlsearch<cr>

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
nmap <leader>y Y<leader>c<space>P
vmap <leader>y ygv<leader>c<space>P

" Copy/paste from Micha
vmap <leader>c ! pbcopy<CR>u
nmap <leader>v :set paste<CR>! pbpaste<CR>:set nopaste<CR>

" Limelight colors
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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
  set noautoindent
  set nocindent
  set nosmartindent
  set indentexpr=
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk
endfunction

"augroup pencil
"autocmd!
"autocmd filetype markdown,mkd,tex call pencil#init()
"    \ | call lexical#init()
"    \ | call litecorrect#init()
"    \ | setl spell spl=en_us fdl=4 noru nonu nornu
"    \ | setl fdo+=search
"augroup END

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

" fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" ycm
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Shifttab
autocmd FileType python inoremap <S-tab> <C-o>:call ShiftTab()<CR>
autocmd FileType python setlocal noshowmode

"
" Linting
"

let g:ale_linters = {'tex': ['chktex', 'lacheck', 'vale'],
            \        'python': ['flake8'],
            \        'cpp': []}

"
"  ULTISNIPS
"
let g:UltiSnipsExpandTrigger="<leader>m"
let g:snippets_dir='~/.config/nvim/snippets'

"
"  NERD COMMENTER
"
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'


" ----------------
"  FILETYPE SETUP
" ----------------

augroup filetypes
  autocmd!

  " LaTeX
  autocmd FileType tex,plaintex setlocal wrap textwidth=78 noai
  autocmd FileType tex,plaintex call Prose()

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
  autocmd FileType c setlocal shiftwidth=2 tabstop=2
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType cc setlocal shiftwidth=2 tabstop=2
  autocmd FileType hpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType h setlocal shiftwidth=2 tabstop=2

  "autocmd FileType python
augroup end
