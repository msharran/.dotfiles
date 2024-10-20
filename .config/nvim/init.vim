" = Defaults before plugins =
let g:mapleader = " "
let g:maplocalleader = ","
" disable netrw at the very start of init.lua, required by nvim-tree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" == Plugins ==
lua require("custom.plugins.vimplug")
lua require("custom.plugins.settings")
