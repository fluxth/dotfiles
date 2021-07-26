local map = vim.api.nvim_set_keymap

-- map leader key to space
map('n', '<space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }

-- esc is hard to reach
map('i', 'jk', '<esc>', options)

-- file manipulation
map('n', '<leader>q', ':q<cr>', options)
map('n', '<leader>Q', ':q!<cr>', options)
map('n', '<leader>w', ':w<cr>', options)
map('n', '<leader>x', ':wq<cr>', options)

-- pane navigation
map('n', '<leader>h', '<c-w>h', options)
map('n', '<leader>j', '<c-w>j', options)
map('n', '<leader>k', '<c-w>k', options)
map('n', '<leader>l', '<c-w>l', options)
map('n', '<leader>p', '<c-w>p', options)
map('n', '<leader>=', '<c-w>=', options) 

-- escape from terminal insert mode
map('t', '<leader>\\', '<c-\\><c-n>', options)

-- close buffer
map('n', '<leader>d', ':bdcr>', options)
map('n', '<leader>D', ':bd!<cr>', options)

-- buffer navigation
map('n', '<leader><leader>', '<c-^>', options)
map('n', '<c-k>', ':bp<cr>', options)
map('n', '<c-j>', ':bn<cr>', options)

-- tab navigation
map('n', '<c-h>', ':tabp<cr>', options)
map('n', '<c-l>', ':tabn<cr>', options)

-- split panes
map('n', '<leader>sh', ':sp<cr>', options)
map('n', '<leader>sv', ':vsp<cr>', options)
map('n', '<leader>sd', '<c-w><c-o>', options)

-- new tab
map('n', '<leader>t', ':tabnew<cr>', options)

-- diff remaps
map('n', '<leader>sp', ':diffput<cr>', options)
map('v', '<leader>sp', ':diffput<cr>', options)
map('n', '<leader>sg', ':diffget<cr>', options)
map('v', '<leader>sg', ':diffget<cr>', options)

-- too much thinking for ^ and $
map('n', '<leader>[', '^', options)
map('n', '<leader>]', '$', options)

-- the system clipboard (tm)
map('n', '<leader>`', '"*', options)

-- qflist remaps
map('n', '<c-left>', ':lprev<cr>zz', options)
map('n', '<c-right>', ':lnext<cr>zz', options)
map('n', '<c-up>', ':cprev<cr>zz', options)
map('n', '<c-down>', ':cnext<cr>zz', options)
