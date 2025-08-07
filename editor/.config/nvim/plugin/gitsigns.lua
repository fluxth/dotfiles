require('gitsigns').setup {
-- on_attach = function(bufnr)
--   local gs = package.loaded.gitsigns

--   local function map(mode, l, r, opts)
--     opts = opts or {}
--     opts.buffer = bufnr
--     vim.keymap.set(mode, l, r, opts)
--   end


-- end

--   keymaps = {
--       noremap = true,
--       ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
--       ['v <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
--       ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
--       ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
--       ['v <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
--       ['n <leader>ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
--       ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
--       ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
--   }
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>sgg', ':Gitsigns toggle_signs<cr>', { noremap = true, silent = true })
