-- Setup UX

-- Colorscheme
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.cmd('silent! colorscheme seoul256')

-- Setup colorizer
-- WARN: Getting error &termguicolors is not set despite setting it in options.lua
-- So enabling it after all configs are loaded
vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('colorize_codes', {}),
    desc = 'Colorize the color codes in the buffer',
    pattern = '*',
    callback = function()
        require("colorizer").setup()
    end,
})

-- Setup WhichKey for keybindings
require("which-key").setup()
vim.keymap.set("n", "<leader>?", "<CMD>WhichKey<CR>", { desc = "Show which-key" })

-- Setup markdown
 require('render-markdown').setup({})

 -- Setup Comment.nvim
 require('Comment').setup()
