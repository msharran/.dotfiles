return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { "folke/todo-comments.nvim" }
        },
        config = function()
            require("custom.setup.telescope")
        end
    },
}
