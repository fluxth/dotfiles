call plug#begin('~/.local/share/nvim/plugged')

" Visuals
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'andymass/vim-matchup'

" Editor Enhancements 
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'

" GUI Enhancements'
Plug 'mhinz/vim-startify'
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

" Tmux
Plug 'edkolev/tmuxline.vim'

call plug#end()

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" rust cargo version remap
inoremap <C-r> <C-x><C-u>

" closetag remaps
let g:closetag_filenames = "*.html,*.jsx,*.tsx"

" blamer.nvim configs
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = '   ✱ '
nnoremap <Leader>sgb :BlamerToggle<CR>

" gitsigns configs
lua <<EOF
require('gitsigns').setup {
    keymaps = {
        noremap = true,
        ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['v <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    }
}
EOF
