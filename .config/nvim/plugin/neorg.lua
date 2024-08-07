require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                },
                default_workspace = "notes",
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            }
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.esupports.indent"] = {},
        ["core.itero"] = {},
        ["core.promo"] = {},
        ["core.export"] = {},
        ["core.text-objects"] = {},
    },
}

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
