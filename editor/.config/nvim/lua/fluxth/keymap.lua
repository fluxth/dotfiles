vim.g.mapleader = ' '

-- pane navigation
vim.keymap.set('n', '<leader>h', '<c-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<c-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<c-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', '<c-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '<c-w>p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>=', '<c-w>=', { noremap = true, silent = true })

-- buffer navigation
vim.keymap.set('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true })

-- C changes until eol, D deletes until eol, why doesnt Y do the same?!
vim.keymap.set('n', 'Y', 'y$', { noremap = true, silent = true })

-- just dont get the cursor all over the place
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- moving texts
vim.keymap.set('v', '<c-J>', ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<c-K>', ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- escape from highlighted search with, you guessed it: <esc>
-- also clear command output when esc is pressed in normal mode
vim.keymap.set('n', '<esc>', function()
    vim.cmd.nohls()
    vim.cmd.echon()
end, { noremap = true, silent = true })

