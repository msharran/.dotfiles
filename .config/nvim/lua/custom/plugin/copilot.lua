return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("custom.setup.copilot")
        end
    }
}
