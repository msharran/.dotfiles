" vim-go settings
let g:go_addtags_transform = "camelcase"

" Set buffer local mappings with _ prefix
" making _ available for other filetype 
" specific mappings
nmap <buffer> <LocalLeader>t :GoTestFunc<CR>

" Go snippets
iabbrev <buffer> ife$ if err != nil {<CR><Space>return<CR>}<Esc><Up>A
iabbrev <buffer> iff$ if err != nil {<CR><Space>log.Fatal(err)<CR>}<CR>
