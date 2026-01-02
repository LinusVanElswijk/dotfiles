return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame_opts = {
        delay = 20, --snappy
        ignore_whitespace = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "stevearc/overseer.nvim",
    opts = {
      task_list = {
        direction = "right",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },
}
