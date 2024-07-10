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

" Grep
" Use Ag (the_silver_searcher) as grepprg
set grepprg=ag\ --vimgrep\ --hidden
" Search word
nnoremap <Leader>w :grep -w "<C-R><C-W>"<CR>
" Search WORD 
nnoremap <Leader>W :grep -w "<C-R><C-A>"<CR>
" Pre type :grep command
nnoremap <Leader>s :grep ""<Left>
" Autocommand to open quickfix window automatically
" when quickfix list is populated.
augroup quickfix
    autocmd!
    " {pattern} is matched against the quickfix command being run
    " check :h QuickFixCmdPre for more info
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" When fzf starts in a terminal buffer, the file type of the buffer is set to
" `fzf`. So you can set up `FileType fzf` autocmd to customize the settings of
" the window.
"
" For example, if you open fzf on the bottom on the screen (e.g. `{'down':
" '40%'}`), you might want to temporarily disable the statusline for a cleaner
" look.
nnoremap <Leader>f :Files<CR> 
let g:fzf_layout = { 'down': '25%' }

augroup fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
augroup END
