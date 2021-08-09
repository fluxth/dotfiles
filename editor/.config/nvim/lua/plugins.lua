-- initialize packer.nvim
require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- visuals
    use 'gruvbox-community/gruvbox'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'andymass/vim-matchup'

    -- editor enhancements
    use 'alvan/vim-closetag'
    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-fugitive'
    use 'APZelos/blamer.nvim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'preservim/nerdcommenter'

    -- gui enhancements
    use 'mhinz/vim-startify'
    use 'machakann/vim-highlightedyank'
    use 'mhinz/vim-crates'

    -- fuzzy finder
    use 'airblade/vim-rooter'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- lsp
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- language plugins
    use 'rust-lang/rust.vim'
    use 'psf/black'

    -- snippets
    use 'mlaursen/vim-react-snippets'

    -- tmux
    use 'edkolev/tmuxline.vim'
end)

-- additional settings
vim.g.WebDevIconsOS = 'Linux'  -- set unix icon to a penguin :D
