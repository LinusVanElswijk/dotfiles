-- quickfix specific keybinds
local opts = { buffer = true, silent = true }
vim.keymap.set("n", "[[", ":cprev<CR>", opts)
vim.keymap.set("n", "]]", ":cnext<CR>", opts)
