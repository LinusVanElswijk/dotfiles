return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")

    local prefix = "<leader>p"
    vim.keymap.set("n", prefix .. "f", builtin.find_files, {})
    vim.keymap.set("n", prefix .. "/", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", prefix .. "b", builtin.buffers, {})
    vim.keymap.set("n", prefix .. "h", builtin.help_tags, {})

    local git_prefix = prefix .. "g"
    vim.keymap.set("n", git_prefix .. "l", builtin.git_commits, {})
    vim.keymap.set("n", git_prefix .. "s", builtin.git_status, {})
    vim.keymap.set("n", git_prefix .. "b", builtin.git_branches, {})
  end
}
