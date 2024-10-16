" Colorscheme depends on plugins and needs to be set after plugins are loaded
if has('termguicolors') " Important
    set termguicolors
endif

" Lightline
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }

" = Goyo + Limelight for ZenMode = 
autocmd! User GoyoEnter set number relativenumber
" autocmd! User GoyoLeave Limelight!

colorscheme embark
