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
