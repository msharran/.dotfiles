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
nnoremap gb :ls<CR>:b<Space>
cnoremap <C-s> *

" Break down the following command:
"   :let @z=expand("%:t")<CR> - Get the current file name and store it in register z
"   :Ex<CR> - Open the file explorer
"   /<C-R>z<CR> - Search for the file name in the file explorer
"   :noh<CR> - Clear the search highlight
nnoremap <leader>e :let @z=expand("%:t")<CR>:Ex<CR>/<C-R>z<CR>:noh<CR>

" Grep
" Use Rg as grepprg
set grepprg=rg\ --vimgrep\ --hidden
" Search word
nnoremap gw :grep -w "<C-R><C-W>"<CR>
" Search WORD 
nnoremap gW :grep -w "<C-R><C-A>"<CR>
" Pre type :grep command
nnoremap gs :grep ""<Left>
" Search selected text. Yank selection to `s` register and search for it.
vnoremap gs "sy:grep "<C-R>s"<CR>`>
vnoremap gw "sy:grep -w "<C-R>s"<CR>`>

" Autocommand to open quickfix window automatically
" when quickfix list is populated.
augroup quickfix
    autocmd!
    " {pattern} is matched against the quickfix command being run
    " check :h QuickFixCmdPre for more info
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" some useful maps
noremap <leader>y "+y
nnoremap Q :noh<CR>
nnoremap <leader>x :silent !chmod +x %<CR>

" Date and time
nnoremap <leader>D ms:r !date "+\%d-\%m-\%Y"<CR>dW<Esc>`sp
nnoremap <leader>T ms:r !date "+\%d-\%m-\%Y \%H:\%M \%p \%Z"<CR>dW<Esc>`sp

" Resize panes
nnoremap <leader>= :resize +5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>. :vertical resize +5<CR>
nnoremap <leader>, :vertical resize -5<CR>
