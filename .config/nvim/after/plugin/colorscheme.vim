" Important!!
if has('termguicolors')
    set termguicolors
endif

set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'

" For better performance
let g:gruvbox_material_better_performance = 1

let g:gruvbox_material_enable_italic = 1

let g:gruvbox_material_enable_bold = 1

colorscheme gruvbox-material
