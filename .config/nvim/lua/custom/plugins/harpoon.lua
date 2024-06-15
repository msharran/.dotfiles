return {
    {
        "theprimeagen/harpoon",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("custom.setup_harpoon")
        end
    },
}
