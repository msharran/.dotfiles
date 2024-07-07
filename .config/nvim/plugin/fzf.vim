" When fzf starts in a terminal buffer, the file type of the buffer is set to
" `fzf`. So you can set up `FileType fzf` autocmd to customize the settings of
" the window.
"
" For example, if you open fzf on the bottom on the screen (e.g. `{'down':
" '40%'}`), you might want to temporarily disable the statusline for a cleaner
" look.

" , as search prefix
nmap ,f :Files<CR> 
let g:fzf_layout = { 'down': '30%' }

augroup fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
augroup END
