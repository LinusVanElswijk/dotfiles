-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local nvic = { "n", "v", "i", "c" }
local map = vim.keymap.set

-- Disable default f1 keymap (use :help command instead)
map(nvic, "<f1>", "<nop>")

-- Recenter on vertical jumps
map("n", "n", "nzz", { desc = "Next Search Result" })
map("n", "N", "Nzz", { desc = "Previous Search Result" })

map("n", "<c-b>", "<c-b>zz", { desc = "Scroll Backward" })
map("n", "<c-f>", "<c-f>zz", { desc = "Scroll Forward" })
map("n", "<c-d>", "<c-d>zz", { desc = "Scroll Down" })
map("n", "<c-u>", "<c-u>zz", { desc = "Scroll Up" })

-- Escaping
map("n", "<esc>", ":noh <cr>", { noremap = true, desc = "Clear Highlights" })
map("c", "<esc>", "<c-c>", { noremap = true, desc = "Exit Current Mode" })
map("t", "<esc>", "<C-\\><C-n>", { noremap = true, desc = "Exit Current Mode" })

-- commands
map("n", "<space><space>", ":", { noremap = true, desc = "command mode" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<A-x>", "<C-w>q", { desc = "Quit a Window", remap = true })

-- Move Lines
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Clipboard
map({"n", "v"}, "<leader>y", "\"+y", { desc = "Yank to clipboard" })
map({"n", "v"}, "<leader>p", "\"+p", { desc = "Put from clipboard" })

-- Ui toggles
map("n", "<leader>uB", ":Gitsigns toggle_current_line_blame<cr>", { desc = "toggle current line blame" })

-- Switch spell language
vim.keymap.set("n", "z1", function()
  vim.opt.spelllang = { "en" }
end, { desc = "Spell English" })

vim.keymap.set("n", "z2", function()
  vim.opt.spelllang = { "nl" }
end, { desc = "Spell Dutch" })

