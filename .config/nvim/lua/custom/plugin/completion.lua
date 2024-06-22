return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- nvim-cmp sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            -- nvim-cmp snippets
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                build = "make install_jsregexp",
                dependencies = {
                    -- Friendly Snippets have sane defaults for a lot of languages
                    "rafamadriz/friendly-snippets"
                },
            },
            "saadparwaiz1/cmp_luasnip",

            -- nvim-cmp pictograms
            "onsails/lspkind.nvim",

            -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { 'folke/neodev.nvim',     opts = {} },
        },
        config = function()
            require("custom.setup.completion")
        end
    },
}
