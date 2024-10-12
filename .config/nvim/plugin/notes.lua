-- Vimwiki
-- Not using any Markdown rendering plugin,
-- Keeping it minimal with vimwiki. Inspired
-- by https://papereditor.app
vim.cmd [[
let g:vimwiki_list = [{'path': '~/Dropbox/',
                      \ 'syntax': 'markdown', 'ext': 'md', 'auto_tags': 1}]
]]

-- Markdown Preview
vim.cmd [[
let g:mkdp_filetypes = ['markdown', 'vimwiki']
]]

-- Markdown
require('render-markdown').setup({
    file_types = { 'markdown', 'vimwiki' },
})
vim.treesitter.language.register('markdown', 'vimwiki')
