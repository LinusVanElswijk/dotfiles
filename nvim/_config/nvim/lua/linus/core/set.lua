-- leader
vim.g.mapleader = " "

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- long undo history instead of backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim_undodir"
vim.opt.undofile = true

-- search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- misc
vim.opt.scrolloff = 12
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80,120"

