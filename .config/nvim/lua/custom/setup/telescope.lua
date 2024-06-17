-- Setup Telescope
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                       -- false will only do exact matching
            override_generic_sorter = true,     -- override the generic sorter
            override_file_sorter = true,        -- override the file sorter
            case_mode = "smart_case",           -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

-- Add FZF telescope extension which enables
-- fzf search query syntax
require('telescope').load_extension('fzf')

-- Add telescope keymaps with <leader>s prefix
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>ss', function()
    local query = vim.fn.input("Search string: ")
    if query == "" then
        return
    end
    builtin.grep_string({ search = query })
end, { desc = "[S]earch [S]tring" })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "[S]earch [W]ord under cursor" })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp tags" })
vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = "[S]earch [M]an pages" })


-- Setup todo-comments
require("todo-comments").setup()

-- Add Telescope todo-comments keymap
vim.keymap.set("n", "<leader>st", "<CMD>Telescope todo-comments keywords=TODO,FIX,HACK<CR>",
    { desc = "[S]earch [T]odos" })

-- Add todo-comments navigation keymaps
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next({ keywords = { "TODO", "HACK" } })
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev({ keywords = { "TODO", "HACK" } })
end, { desc = "Previous todo comment" })
