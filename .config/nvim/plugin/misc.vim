" Setup colorizer
"  NOTE: Getting error &termguicolors is not set despite setting it in options
"   So enabling it after all configs are loaded
augroup colorizer
    autocmd!
    autocmd VimEnter * lua require("colorizer").setup()
augroup END

" WhichKey
lua require("which-key").setup()
nmap <leader>? :WhichKey<CR>

" markdown
lua require('render-markdown').setup({})

" Comment.nvim
lua require('Comment').setup()


" Setup todo-comments
lua require("todo-comments").setup()
nmap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nmap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>
