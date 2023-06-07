local builtin = require('telescope.builtin')
local yanky_ext = require("telescope").load_extension("yank_history")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>py', yanky_ext.yank_history, {})

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<leader>tt"] = trouble.open_with_trouble },
      n = { ["<leader>tt"] = trouble.open_with_trouble },
    },
  },
}

local noice_ext = require("telescope").load_extension("noice")
vim.keymap.set('n', '<leader>pn', noice_ext.noice, {})
