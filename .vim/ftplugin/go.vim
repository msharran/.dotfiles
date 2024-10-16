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

" Go snippets
iabbrev <buffer> ife$ if err != nil {<CR><Space>return<CR>}<Esc><Up>A
iabbrev <buffer> iff$ if err != nil {<CR><Space>log.Fatal(err)<CR>}<CR>
iabbrev <buffer> pd$ fmt.Println("::::::: DEBUG :::::::",)<Left>
iabbrev <buffer> pdf$ fmt.Printf("::::::: DEBUG ::::::: %v\n",)<Left>
iabbrev <buffer> ft$ func Test<Esc>mza(t *testing.T) {<CR>}<CR><ESC>`z
iabbrev <buffer> ftr$ t.Run("<Esc>mza", func(t *testing.T) {<CR>})<CR><ESC>`z
