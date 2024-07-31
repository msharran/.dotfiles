require("dapui").setup()

-- = Go =
require('dap-go').setup()

vim.cmd [[
" maps
nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dl :lua require'dap'.list_breakpoints()<CR>:cw<CR>
nnoremap <leader>dL :lua require'dap'.clear_breakpoints()<CR>

nnoremap <leader>d; :lua require'dap'.run_last()<CR>
nnoremap <leader>d. :lua require'dap'.run_to_cursor()<CR>
nnoremap <leader>dx :lua require'dap'.terminate()<CR>
nnoremap <leader>dr :lua require'dap'.restart()<CR>

nnoremap <leader>de :lua require("dapui").eval(nil, { enter = true })<CR>
nnoremap <leader>dE :lua require'dap'.repl.open()<CR>

nnoremap <F2> :lua require'dap'.continue()<CR>
nnoremap <F3> :lua require'dap'.step_over()<CR>
nnoremap <F4> :lua require'dap'.step_into()<CR>
nnoremap <F5> :lua require'dap'.step_out()<CR>
nnoremap <F2> silent! call repeat#set("\<Plug>DapContinue", v:count)<CR>
]]
