vim.keymap.set("n", "C", function() require("dap").continue() end, { buffer = 0, desc = "Continue" })
vim.keymap.set("n", "Q", function() require("dap").terminate() end, { buffer = 0, desc = "Terminate" })

vim.keymap.set("n", "l", function() require("dap").step_into() end, { buffer = 0, desc = "Step Into" })
vim.keymap.set("n", "h", function() require("dap").step_out() end, { buffer = 0, desc = "Step Out" })
vim.keymap.set("n", "j", function() require("dap").step_over() end, { buffer = 0, desc = "Step Over" })
vim.keymap.set("n", "k", function() require("dap").step_back() end, { buffer = 0, desc = "Step Back" })
