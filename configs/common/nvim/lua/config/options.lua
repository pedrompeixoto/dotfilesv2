local opt = vim.opt

-- Leaders (set before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- UI
opt.number = true
opt.relativenumber = true

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.gdefault = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wildmode = { "longest:full", "full" }
opt.wildignorecase = true

-- Performance / behavior
opt.updatetime = 250
opt.timeoutlen = 400
opt.redrawtime = 10000
opt.lazyredraw = false
opt.synmaxcol = 300
opt.history = 1000
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.autoread = true
opt.hidden = true
opt.confirm = true

opt.clipboard = "unnamedplus"
