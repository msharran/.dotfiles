return {
    { 'junegunn/seoul256.vim' },
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
    },
    { "folke/which-key.nvim",        event = "VeryLazy", },
    { 'chentoast/marks.nvim',        opts = {} },
    { "norcalli/nvim-colorizer.lua", },
    {
        'MeanderingProgrammer/markdown.nvim',
        main = "render-markdown",
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
}
