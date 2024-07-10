" Setup colorizer
"  NOTE: Getting error &termguicolors is not set despite setting it in options
"   So enabling it after all configs are loaded
augroup colorizer
    autocmd!
    autocmd VimEnter * lua require("colorizer").setup()
augroup END

" WhichKey
lua require("which-key").setup()
nnoremap <leader>? :WhichKey<CR>

" Comment.nvim
lua require('Comment').setup()

" Setup todo-comments
lua require("todo-comments").setup()
nnoremap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nnoremap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>
