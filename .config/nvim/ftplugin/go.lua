-- vim-go settings
vim.g.go_addtags_transform = "camelcase"

-- test keymapsw
vim.keymap.set("n", "<leader>lta", ":GoTest<CR>" , { desc = "Test all" })
vim.keymap.set("n", "<leader>lt%", ":GoTestFile<CR>" , { desc = "Test file" })
vim.keymap.set("n", "<leader>ltf", ":GoTestFunc<CR>" , { desc = "Test func" })

-- add templ filetype
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
