require("rose-pine").setup({
	highlight_groups = {
		CurSearch = { fg = "base", bg = "leaf", inherit = false },
		Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
	},
})

vim.cmd [[
" Colorscheme depends on plugins and needs to be set after plugins are loaded
if has('termguicolors') " Important
    set termguicolors
endif

set background=dark " or light if you want light mode
colorscheme rose-pine
]]
