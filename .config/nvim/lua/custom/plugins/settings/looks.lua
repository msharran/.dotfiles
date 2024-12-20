require("which-key").setup()
require('Comment').setup()

vim.cmd [[
nnoremap <leader>? :WhichKey<CR>

" == Color Scheme ==

" Colorscheme depends on plugins and needs to be set after plugins are loaded
if has('termguicolors') " Important
    set termguicolors
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='embark'
let g:airline_powerline_fonts = 1
colorscheme embark
]]
