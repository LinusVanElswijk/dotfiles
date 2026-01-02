-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

function P(obj)
  print(vim.inspect(obj))
end

-- winbar
vim.opt.winbar = "%=%f%y%m"

-- do not use system clipboard by default
vim.opt.clipboard = ""

-- long undo history instead of backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim_undodir"
vim.opt.undofile = true

-- bigger scoll border
vim.opt.scrolloff = 12
vim.opt.updatetime = 50

-- colums markers
vim.opt.colorcolumn = "80,120"

-- Do not format on save by default
vim.g.autoformat = false

-- Enable spell checking
vim.opt.spell = true
vim.opt.spelllang = { "en" }

