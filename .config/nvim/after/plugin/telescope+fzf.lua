-- FZF
vim.keymap.set('n', '<C-p>', ':Files<cr>', {})
vim.keymap.set('n', '<leader>sl', ':BLines<cr>', {})
vim.keymap.set('n', '<leader>sw', ':Rg<cr>', {})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>sq", "<cmd>Telescope quickfix<cr>")
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set("n", "<leader>std", "<cmd>TodoTelescope keywords=TODO,FIX<cr>")
