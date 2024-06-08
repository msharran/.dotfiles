return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'catppuccin',
                    section_separators = { left = "", right = "" },
                    icons_enabled = true,
                    component_separators = { left = '|', right = '|' },
                    always_divide_middle = true
                },
                sections = {
                    -- left
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },

                    -- right
                    lualine_x = {
                        {
                            'copilot',
                            -- Default values
                            symbols = {
                                status = {
                                    icons = {
                                        enabled = " ",
                                        sleep = " ", -- auto-trigger disabled
                                        disabled = " ",
                                        warning = " ",
                                        unknown = " "
                                    },
                                    hl = {
                                        enabled = "#50FA7B",
                                        sleep = "#AEB7D0",
                                        disabled = "#6272A4",
                                        warning = "#FFB86C",
                                        unknown = "#FF5555"
                                    }
                                },
                                spinners = require("copilot-lualine.spinners").dots,
                                spinner_color = "#6272A4"
                            },
                            show_colors = true,
                            show_loading = true
                        },
                        'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                extensions = { 'quickfix', 'fugitive', 'fzf' },
            })
        end
    },
    { 'AndreM222/copilot-lualine' },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        'MeanderingProgrammer/markdown.nvim',
        name = 'render-markdown',     -- Only needed if you have another plugin named markdown.nvim
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('render-markdown').setup({})
        end,
    },
    {
        'chentoast/marks.nvim',
        config = function()
            require 'marks'.setup({})
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                term_colors = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    markdown = true,
                    telescope = {
                        enabled = true,
                        style = "nvchad"
                    }
                }
            })

            -- setup must be called before setting colorscheme
            vim.cmd([[colorscheme catppuccin]])
        end
    }
}
