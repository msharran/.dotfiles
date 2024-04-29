return {
    {
        "github/copilot.vim",
        config = function()
            vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>')
            vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>')
        end
    }
}
