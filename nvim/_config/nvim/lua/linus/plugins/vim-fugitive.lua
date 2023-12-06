return{
  "tpope/vim-fugitive",
  cmd = "Git",
  config = function ()
    vim.keymap.set("n", "grb", ":Gread <cr>")
  end
}
