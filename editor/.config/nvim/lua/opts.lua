vim.o.filetype = 'on'
vim.o.syntax = 'on'

vim.o.exrc = true
vim.o.compatible = false
vim.o.secure = true

vim.o.hidden = true
vim.o.showmatch = false
vim.o.showmode = false
vim.o.errorbells = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartcase = true

vim.o.swapfile = false
vim.o.backup = false

vim.o.termguicolors = true
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.o.autoindent = true
vim.o.encoding = 'utf-8'
vim.o.scrolloff = 4
vim.o.joinspaces = false
-- vim.o.nowrap = true

-- Searches
vim.o.hlsearch = false
vim.o.incsearch = true

-- Sane splits
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.signcolumn = 'yes'

vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.local/share/nvim/undodir'

vim.o.mouse = 'nvi'

vim.o.timeoutlen = 1000
vim.o.updatetime = 300

vim.o.colorcolumn = '80'

vim.o.listchars = 'nbsp:¬,extends:»,precedes:«,trail:•'
