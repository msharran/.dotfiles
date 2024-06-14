return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", "<cmd>:tab Git<CR>", { desc = "[G]it [S]tatus" })
        end,
    },
    {
        'ruifm/gitlinker.nvim',
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require('gitlinker').setup({
                mappings = nil
            })
            vim.api.nvim_set_keymap('n', '<leader>gy',
                '<cmd>lua require"gitlinker".get_buf_range_url("n", {})<cr>',
                { desc = "[G]it [Y]ank current line url" })

            vim.api.nvim_set_keymap('v', '<leader>gy',
                '<cmd>lua require"gitlinker".get_buf_range_url("v", {})<cr>',
                { desc = "[G]it [Y]ank selected line(s) url" })

            vim.api.nvim_set_keymap('n', '<leader>gb',
                '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                { silent = true, desc = "[G]it [B]rowse current line url" })

            vim.api.nvim_set_keymap('v', '<leader>gb',
                '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                { desc = "[G]it [B]rowse selected line(s) url" })

            vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>',
                { silent = true, desc = "[G]it [Y]ank repo url" })

            vim.api.nvim_set_keymap('n', '<leader>gB',
                '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                { silent = true, desc = "[G]it [B]rowse repo url" })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup({
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']g', function()
                        if vim.wo.diff then return ']g' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = "Next Git Hunk" })

                    map('n', '[g', function()
                        if vim.wo.diff then return '[g' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = "Prev Git hunk" })

                    -- Actions
                    map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('n', '<leader>gR', gs.reset_buffer, { desc = "[G]it [R]eset buffer" })
                    map('n', '<leader>gp', gs.preview_hunk, { desc = "[G]it [P]review hunk" })
                    map('n', '<leader>gd', gs.toggle_deleted, { desc = "[G]it [D]eleted toggle" })
                end
            })
        end
    },
}
