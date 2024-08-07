require('presenting').setup({
    options = {
        width = 95,
    },
    separator = {
        norg = "^*+ ",
    }
})

vim.cmd [[
nnoremap <leader>atd :.!toilet -f mono12<CR>
nnoremap <leader>atb :.!toilet -f mono12 -F border<CR>
nnoremap <leader>ahd :.!toilet -f emboss<CR>
nnoremap <leader>ahb :.!toilet -f emboss -F border<CR>
]]
