vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", ":noh<CR>", { desc = "Clear highlights" })
vim.keymap.set("n", "<leader>w", ":w<CR>" , { desc = "Save file" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find and Replace word under cursor" })

-- grep
vim.keymap.set("n", "<leader>fw", [[:grep -w <C-r><C-w><CR><Esc>:cw<CR>]], { desc = "[F]ind [W]ord under cursor" })
vim.keymap.set("n", "<leader>fW", [[:grep -i -w <C-r><C-w><CR><Esc>:cw<CR>]], { desc = "[F]ind [W]ord under cursor (insensitive)" })
vim.keymap.set("n", "<leader>fs", [[:grep ]] , { desc = "[F]ind [S]tring" })
vim.keymap.set("n", "<leader>fS", [[:grep -i ]], { desc = "[F]ind [S]tring (insensitive)" })

--quickfix
vim.keymap.set("n", "<leader>q", ":copen<CR>", { desc = "Open quickfix" })
