return {
  "nvim-mini/mini.operators",
  event = "VeryLazy",
  version = "*",
  opts = function()
    return {
      evaluate = { prefix = "go=" },
      exchange = { prefix = "gox" },
      multiply = { prefix = "gom" },
      replace = { prefix = "gor" },
      sort = { prefix = "gos" },
    }
  end,
}
