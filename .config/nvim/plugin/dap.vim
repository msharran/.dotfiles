lua require("setup.dap")

" maps
nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dB :lua require'dap'.list_breakpoints()<CR>:cw<CR>
nnoremap <leader>dC :lua require'dap'.clear_breakpoints()<CR>
nnoremap <leader>dc :lua require'dap'.continue()<CR>
nnoremap <leader>dl :lua require'dap'.run_last()<CR>
nnoremap <leader>dt :lua require'dap'.terminate()<CR>
nnoremap <leader>dn :lua require'dap'.step_over()<CR>
nnoremap <leader>di :lua require'dap'.step_into()<CR>
nnoremap <leader>do :lua require'dap'.step_out()<CR>
nnoremap <leader>dp :lua require'dap'.step_back()<CR>
nnoremap <leader>d. :lua require'dap'.run_to_cursor()<CR>
nnoremap <leader>dR :lua require'dap'.restart()<CR>
nnoremap <leader>de :lua require("dapui").eval(nil, { enter = true })<CR>
" NOTE: use C-X C-O to open the completion menu in the REPL
nnoremap <leader>dr :lua require'dap'.repl.open()<CR>
