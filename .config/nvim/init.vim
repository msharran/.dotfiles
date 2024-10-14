" = Defaults before plugins =
let g:mapleader = " "
let g:maplocalleader = ","
set nocompatible
filetype plugin on
syntax on

" = Vim Plug =

" == Plugins ==
lua require("sharran.plugins")

" == Plugin Settings ==
lua require("sharran.plugins.settings")

" == AutoInstall Plugins ==
lua require("sharran.plugins.autoinstall")
