-- Vimwiki
vim.cmd [[
let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
]]

-- Markdown.nvim 
require('render-markdown').setup({
    file_types = { 'markdown', 'vimwiki' },
})
vim.treesitter.language.register('markdown', 'vimwiki')

vim.cmd [[
let g:mkdp_filetypes = ['markdown', 'vimwiki']
]]
