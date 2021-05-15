call plug#begin('~/.local/share/nvim/plugged')

" Visuals
Plug 'gruvbox-community/gruvbox'
"Plug 'rktjmp/lush.nvim'
"Plug 'npxbr/gruvbox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" VIM Enhancements 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

" GUI Enhancements'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'andymass/vim-matchup'

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
Plug 'nvim-treesitter/completion-treesitter'

" Language Plugins
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'

call plug#end()

" source plugin configs
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/nerdtree.vim

" misc plugin configs
let g:vim_markdown_folding_disabled = 1

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

let g:rustfmt_autosave = 1

let g:EditorConfig_exec_path = '/opt/homebrew/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'

let g:WebDevIconsOS = 'Linux'
