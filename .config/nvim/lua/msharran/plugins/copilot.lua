return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-]>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-[>",
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
    }
}
