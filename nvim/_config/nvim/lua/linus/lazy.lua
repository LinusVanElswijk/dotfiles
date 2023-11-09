local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- colorscheme/theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },
  { "vim-airline/vim-airline", name = "vim-airline" },
  { "vim-airline/vim-airline-themes", name = "vim-airline-themes",
    config = function()
      vim.g.airline_theme="tomorrow"
    end  
  }
})

