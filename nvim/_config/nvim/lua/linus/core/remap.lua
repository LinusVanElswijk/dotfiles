local nvic = { "n", "v", "i", "c" }

-- Disable default f1 keymap (use :help command instead)
vim.keymap.set(nvic, "<f1>", "<nop>")

-- Disable the arrow keys
vim.keymap.set(nvic, "<left>", "<nop>", { noremap = true })
vim.keymap.set(nvic, "<down>", "<nop>", { noremap = true })
vim.keymap.set(nvic, "<up>", "<nop>", { noremap = true })
vim.keymap.set(nvic, "<right>", "<nop>", { noremap = true })

local esc_sequence = "qjk"
vim.keymap.set("n", "<esc>", ":noh <cr>")
vim.keymap.set("n", esc_sequence, ":noh <cr>")
vim.keymap.set({"v", "i"}, esc_sequence, "<esc>")
vim.keymap.set("c", esc_sequence, "<c-c>")  -- avoid weirdness with esc

-- screen
local screen_prefix = "<c-w>"
vim.keymap.set(nvic, screen_prefix .. "s", ":sp <cr>")
vim.keymap.set(nvic, screen_prefix .. "v", ":vs <cr>")
