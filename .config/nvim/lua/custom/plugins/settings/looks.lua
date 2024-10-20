require("which-key").setup()
require('Comment').setup()
require("todo-comments").setup()

vim.cmd [[
nnoremap <leader>? :WhichKey<CR>
nnoremap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nnoremap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>


" == Color Scheme ==

" Colorscheme depends on plugins and needs to be set after plugins are loaded
if has('termguicolors') " Important
    set termguicolors
endif

" = Goyo = 
autocmd! User GoyoEnter set number relativenumber

let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }
let g:embark_terminal_italics = 1
colorscheme embark
]]
