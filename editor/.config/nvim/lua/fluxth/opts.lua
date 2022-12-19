local opt = vim.opt

opt.exrc = true
opt.compatible = false
opt.secure = true
opt.errorbells = false
opt.encoding = 'utf-8'

opt.hidden = true
opt.showmatch = false
opt.showmode = false

opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undodir'

opt.termguicolors = true
opt.shortmess = opt.shortmess + 'c'
opt.cursorline = true
opt.cursorlineopt = 'number'

-- Searches
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

-- Sane splits
opt.splitright = true
opt.splitbelow = true

opt.signcolumn = 'yes'

opt.timeoutlen = 1000
opt.updatetime = 300

opt.colorcolumn = '80'

opt.showbreak = '↪ '
opt.list = true
opt.listchars = {
    nbsp     = '¬',
    extends  = '»',
    precedes = '«',
    trail    = '·',
    tab      = '→ ',
}
