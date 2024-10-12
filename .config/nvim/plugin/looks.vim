" WhichKey
lua require("which-key").setup()
nnoremap <leader>? :WhichKey<CR>

" Comment.nvim
lua require('Comment').setup()

" Setup todo-comments
lua require("todo-comments").setup()
nnoremap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nnoremap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>
