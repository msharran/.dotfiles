function display_selection()
    print("\"" .. vim.fn.expand("%") .. "\"" .. " selected")
end

return {
    {
        "theprimeagen/harpoon",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-e>", function()
                ui.nav_file(1)
                display_selection()
            end)
            vim.keymap.set("n", "<C-f>", function()
                ui.nav_file(2)
                display_selection()
            end)
            vim.keymap.set("n", "<C-b>", function()
                ui.nav_file(3)
                display_selection()
            end)
            vim.keymap.set("n", "<C-n>", function()
                ui.nav_file(4)
                display_selection()
            end)
        end
    }
}
