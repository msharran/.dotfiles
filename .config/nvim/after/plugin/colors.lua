require("catppuccin").setup {
    term_colors = true,
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    },
}

vim.cmd.colorscheme "catppuccin"
