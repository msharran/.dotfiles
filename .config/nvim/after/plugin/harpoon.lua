vim.cmd([[
nmap <leader>a :lua require("harpoon.mark").add_file()<CR>
nmap <leader>e :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <F9> :lua require("harpoon.ui").nav_file(1)<CR>
nmap <F10> :lua require("harpoon.ui").nav_file(2)<CR>
nmap <F11> :lua require("harpoon.ui").nav_file(3)<CR>
nmap <F12> :lua require("harpoon.ui").nav_file(4)<CR>
]])
