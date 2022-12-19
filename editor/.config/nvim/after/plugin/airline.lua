-- airline settings
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'base16_vim'

vim.g.airline_symbols.linenr = ' L:'
vim.g.airline_symbols.colnr = ' C:'
vim.g.airline_symbols.maxlinenr = ''
vim.g.airline_symbols.notexists = '[?]'
vim.g.airline_symbols.dirty = '[+]'

vim.g.airline_symbols.space = '\a0'

vim.g.airline_exclude_filetypes = {'NvimTree'}

vim.g['airline#extensions#scrollbar#enabled'] = 0

vim.g['airline#extensions#tabline#enabled'] = 0  -- disable tabline
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'

-- tmuxline settings
vim.g['airline#extensions#tmuxline#snapshot_file'] = "~/.config/tmux/tmux-status.conf"
vim.g.tmuxline_powerline_separators = 0

vim.g.tmuxline_preset = {
    a = '#S',
    win = '#I:#W#F',
    cwin = '#I:#W#F',
    x = '#{prefix_highlight}',
    y = '#(whoami)@#h',
    options = {
        ['status-justify'] = 'left',
    }
}
