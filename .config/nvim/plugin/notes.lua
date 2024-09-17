-- Vimwiki
-- Not using any Markdown rendering plugin,
-- Keeping it minimal with vimwiki. Inspired 
-- by https://papereditor.app
vim.cmd [[
let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
]]

-- Markdown Preview
vim.cmd [[
let g:mkdp_filetypes = ['markdown', 'vimwiki']
]]
