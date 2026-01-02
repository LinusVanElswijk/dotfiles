return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  },
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  config = function()
    require("gitlab").setup({
      keymaps = {
        popup = {
          perform_action = "<CR>", -- Once in normal mode, does action (like saving comment or applying description edit, etc)
          discard_changes = "q", -- Quit the popup discarding changes, the popup content is not saved to the `temp_registers` (see `:h gitlab.nvim.temp-registers`)
        },
      },
      discussion_tree = { -- The discussion tree that holds all comments
        resolved = " ˙", -- Symbol to show next to resolved discussions
        unresolved = " ˙", -- Symbol to show next to unresolved discussions
        unlinked = "󰌸 ˙", -- Symbol to show next to unliked comments (i.e., not threads)
        draft = " ˙", -- Symbol to show next to draft comments/notes
      },
      discussion_signs = {
        virtual_text = true, -- Whether to show the comment text inline as floating virtual text
      },
      pipeline = {
        canceled = "󰍷 ",
        skipped = "󰄴 ",
        success = " ",
        failed = " ",
      },
    })
  end,
}
