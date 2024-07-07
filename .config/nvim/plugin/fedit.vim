" Open Netrw
nmap - :Explore<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
augroup END

" Add current directory and its subdirectories to path
" for downward file search using gf or :find
" Very useful for navigating through a project
set path+=**

" Grep
" Use Ag (the_silver_searcher) as grepprg
set grepprg=ag\ --vimgrep\ --hidden
" Search word
nmap ,w :grep "<C-R><C-W>"<CR>
" Search WORD 
nmap ,W :grep "<C-R><C-A>"<CR>
" Pre type :grep command
nmap ,g :grep ""<left>
