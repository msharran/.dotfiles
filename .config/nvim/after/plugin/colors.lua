require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
