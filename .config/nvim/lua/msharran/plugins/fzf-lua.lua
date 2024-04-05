return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            { "junegunn/fzf", build = "./install --bin" }
        },
        config = function()
            require('fzf-lua').setup({
                grep = {
                    grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
                    rg_opts = "--column --hidden --line-number --color=always --smart-case --max-columns=4096 -e",
                },
            })

            -- vim.keymap.set("n", "<C-p>","<cmd>lua require('fzf-lua').git_files({ cmd = 'git ls-files --exclude-standard --cached --others' })<CR>" , { silent = true })
            vim.keymap.set("n", "<C-p>","<cmd>:FZF<CR>" , { silent = true })
            vim.keymap.set("n", "<leader>st", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
            vim.keymap.set("n", "<leader>sl", "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })
            vim.keymap.set("n", "<leader>sm", "<cmd>lua require('fzf-lua').man_pages()<CR>", { silent = true })
            vim.keymap.set("n", "<leader>ss", "<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>", { silent = true })
        end
    },
}
