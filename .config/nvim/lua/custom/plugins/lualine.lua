return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            { 'AndreM222/copilot-lualine', opt = {} },
        },
        config = function()
            require("custom.setup_lualine")
        end
    },
}
