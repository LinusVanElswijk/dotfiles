local nvic = { "n", "v", "i", "c" }
local nvi = { "n", "v", "i"}

-- Disable default f1 keymap (use :help command instead)
vim.keymap.set(nvic, "<f1>", "<nop>")

-- Recenter on vertical jumps
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<c-b>", "<c-b>zz")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Disable the arrow keys
vim.keymap.set(nvi, "<left>", "<nop>", { noremap = true })
vim.keymap.set(nvi, "<down>", "<nop>", { noremap = true })
vim.keymap.set(nvi, "<up>", "<nop>", { noremap = true })
vim.keymap.set(nvi, "<right>", "<nop>", { noremap = true })

-- Escaping
vim.keymap.set("n", "<esc>", ":noh <cr>", { noremap = true })
vim.keymap.set("c", "<esc>", "<c-c>", { noremap = true })

vim.keymap.set("n", "\\", ":noh <cr>", { noremap = true })
vim.keymap.set({"v", "i"}, "\\", "<esc>", { noremap = true })
vim.keymap.set("c", "\\", "<c-c>", { noremap = true })

vim.keymap.set({"c", "i"}, "\\\\", "\\")

-- screen
local screen_prefix = "<c-w>"
vim.keymap.set(nvic, screen_prefix .. "s", ":sp <cr>")
vim.keymap.set(nvic, screen_prefix .. "v", ":vs <cr>")
vim.keymap.set(nvic, screen_prefix .. "x", ":q <cr>")
