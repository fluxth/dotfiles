local map = vim.api.nvim_set_keymap

-- map leader key to space
map('n', '<space>', '', {})
vim.g.mapleader = ' '

-- esc is hard to reach
map('i', 'jk', '<esc>', { noremap = true, silent = true })
map('i', 'kj', '<esc>', { noremap = true, silent = true })

-- file manipulation
map('n', '<leader>qq', ':q<cr>', { noremap = true, silent = true })
map('n', '<leader>qQ', ':q!<cr>', { noremap = true, silent = true })
map('n', '<leader>qa', ':qa<cr>', { noremap = true, silent = true })
map('n', '<leader>qA', ':qa!<cr>', { noremap = true, silent = true })
map('n', '<leader>w', ':w<cr>', { noremap = true, silent = true })
map('n', '<leader>W', ':noa w<cr>', { noremap = true, silent = true })
map('n', '<leader>qw', ':wq<cr>', { noremap = true, silent = true })
map('n', '<leader>qW', ':wq!<cr>', { noremap = true, silent = true })
map('n', '<leader>x', ':wq<cr>', { noremap = true, silent = true })

-- pane navigation
map('n', '<leader>h', '<c-w>h', { noremap = true, silent = true })
map('n', '<leader>j', '<c-w>j', { noremap = true, silent = true })
map('n', '<leader>k', '<c-w>k', { noremap = true, silent = true })
map('n', '<leader>l', '<c-w>l', { noremap = true, silent = true })
map('n', '<leader>p', '<c-w>p', { noremap = true, silent = true })
map('n', '<leader>=', '<c-w>=', { noremap = true, silent = true })

-- escape from terminal insert mode
map('t', [[<leader>\]], [[<c-\><c-n>]], { noremap = true })

-- close buffer
map('n', '<leader>d', ':bd<cr>', { noremap = true, silent = true })
map('n', '<leader>D', ':bd!<cr>', { noremap = true, silent = true })

-- buffer navigation
map('n', '<leader><leader>', '<c-^>', { noremap = true, silent = true })
map('n', '<c-k>', ':bp<cr>', { noremap = true, silent = true })
map('n', '<c-j>', ':bn<cr>', { noremap = true, silent = true })

-- tab navigation
map('n', '<c-h>', ':tabp<cr>', { noremap = true, silent = true })
map('n', '<c-l>', ':tabn<cr>', { noremap = true, silent = true })

-- split panes
map('n', '<leader>sh', ':sp<cr>', { noremap = true, silent = true })
map('n', '<leader>sv', ':vsp<cr>', { noremap = true, silent = true })
map('n', '<leader>sd', '<c-w><c-o>', { noremap = true })

-- new tab
map('n', '<leader>t', ':tabnew<cr>', { noremap = true, silent = true })

-- diff remaps
map('n', '<leader>sp', ':diffput<cr>', { noremap = true, silent = true })
map('v', '<leader>sp', ':diffput<cr>', { noremap = true, silent = true })
map('n', '<leader>sg', ':diffget<cr>', { noremap = true, silent = true })
map('v', '<leader>sg', ':diffget<cr>', { noremap = true, silent = true })

-- too much thinking for ^ and $
map('n', '<leader>[', '^', { noremap = true })
map('n', '<leader>]', '$', { noremap = true })

-- the system clipboard (tm)
map('n', '<leader>`', '"+', { noremap = true })
map('v', '<leader>`', '"+', { noremap = true })

-- better indenting
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- disable ex mode
map('n', 'Q', '<nop>', { noremap = true, silent = true })
map('n', 'q:', '<nop>', { noremap = true, silent = true })
map('v', 'Q', '<nop>', { noremap = true, silent = true })
map('v', 'q:', '<nop>', { noremap = true, silent = true })

-- qflist remaps
map('n', '<c-left>', ':lprev<cr>zz', { noremap = true, silent = true })
map('n', '<c-right>', ':lnext<cr>zz', { noremap = true, silent = true })
map('n', '<c-up>', ':cprev<cr>zz', { noremap = true, silent = true })
map('n', '<c-down>', ':cnext<cr>zz', { noremap = true, silent = true })

-- C changes until eol, D deletes until eol, why doesnt Y do the same?!
map('n', 'Y', 'y$', { noremap = true, silent = true })

-- just dont get the cursor all over the place
map('n', 'n', 'nzzzv', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv', { noremap = true, silent = true })
map('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- undo breakpoints
map('i', '.', '.<c-g>u', { noremap = true, silent = true })
map('i', ',', ',<c-g>u', { noremap = true, silent = true })
map('i', '=', '=<c-g>u', { noremap = true, silent = true })

-- ignore J,K in visual mode
map('v', 'J', 'j', { noremap = true, silent = true })
map('v', 'K', 'k', { noremap = true, silent = true })

-- moving texts
map('v', '<c-J>', ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
map('v', '<c-K>', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- escape from highlighted search with, you guessed it: <esc>
-- also clear command output when esc is pressed in normal mode
map('n', '<esc>', ':nohls<cr>:echon<cr>', { noremap = true, silent = true })

-- visual paste pls dont be annoying
map('v', 'p', '"_dP', { noremap = true, silent = true })

-- search selected text in visual mode
map('v', '/', 'y/<c-r>"<cr>', { noremap = true, silent = true })
map('v', '?', 'y?<c-r>"<cr>', { noremap = true, silent = true })

-- search the word under cursor in normal mode
map('n', '<leader>/', 'yiw/<c-r>"<cr>', { noremap = true, silent = true })
map('n', '<leader>?', 'yiw?<c-r>"<cr>', { noremap = true, silent = true })

-- tabz
map('n', '<leader>1', '1gt', { noremap = true, silent = true })
map('n', '<leader>2', '2gt', { noremap = true, silent = true })
map('n', '<leader>3', '3gt', { noremap = true, silent = true })
map('n', '<leader>4', '4gt', { noremap = true, silent = true })
map('n', '<leader>5', '5gt', { noremap = true, silent = true })
map('n', '<leader>6', '6gt', { noremap = true, silent = true })
map('n', '<leader>7', '7gt', { noremap = true, silent = true })
map('n', '<leader>8', '8gt', { noremap = true, silent = true })
map('n', '<leader>9', '9gt', { noremap = true, silent = true })
