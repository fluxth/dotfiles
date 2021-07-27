local map = vim.api.nvim_set_keymap

-- map leader key to space
map('n', '<space>', '', {})
vim.g.mapleader = ' '

-- esc is hard to reach
map('i', 'jk', '<esc>', { noremap = true, silent = true })

-- file manipulation
map('n', '<leader>q', ':q<cr>', { noremap = true })
map('n', '<leader>Q', ':q!<cr>', { noremap = true })
map('n', '<leader>w', ':w<cr>', { noremap = true })
map('n', '<leader>x', ':wq<cr>', { noremap = true })

-- pane navigation
map('n', '<leader>h', '<c-w>h', { noremap = true })
map('n', '<leader>j', '<c-w>j', { noremap = true })
map('n', '<leader>k', '<c-w>k', { noremap = true })
map('n', '<leader>l', '<c-w>l', { noremap = true })
map('n', '<leader>p', '<c-w>p', { noremap = true })
map('n', '<leader>=', '<c-w>=', { noremap = true }) 

-- escape from terminal insert mode
map('t', '<leader>\\', '<c-\\><c-n>', { noremap = true })

-- close buffer
map('n', '<leader>d', ':bdcr>', { noremap = true })
map('n', '<leader>D', ':bd!<cr>', { noremap = true })

-- buffer navigation
map('n', '<leader><leader>', '<c-^>', { noremap = true, silent = true })
map('n', '<c-k>', ':bp<cr>', { noremap = true })
map('n', '<c-j>', ':bn<cr>', { noremap = true })

-- tab navigation
map('n', '<c-h>', ':tabp<cr>', { noremap = true })
map('n', '<c-l>', ':tabn<cr>', { noremap = true })

-- split panes
map('n', '<leader>sh', ':sp<cr>', { noremap = true })
map('n', '<leader>sv', ':vsp<cr>', { noremap = true })
map('n', '<leader>sd', '<c-w><c-o>', { noremap = true })

-- new tab
map('n', '<leader>t', ':tabnew<cr>', { noremap = true })

-- diff remaps
map('n', '<leader>sp', ':diffput<cr>', { noremap = true })
map('v', '<leader>sp', ':diffput<cr>', { noremap = true })
map('n', '<leader>sg', ':diffget<cr>', { noremap = true })
map('v', '<leader>sg', ':diffget<cr>', { noremap = true })

-- too much thinking for ^ and $
map('n', '<leader>[', '^', { noremap = true })
map('n', '<leader>]', '$', { noremap = true })

-- the system clipboard (tm)
map('n', '<leader>`', '"*', { noremap = true })

-- better indenting
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- qflist remaps
map('n', '<c-left>', ':lprev<cr>zz', { noremap = true })
map('n', '<c-right>', ':lnext<cr>zz', { noremap = true })
map('n', '<c-up>', ':cprev<cr>zz', { noremap = true })
map('n', '<c-down>', ':cnext<cr>zz', { noremap = true })
