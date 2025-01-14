" = Yank =
noremap <leader>y "+y
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
augroup END

" = Go to Normal mode when jj is pressed =
inoremap jj <Esc>

" = Buffer =
nnoremap gb :ls<CR>:b<Space>
cnoremap <C-s> *

" = Remove highlight  =
nnoremap Q :noh<CR>

" = Make file executable =
nnoremap <leader>x :silent !chmod +x %<CR>

" = Date and time =
nnoremap <leader>D ms:r !date "+\%d-\%m-\%Y"<CR>dW<Esc>`sp
nnoremap <leader>T ms:r !date "+\%d-\%m-\%Y \%H:\%M \%p \%Z"<CR>dW<Esc>`sp

" = Resize panes =
nnoremap <leader>wt :resize +5<CR>
nnoremap <leader>ws :resize -5<CR>
nnoremap <leader>ww :vertical resize +5<CR>
nnoremap <leader>wn :vertical resize -5<CR>

" = Quickfix =
" Autocommand to open quickfix window automatically
" when quickfix list is populated.
augroup quickfix
    autocmd!
    " {pattern} is matched against the quickfix command being run
    " check :h QuickFixCmdPre for more info
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

noremap <leader>w :w<CR>
