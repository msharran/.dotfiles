-- " Setup colorizer
-- "  NOTE: Getting error &termguicolors is not set despite setting it in options
-- "   So enabling it after all configs are loaded
vim.cmd [[
augroup colorizer
    autocmd!
    autocmd VimEnter * lua require("colorizer").setup()
augroup END
]]

-- " WhichKey
require("which-key").setup()
vim.cmd [[ nnoremap <leader>? :WhichKey<CR> ]]

-- " Comment.nvim
require('Comment').setup()

-- " Setup todo-comments
require("todo-comments").setup()
vim.cmd [[
nnoremap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nnoremap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>
]]
