local opt = vim.opt

opt.filetype = 'on'
opt.syntax = 'on'

opt.exrc = true
opt.compatible = false
opt.secure = true

opt.hidden = true
opt.showmatch = false
opt.showmode = false
opt.errorbells = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false

opt.termguicolors = true
opt.shortmess = opt.shortmess + 'c'

opt.autoindent = true
opt.encoding = 'utf-8'
opt.scrolloff = 4
opt.joinspaces = false
-- vim.opt.nowrap = true

-- Searches
opt.hlsearch = false
opt.incsearch = true

-- Sane splits
opt.splitright = true
opt.splitbelow = true

opt.signcolumn = 'yes'

opt.undofile = true
opt.undodir =  vim.fn.stdpath('data') .. '/undodir'

opt.mouse = 'nvi'

opt.timeoutlen = 1000
opt.updatetime = 300

opt.colorcolumn = '80'

opt.showbreak = '↪ '
opt.list = true
opt.listchars = {
    nbsp        = '¬',
    extends     = '»',
    precedes    = '«',
    trail       = '·',
    tab         = '→ ',
}
