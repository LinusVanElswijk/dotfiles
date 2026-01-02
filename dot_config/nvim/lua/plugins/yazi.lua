---@type LazySpec
return {
  { -- disable LazyVim's default file explorer
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>fe",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Explorer Yazi",
      },
      {
        -- Open in the current working directory
        "<leader>fE",
        "<cmd>Yazi cwd<cr>",
        desc = "Explorer Yazi (cwd)",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        "<leader>fs",
        "<cmd>Yazi toggle<cr>",
        desc = "Explorer Yazi (resume)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer Yazi", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer Yazi (cwd)", remap = true },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
