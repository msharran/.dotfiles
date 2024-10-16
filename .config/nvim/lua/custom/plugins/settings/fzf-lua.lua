require("fzf-lua").setup({
    winopts = {
        split = "belowright new",
        backdrop         = 85,
    }
})

vim.cmd [[
nnoremap ge <cmd>lua require('fzf-lua').files()<CR>
nnoremap gs :FzfLua grep<CR>
nnoremap gw :FzfLua grep_cword<CR> 
nnoremap gW :FzfLua grep_cWORD<CR>
]]
