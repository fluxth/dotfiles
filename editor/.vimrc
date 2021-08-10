syntax on

set nocompatible
set secure

set encoding=utf-8
set noswapfile
set nobackup
set number
set relativenumber
set shortmess+=c

filetype plugin indent on
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set splitright
set splitbelow

set updatetime=300
set timeoutlen=1000

set mouse=a

" basic remaps
let mapleader=" "

" esc is hard to reach
imap jk <Esc>

" file manipulation
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>qQ :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :wq<CR>
nnoremap <Leader>qw :wq<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>
nnoremap <C-s> :w<CR>

" pane navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>p <C-w>p
nnoremap <Leader>= <C-w>=
nnoremap <Leader><Leader> <C-^>

" split panes
nnoremap <Leader>sh :sp<CR>
nnoremap <Leader>sv :vsp<CR>
