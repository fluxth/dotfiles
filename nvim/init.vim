syntax on

set guicursor=
set noshowmatch
set noshowmode
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

"set timeout
"set ttimeout
"set timeoutlen=3000
"set ttimeoutlen=50

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

"Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'

let g:airline_powerline_fonts = 1

let mapleader=" "

noremap <Leader>q :q
noremap <Leader>Q :q!
noremap <Leader>w :w
noremap <Leader>x :wq

