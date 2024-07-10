" vim-go settings
let g:go_addtags_transform = "camelcase"

" Set buffer local mappings with _ prefix
" making _ available for other filetype 
" specific mappings
nnoremap <buffer> <LocalLeader>f :GoTestFile<CR>
nnoremap <buffer> <LocalLeader>F :GoTestFunc<CR>
nnoremap <buffer> <LocalLeader>b :GoBuild<CR>
nnoremap <buffer> <LocalLeader>t :GoAddTags
nnoremap <buffer> <LocalLeader>a :GoAlternate<CR>

" DAP Go specific mappings
nnoremap <buffer> <Leader>dt :lua require('dap-go').debug_test()<CR>

" Go snippets
iabbrev <buffer> ife$ if err != nil {<CR><Space>return<CR>}<Esc><Up>A
iabbrev <buffer> iff$ if err != nil {<CR><Space>log.Fatal(err)<CR>}<CR>
