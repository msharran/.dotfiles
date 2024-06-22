vim.keymap.set("n", "-", ":Ex<CR>", { desc = "Open Netrw" })

-- add current directory and its subdirectories to path
-- for downward file search using gf or find
-- Very useful for navigating through a project
vim.opt.path:append("**")
