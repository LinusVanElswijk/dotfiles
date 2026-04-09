return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {
    interactions = {
      chat = { adapter = { name = "opencode" }, },
      inline = { adapter = { name = "opencode" } },
      cmd = { adapter = { name = "opencode" } },
      background = { adapter = { name = "opencode" } },
    },
  },
  keys = {
    { "<C-a>", mode = { "n", "v" }, ":CodeCompanionActions<cr>", { desc = "Code Companion Actions" } },
    { "<leader>a", mode = { "n", "v" }, ":CodeCompanionChat Toggle<cr>", { desc = "Code Companion Chat Toggle" } },
    { "ga", mode = "v", ":CodeCompanionChat Add<cr>", { desc = "Code Companion Chat Add" } },
  }
}
