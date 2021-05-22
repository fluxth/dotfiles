syntax on

set exrc
set nocompatible
set secure

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
set smartcase
set noswapfile
set nobackup
set incsearch
set termguicolors
set shortmess+=c

" Sane splits
set splitright
set splitbelow

filetype plugin indent on
set autoindent
set timeoutlen=500 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=4
set hidden
"set nowrap
set nojoinspaces

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

set undodir="~/.local/share/nvim/undodir"
set undofile

set mouse=a

set updatetime=300

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set listchars=nbsp:¬,extends:»,precedes:«,trail:•
