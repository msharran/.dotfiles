local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local msharran_grp = augroup('msharran', {})
autocmd('LspAttach', {
    group = msharran_grp,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gR", "<cmd>:Trouble lsp_references<cr>", opts)
        vim.keymap.set("n", "gI", "<cmd>:Trouble lsp_implementations<cr>", opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        -- v stands for vim
        vim.keymap.set("n", "<leader>vw", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", "<cmd>:Trouble document_diagnostics<cr>", opts)
        vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
    end
})

function setupcopilot()
    -- copilot
    require('copilot').setup({
        panel = { enabled = true },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<C-L>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-H>",
            },
        },
        filetypes = {
            yaml = true,
            markdown = true,
        },
    })

    vim.keymap.set("n", "<leader>cs", [[:Copilot status<CR>]])
    vim.keymap.set("n", "<leader>cp", [[:Copilot panel<CR>]])
end

return {
    { "fatih/vim-go" },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "SirVer/ultisnips",
            "j-hui/fidget.nvim",
            "folke/trouble.nvim",
            "onsails/lspkind.nvim",
            -- copilot
            "zbirenbaum/copilot.lua",
        },

        config = function()
            setupcopilot()
            local cmp = require('cmp')
            local cmp_lsp = require("cmp_nvim_lsp")
            local lspkind = require('lspkind')
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            require("fidget").setup({})
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "gopls",
                    "solargraph",
                    "rubocop"
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,
                }
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp",               keyword_length = 1 },
                    { name = "nvim_lsp_signature_help" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "nvim_lua" }
                }, {
                    { name = 'buffer' },
                }),
                -- ordered by priority
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol",
                        max_width = 50,
                        symbol_map = { Copilot = "" }
                    })
                },
            })

            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

        end
    }
}
