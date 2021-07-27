-- git fugitive binds
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<leader>gg', ':G<cr>', options)
map('n', '<leader>gs', ':G<cr>', options)
map('n', '<leader>gd', ':Gvdiffsplit<cr>', options)
map('n', '<leader>gp', ':Git push', options)
