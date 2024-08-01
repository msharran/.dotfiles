-- " Setup colorizer
-- "  NOTE: Getting error &termguicolors is not set despite setting it in options
-- "   So enabling it after all configs are loaded
vim.cmd [[
augroup colorizer
    autocmd!
    autocmd VimEnter * lua require("colorizer").setup()
augroup END
]]

-- " WhichKey
require("which-key").setup()
vim.cmd [[ nnoremap <leader>? :WhichKey<CR> ]]

-- " Comment.nvim
require('Comment').setup()

-- " Setup todo-comments
require("todo-comments").setup()
vim.cmd [[
nnoremap ]t <CMD>lua require("todo-comments").jump_next({ keywords = { "TODO", "FIXME" } })<CR>
nnoremap [t <CMD>lua require("todo-comments").jump_prev({ keywords = { "TODO", "FIXME" } })<CR>
]]

-- Zen mode
require("zen-mode").setup({
    window = {
        backdrop = 0.85, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1,  -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
            signcolumn = "no", -- disable signcolumn
            -- number = false, -- disable number column
            -- relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
        },
    },
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false,   -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
            -- you may turn on/off statusline in zen mode by setting 'laststatus'
            -- statusline will be shown only if 'laststatus' == 3
            laststatus = 0,            -- turn off the statusline in zen mode
        },
        gitsigns = { enabled = true }, -- disables git signs
    },
})
