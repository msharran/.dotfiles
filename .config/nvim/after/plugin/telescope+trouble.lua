-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set("n", "<leader>fto", "<cmd>TodoTelescope keywords=TODO,FIX<cr>")
require('telescope').load_extension('fzf')

-- trouble
vim.keymap.set("n", "<leader>fd", "<cmd>TroubleToggle document_diagnostics<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>TroubleToggle quickfix<cr>")
