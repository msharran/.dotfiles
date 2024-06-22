-- vim-go settings
vim.g.go_addtags_transform = "camelcase"

-- test keymaps
vim.keymap.set("n", "<leader>ta", ":GoTest<CR>" , { desc = "[T]est [A]ll" })
vim.keymap.set("n", "<leader>tf", ":GoTestFile<CR>" , { desc = "[T]est [F]ile" })
vim.keymap.set("n", "<leader>tc", ":GoTestFunc<CR>" , { desc = "[T]est fun[C]" })

-- add templ filetype
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
