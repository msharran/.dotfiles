local function setup_oil()
    require("oil").setup({
        view_options = {
            show_hidden = true,
        },
        columns = {
            "icon",
            -- "permissions",
        },
        delete_to_trash = true,
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

local function setup_harpoon()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
    vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Toggle harpoon menu" })

    for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function()
            ui.nav_file(i)
            print("\"" .. vim.fn.expand("%") .. "\"" .. ", Harpoon " .. i .. " selected")
        end, { desc = "Harpoon file " .. i })
    end
end

local function setup_telescope()
    require('telescope').setup {
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    require('telescope').load_extension('fzf')

    -- telescope keymaps
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp tags" })
    vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = "[F]ind [M]an pages" })
    vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope keywords=TODO,FIX,HACK<CR>", { desc = "[F]ind [T]odos" })
end

local function setup_todo_comment()
    require("todo-comments").setup()
    vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next({ keywords = { "TODO", "HACK" } })
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev({ keywords = { "TODO", "HACK" } })
    end, { desc = "Previous todo comment" })
end

return {
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    { "tpope/vim-unimpaired" },
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = setup_oil
    },
    {
        "theprimeagen/harpoon",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = setup_harpoon
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            {
                "folke/todo-comments.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
                config = setup_todo_comment
            }
        },
        config = setup_telescope
    },
    { "christoomey/vim-tmux-navigator" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup()
            vim.keymap.set("n", "<leader>?", "<CMD>WhichKey<CR>", { desc = "Show which-key" })
        end
    },
}
