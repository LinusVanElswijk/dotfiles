return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {
    system_prompt = function(ctx)
      return ctx.default_system_prompt .. "\
        Write like you're chatting with a friend—relaxed and informal.\
        Answer straight away; do not lead in answers.\
        Do not add follow up suggestions."
    end,
    adapters = {
      http = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "http://localhost:12434",
            },
            headers = {
              ["Content-Type"] = "application/json",
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = {
          name = "ollama",
          model = "docker.io/ai/ministral3:3B-Q4_K_M",
        },
      },
      inline = {
        adapter = {
          name = "ollama",
          model = "docker.io/ai/ministral3:3B-Q4_K_M",
        },
      },
      cmd = {
        adapter = {
          name = "ollama",
          model = "docker.io/ai/ministral3:3B-Q4_K_M",
        },
      },
      background = {
        adapter = {
          name = "ollama",
          model = "docker.io/ai/ministral3:3B-Q4_K_M",
        },
      },
    },
  },
  keys = {
    { "<leader>at", mode = { "n", "v" }, ":CodeCompanionChat Toggle<cr>", { desc = "Code Companion Chat Toggle"}},
    { "<leader>ac", mode = { "n", "v" }, ":CodeCompanionChat<cr>", { desc = "Code Companion Chat"}},
    { "<leader>aa", mode = { "n", "v" }, ":CodeCompanionActions<cr>", { desc = "Code Companion Actions" }},
  },
}
