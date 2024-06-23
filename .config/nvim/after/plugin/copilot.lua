require('copilot').setup({
    panel = { enabled = true },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-e><C-y>",
            accept_word = false,
            accept_line = false,
            next = "<C-e><C-n>",
            prev = "<C-e><C-p>",
            dismiss = "<C-e><C-c>",
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
    },
})

vim.keymap.set("n", "<leader>cs", [[:Copilot status<CR>]])
vim.keymap.set("n", "<leader>cp", [[:Copilot panel<CR>]])
