require('copilot').setup({
    panel = { enabled = true },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-x><C-y>",
            accept_word = false,
            accept_line = false,
            next = "<C-x><C-n>",
            prev = "<C-x><C-p>",
            dismiss = "<C-x><C-c>",
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
    },
})

vim.keymap.set("n", "<leader>cs", [[:Copilot status<CR>]])
vim.keymap.set("n", "<leader>cp", [[:Copilot panel<CR>]])
