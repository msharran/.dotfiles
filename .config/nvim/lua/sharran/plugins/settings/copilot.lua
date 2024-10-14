require('copilot').setup({
    panel = { enabled = false },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-b><C-y>",
            accept_word = false,
            accept_line = false,
            next = "<C-b><C-n>",
            prev = "<C-b><C-p>",
            dismiss = "<C-b><C-c>",
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
    },
})
