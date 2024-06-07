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
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    { "christoomey/vim-tmux-navigator" }
}
