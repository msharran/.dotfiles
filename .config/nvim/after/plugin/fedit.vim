" Open Netrw
nnoremap E :Explore<CR>
" check ftplugin/netrw.vim for more mappings

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
augroup END

" Add current directory and its subdirectories to path
" for downward file search using gf or :find
" Very useful for navigating through a project
set path+=**
nnoremap ge :find *
nnoremap gE :find .**/*
nnoremap gb :b<space>
nnoremap g- :e .<CR>


" Grep
" Use Ag (the_silver_searcher) as grepprg
set grepprg=ag\ --vimgrep\ --hidden
" Search word
nnoremap gw :grep -w "<C-R><C-W>"<CR>
" Search WORD 
nnoremap gW :grep -w "<C-R><C-A>"<CR>
" Pre type :grep command
nnoremap gs :grep ""<Left>

" Autocommand to open quickfix window automatically
" when quickfix list is populated.
augroup quickfix
    autocmd!
    " {pattern} is matched against the quickfix command being run
    " check :h QuickFixCmdPre for more info
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END
