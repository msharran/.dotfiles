return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter',
                build = ':TSUpdate',
            },
            { "nvim-treesitter/nvim-treesitter-context" },
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
            -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { 'folke/neodev.nvim',                      opts = {} },
        },
        config = function()
            require("custom.setup.lsp")
        end
    }
}
