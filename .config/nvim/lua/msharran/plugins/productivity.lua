function display_selection()
    print("\"" .. vim.fn.expand("%") .. "\"" .. " selected")
end

return {
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    { "tpope/vim-vinegar" },
    { "tpope/vim-unimpaired" },
    {
        "theprimeagen/harpoon",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-e>", function()
                ui.nav_file(1)
                display_selection()
            end)
            vim.keymap.set("n", "<C-f>", function()
                ui.nav_file(2)
                display_selection()
            end)
            vim.keymap.set("n", "<C-b>", function()
                ui.nav_file(3)
                display_selection()
            end)
            vim.keymap.set("n", "<C-n>", function()
                ui.nav_file(4)
                display_selection()
            end)
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
            require('telescope').load_extension('fzf')

            -- telescope keymaps
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fw', function()
                local word = vim.fn.expand("<cword>")
                if word == "" then
                    print("No word under cursor")
                    return
                end
                builtin.grep_string({ search = vim.fn.input("Grep > ", word) })
            end)
            vim.keymap.set('n', '<leader>fW', function()
                local word = vim.fn.expand("<cWORD>")
                if word == "" then
                    print("No word under cursor")
                    return
                end
                builtin.grep_string({ search = vim.fn.input("Grep > ", word) })
            end)
        end
    },
    { "christoomey/vim-tmux-navigator" },
}
