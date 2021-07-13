call plug#begin('~/.local/share/nvim/plugged')

" Visuals
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'andymass/vim-matchup'

" Editor Enhancements 
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'

" GUI Enhancements'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-crates'

" Fuzzy Finder
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSPs
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language Plugins
Plug 'rust-lang/rust.vim'
Plug 'psf/black'

" Snippets
Plug 'mlaursen/vim-react-snippets'

call plug#end()

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" rust cargo version remap
inoremap <C-r> <C-x><C-u>

let g:closetag_filenames = "*.html,*.jsx,*.tsx"
