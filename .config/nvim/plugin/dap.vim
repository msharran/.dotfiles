lua require("setup.dap")

" maps
nnoremap \b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap \l :lua require'dap'.list_breakpoints()<CR>:cw<CR>
nnoremap \L :lua require'dap'.clear_breakpoints()<CR>

nnoremap \; :lua require'dap'.run_last()<CR>
nnoremap \. :lua require'dap'.run_to_cursor()<CR>
nnoremap \x :lua require'dap'.terminate()<CR>
nnoremap \r :lua require'dap'.restart()<CR>

nnoremap \e :lua require("dapui").eval(nil, { enter = true })<CR>
nnoremap \E :lua require'dap'.repl.open()<CR>

nnoremap <F2> :lua require'dap'.continue()<CR>
nnoremap <F3> :lua require'dap'.step_over()<CR>
nnoremap <F2> :lua require'dap'.step_into()<CR>
nnoremap <F2> :lua require'dap'.step_out()<CR>
