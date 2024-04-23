return {
    {
        "ctrlpvim/ctrlp.vim",
        config = function ()
            vim.g.ctrlp_show_hidden = 1
            vim.keymap.set("n", "<C-p>", [[:CtrlP<CR>]])
        end
    }
}
