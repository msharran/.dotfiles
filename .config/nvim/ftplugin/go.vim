" vim-go settings
let g:go_addtags_transform = "camelcase"

" Set buffer local mappings with _ prefix
" making _ available for other filetype 
" specific mappings
nmap <buffer> _<F10> :GoTest<CR>
nmap <buffer> _<F11> :GoTestFile<CR>
nmap <buffer> _<F12> :GoTestFunc<CR>
