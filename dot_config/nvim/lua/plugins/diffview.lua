return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  opts = {
    keymaps = {
      view = {
        ["<leader>b"] = false,
        { "n", "<leader>gdv", ":DiffviewClose<cr>", { desc = "Close Diff View" } },
        { "n", "<leader>e", ":DiffviewToggleFiles<cr>", { desc = "Toggle the file panel." } },
      },
      panel = {
        ["<leader>b"] = false,
        { "n", "<leader>gdv", ":DiffviewClose<cr>", { desc = "Close Diff View" } },
        { "n", "<leader>e", ":DiffviewToggleFiles<cr>", { desc = "Toggle the file panel." } },
      },
    },
  },
  keys = {
    { "<leader>gdv", mode = { "n" }, ":DiffviewOpen<cr>", { desc = "Git Diff View" } },
    { "<leader>gdv", mode = { "v" }, ":'<,'>DiffviewFileHistory<cr>", { desc = "Git Diff View" } },
    { "<leader>gdh", ":DiffviewFileHistory %<cr>", { desc = "View Git File History" } },
  },
}
