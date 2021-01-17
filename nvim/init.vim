syntax on

set exrc
set nocompatible
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
set undodir="~/.local/share/nvim/undodir"
set undofile
set incsearch
set termguicolors
set scrolloff=8
set shortmess+=c
set signcolumn=yes

set updatetime=300

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/plugged')

" Visuals
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" VIM Enhancements 
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

" GUI Enhancements
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Fuzzy Finder
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSPs
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Language Plugins
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

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

" leader remaps
let mapleader=" "

" file manipulation
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :wq<CR>
nnoremap <C-s> :w<CR>

" hjkl to move between panes
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

nnoremap <Leader><CR> :ClangFormat<CR>

" nerdtree remaps
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

nnoremap <Leader>f :NERDTreeFocus<CR>
nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tp :NERDTreeFind<CR>
"nmap <Leader>tr <20>fr<20>p

" Telescope find
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

" LSP
set completeopt=menuone,noinsert,noselect

nnoremap <Leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" vim completions
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach; settings={rust_analyzer={inlayHints={typeHints=true}}} }

let g:vim_markdown_folding_disabled = 1

" vim fugitive remaps
nnoremap <Leader>gs :G<CR>
