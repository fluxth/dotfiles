vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = 0

vim.cmd.colorscheme("gruvbox")

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { guibg = None })
vim.api.nvim_set_hl(0, "NormalFloat", { guibg = None })
