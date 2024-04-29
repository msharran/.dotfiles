return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs","<cmd>:tab Git<CR>")
        end,
        dependencies = "tpope/vim-rhubarb" -- :GBrowse GitHub support
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
                    end, {expr=true})

                    map('n', '[g', function()
                        if vim.wo.diff then return '[g' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                    -- Actions
                    map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    map('n', '<leader>gR', gs.reset_buffer)
                    map('n', '<leader>gp', gs.preview_hunk)
                    map('n', '<leader>gd', gs.toggle_deleted)
                end
            })
        end
    },
}
