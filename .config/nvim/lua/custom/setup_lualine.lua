require('lualine').setup({
    options = {
        theme = 'auto',
        section_separators = { left = "", right = "" },
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
