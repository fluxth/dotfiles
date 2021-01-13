syntax on

set exrc
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
set shortmess+=c

set updatetime=300

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" Visuals
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" VIM Enhancements 
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

" GUI Enhancements
Plug 'machakann/vim-highlightedyank'

" Fuzzy Finder
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSPs
Plug 'neovim/nvim-lspconfig'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_vim'
let airline#extensions#tmuxline#snapshot_file = "~/.config/tmux/tmux-status.conf"

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
        \ 'a': '[#S]',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'x': '#{prefix_highlight}',
        \ 'y': '%H:%M',
        \ 'z': '%d-%b-%y',
        \ 'options': {
        \ 'status-justify': 'left'}
        \ }

let mapleader=" "
noremap <Leader>q :q<Return>
noremap <Leader>Q :q!<Return>
noremap <Leader>w :w<Return>
noremap <Leader>x :wq<Return>
