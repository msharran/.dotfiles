return {
    { 
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                -- a list of parser names, or "all"
                ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "go", "bash", "templ" },

                -- install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- automatically install missing parsers when entering buffer
                -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- using this option may slow down your editor, and you may see some duplicate highlights.
                    -- instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = { "markdown" },
                },
            }
        end
    },
    { "nvim-treesitter/nvim-treesitter-context" },
}
