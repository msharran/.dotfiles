map <leader>y "+y
nmap Q :noh<CR>
nmap <leader>x :silent !chmod +x %<CR>
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzz
nmap N Nzz
nmap p pzz
nmap P Pzz

" Search word
nmap ,w :grep "<C-R><C-W>"<CR>

" Search WORD 
nmap ,W :grep "<C-R><C-A>"<CR>

" Pre type :grep command
nmap ,g :grep "<C-R><C-A>"<left>
