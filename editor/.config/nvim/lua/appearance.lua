-- set colorscheme to gruvbox
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = 0
vim.cmd('colorscheme gruvbox')

-- highlight helper function
local function highlight(opt)
    vim.cmd([[autocmd VimEnter * highlight ]] .. opt)
end

-- make bg transparent
highlight('Normal guibg=none')

-- set custom colors for various plugins
highlight('link Blamer GruvboxBg2')  -- make git blames more subtle
highlight('link CocHintSign GruvboxBg2')  -- make rust inlay hints more subtle
highlight('link GitSignsChange GruvboxOrangeSign')  -- orange gitsign when line is changed

-- coc diagnostic styles on signcolumn
highlight('link CocErrorSign GruvboxRedBold')
highlight('link CocWarningSign GruvboxOrange')
highlight('link CocInfoSign GruvboxBlue')
