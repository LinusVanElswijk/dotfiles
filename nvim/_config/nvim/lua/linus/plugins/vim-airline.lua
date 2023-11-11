return({
  { "vim-airline/vim-airline", name = "vim-airline" },
  { "vim-airline/vim-airline-themes", name = "vim-airline-themes",
    config = function()
      vim.g.airline_theme="tomorrow"
    end
  }
})
