return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "ibhagwan/fzf-lua", --  optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gd", "<cmd>Neogit diff<cr>", desc = "Neogit Diff" },
    {
      "<leader>gr",
      function()
        require("neogit").action("diff", "range")()
      end,
      desc = "Git Diff Range",
    },
  },
  opts = {
    graph_style = "unicode",
  },
}
