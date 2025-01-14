require("which-key").setup()
require('Comment').setup()

vim.cmd [[
nnoremap <leader>? :WhichKey<CR>

" == Color Scheme ==

" Colorscheme depends on plugins and needs to be set after plugins are loaded
if has('termguicolors') " Important
    set termguicolors
endif

set background=light " or light if you want light mode
colorscheme rose-pine
]]
