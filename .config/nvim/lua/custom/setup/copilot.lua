require('copilot').setup({
    panel = { enabled = false },
    suggestion = { enabled = false, },
    filetypes = {
        yaml = true,
        markdown = true,
    },
})

vim.keymap.set("n", "<leader>cs", [[:Copilot status<CR>]])
vim.keymap.set("n", "<leader>cp", [[:Copilot panel<CR>]])
