-- Setup LuaSnip
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- Load friendly-snippets using luasnip
-- Refer: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#vs-code
require("luasnip.loaders.from_vscode").lazy_load()
-- NOTE: You can add custom snippets stored in a directory. Refer
-- the above link for more information.

-- Setup Completion
local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            -- For `luasnip` users.
            ls.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
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
