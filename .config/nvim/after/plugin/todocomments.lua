-- Setup todo-comments
require("todo-comments").setup()

vim.cmd [[
nmap <leader>qt <CMD>Telescope todo-comments keywords=TODO,FIXME<CR>
nmap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nmap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>
]]
