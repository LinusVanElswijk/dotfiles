vim.g.undotree_TreeNodeShape = "◉"
vim.g.undotree_TreeVertShape = "│"
vim.g.undotree_TreeSplitShape = "─╯"
vim.g.undotree_TreeReturnShape = "─╮"
-- vim.g.undotree_DiffCommand = "diff"

return {
  "mbbill/undotree",
  event = "VeryLazy",
  keys = {
    { "<leader>bh", vim.cmd.UndotreeToggle, { desc = "Buffer History"}}
  },
}
