vim.cmd[[
" Setup colorizer
"  NOTE: Getting error &termguicolors is not set despite setting it in options
"   So enabling it after all configs are loaded
augroup colorizer
    autocmd!
    autocmd VimEnter * lua require("colorizer").setup()
augroup END
]]

-- Setup WhichKey
require("which-key").setup()
vim.cmd [[nmap <leader>? :WhichKey<CR>]]

-- Setup markdown
require('render-markdown').setup({})

-- Setup Comment.nvim
require('Comment').setup()
