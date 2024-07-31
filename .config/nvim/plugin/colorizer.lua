-- " Setup colorizer
-- "  NOTE: Getting error &termguicolors is not set despite setting it in options
-- "   So enabling it after all configs are loaded
vim.cmd [[
augroup colorizer
    autocmd!
    autocmd VimEnter * lua require("colorizer").setup()
augroup END
]]
