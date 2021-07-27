-- set colorscheme to gruvbox
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
vim.cmd('highlight Normal guibg=none')  -- make bg transparent

-- set custom colors for various plugins
vim.cmd('highlight link Blamer GruvboxBg2')  -- make git blames more subtle
vim.cmd('highlight link CocHintSign GruvboxBg2')  -- make rust inlay hints more subtle
vim.cmd('highlight link GitSignsChange GruvboxOrangeSign')  -- orange gitsign when line is changed

-- coc diagnostic styles on signcolumn
vim.cmd('highlight link CocErrorSign GruvboxRedBold')
vim.cmd('highlight link CocWarningSign GruvboxOrange')
vim.cmd('highlight link CocInfoSign GruvboxBlue')
