-- Setup UX

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

-- Setup Oil for file explorer
require("oil").setup({
    view_options = {
        show_hidden = true,
    },
    columns = {
        "icon",
    },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Setup WhichKey for keybindings
require("which-key").setup()
vim.keymap.set("n", "<leader>?", "<CMD>WhichKey<CR>", { desc = "Show which-key" })

-- Setup Markdown for in-buffer rendering of markdown files.
-- lua module name differs from the plugin name, hence opt = {} in
-- plugin config does not work.
require('render-markdown').setup({})

-- Setup Colorscheme
require("catppuccin").setup({
    flavour = "mocha",
    term_colors = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        markdown = true,
        telescope = {
            enabled = true,
            style = "nvchad"
        },
        dropbar = {
            enabled = true,
            color_mode = true,
        },
    }
})

vim.cmd([[colorscheme catppuccin]])
