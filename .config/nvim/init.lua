vim.cmd [[
let g:mapleader = " "
let g:maplocalleader = ","
]]

-- Install rocks.nvim and luarocks
require("setup-rocks")

-- Setup Vim-Plug and install plugins
require("vim-plug")
