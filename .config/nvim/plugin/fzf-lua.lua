require("fzf-lua").setup({
    winopts = {
        split = "belowright new",
        backdrop         = 85,
    }
})

vim.cmd [[
nnoremap <C-p> <cmd>lua require('fzf-lua').files()<CR>
]]
