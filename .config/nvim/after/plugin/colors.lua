require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    },
    integrations = {
        telescope = {
            enabled = true,
            style = "nvchad",
        },
        dropbar = {
            enabled = true,
            color_mode = true,
        },
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
