-- adapted from https://github.com/ray-x/nvim
return {{
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        -- enable syntax highlighting
        highlight = { enable = true },
        -- enable indentation
        indent = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "cmake",
          "css",
          "dockerfile",
          "gitattributes",
          "gitignore",
          "html",
          "json",
          "javascript",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "vim",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
